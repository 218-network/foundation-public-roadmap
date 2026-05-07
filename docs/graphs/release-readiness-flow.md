# Release Readiness Flow

## Purpose

This graph maps the minimum path from planned item to released artifact.

## Mermaid Diagram

```mermaid
flowchart LR
    planned["planned"]:::workflow
    scaffolded["scaffolded"]:::workflow
    published["published"]:::public
    review["Human review and evidence check"]:::workflow
    released["released"]:::release
    privateBlocked["private/not-public material"]:::private

    planned --> scaffolded --> published --> review --> released
    privateBlocked -. cannot bypass review .-> released

    classDef entity fill:#e7f0ff,stroke:#315a9f,color:#0f274d
    classDef foundation fill:#e8f5ee,stroke:#2b6b4d,color:#123526
    classDef public fill:#fff7df,stroke:#9a6a12,color:#332100
    classDef private fill:#f4e9ff,stroke:#70479c,color:#2f1749
    classDef sealed fill:#ffe8e8,stroke:#a33a3a,color:#4a1111
    classDef release fill:#e8f7ff,stroke:#277491,color:#12323e
    classDef workflow fill:#eef0f3,stroke:#58606b,color:#20242a
```

## Interpretation Notes

- A published repo can host scaffolding before any artifact is released.
- Human review and evidence are the gate to `released`.

## Boundary Notes

- Private/not-public material cannot be converted to released material by summary or implication.
- Hugging Face is a release surface only.

## Follow-Up Actions

- Store review checklists with future release candidates.
- Update the audit when a status changes.
