#!/usr/bin/env bash
set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
missing=0

required_files=(
  "README.md"
  "AGENTS.md"
  "CONTRIBUTING.md"
  "SECURITY.md"
  "CHANGELOG.md"
  "ROADMAP.md"
  "STATUS.md"
  "docs/roadmap-standard.md"
  "docs/status-language.md"
  "docs/public-private-boundaries.md"
  "docs/review-gates.md"
  "docs/release-readiness.md"
  "docs/repo-index.md"
  "docs/graphs/roadmap-map.md"
  "docs/graphs/repo-status-map.md"
  "docs/graphs/release-readiness-flow.md"
  "docs/graphs/public-private-boundary-map.md"
  "templates/roadmap-item.template.md"
  "templates/status-entry.template.md"
  "templates/release-readiness-checklist.template.md"
  "scripts/validate-public-roadmap.sh"
)

required_graph_sections=(
  "## Purpose"
  "## Mermaid Diagram"
  "## Interpretation Notes"
  "## Boundary Notes"
  "## Follow-Up Actions"
)

printf "218-network repository validation: foundation-public-roadmap\n"
printf "Root: %s\n\n" "$ROOT_DIR"

for file in "${required_files[@]}"; do
  if [ -f "$ROOT_DIR/$file" ]; then
    printf "PASS  %s\n" "$file"
  else
    printf "FAIL  %s\n" "$file"
    missing=$((missing + 1))
  fi
done

printf "\nGraph section checks\n"
for graph in "$ROOT_DIR"/docs/graphs/*.md; do
  [ -f "$graph" ] || continue
  rel="${graph#$ROOT_DIR/}"
  for section in "${required_graph_sections[@]}"; do
    if grep -qF "$section" "$graph"; then
      printf "PASS  %s contains %s\n" "$rel" "$section"
    else
      printf "FAIL  %s missing %s\n" "$rel" "$section"
      missing=$((missing + 1))
    fi
  done
done

printf "\nStatus and boundary checks\n"
for term in planned scaffolded published released paused deprecated "private/not-public"; do
  pattern="\`$term\`"
  if grep -RqsF "$pattern" "$ROOT_DIR" --exclude-dir=.git; then
    printf "PASS  status label present: %s\n" "$term"
  else
    printf "FAIL  status label missing: %s\n" "$term"
    missing=$((missing + 1))
  fi
done

if grep -RInE '(api[_-]?key|secret|token|password)[[:space:]]*[:=][[:space:]]*[^[:space:]]+' "$ROOT_DIR" --exclude-dir=.git; then
  printf "FAIL  possible secret assignment found\n"
  missing=$((missing + 1))
else
  printf "PASS  no obvious secret assignments found\n"
fi

if grep -RInE 'Status[[:space:]]*:[[:space:]]*(live|active|operational|deployed)' "$ROOT_DIR" --exclude-dir=.git; then
  printf "FAIL  unsupported live/active/deployed status phrasing found\n"
  missing=$((missing + 1))
else
  printf "PASS  no unsupported live/active/deployed status phrasing found\n"
fi

printf "\nValidation result\n"
if [ "$missing" -eq 0 ]; then
  printf "PASS  foundation-public-roadmap validation passed\n"
  exit 0
fi

printf "FAIL  foundation-public-roadmap validation failed with %s issue(s)\n" "$missing"
exit 1
