# Repo Status Map

## Purpose

This graph records the first six institutional repos and their initial public statuses.

## Mermaid Diagram

```mermaid
flowchart LR
    org["218-network GitHub org"]:::foundation
    profile[".github<br/>published"]:::public
    governance["foundation-governance<br/>published / scaffolded"]:::public
    transparency["foundation-transparency-reports<br/>published / scaffolded"]:::public
    roadmap["foundation-public-roadmap<br/>published / scaffolded"]:::public
    programs["foundation-programs-public<br/>published / scaffolded"]:::public
    reports["foundation-public-reports<br/>published / scaffolded"]:::public
    futureArtifacts["Models / datasets / Spaces / schools / NEURONAs / live deployments<br/>planned"]:::release
    privateData["Private records and operations<br/>private/not-public"]:::private

    org --> profile
    org --> governance
    org --> transparency
    org --> roadmap
    org --> programs
    org --> reports
    roadmap -. tracks planned status .-> futureArtifacts
    privateData -. excluded .-> org

    classDef entity fill:#e7f0ff,stroke:#315a9f,color:#0f274d
    classDef foundation fill:#e8f5ee,stroke:#2b6b4d,color:#123526
    classDef public fill:#fff7df,stroke:#9a6a12,color:#332100
    classDef private fill:#f4e9ff,stroke:#70479c,color:#2f1749
    classDef sealed fill:#ffe8e8,stroke:#a33a3a,color:#4a1111
    classDef release fill:#e8f7ff,stroke:#277491,color:#12323e
    classDef workflow fill:#eef0f3,stroke:#58606b,color:#20242a
```

## Interpretation Notes

- The first stack is public and scaffolded.
- The roadmap tracks planned future artifacts without converting them into released artifacts.

## Boundary Notes

- `published` means reachable repo, not live operations.
- `private/not-public` material is not indexed as public proof.

## Follow-Up Actions

- Update this graph when repository status changes.
- Add an audit entry before moving any repo from `scaffolded` to `released` artifact support.
