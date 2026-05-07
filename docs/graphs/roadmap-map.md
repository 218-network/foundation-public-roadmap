# Roadmap Map

## Purpose

This graph shows how the public roadmap tracks repo state without making live-operation claims.

## Mermaid Diagram

```mermaid
flowchart LR
    roadmap["foundation-public-roadmap<br/>published / scaffolded"]:::public
    repos["First institutional repo stack<br/>published / scaffolded"]:::public
    futureReports["Real public reports<br/>planned"]:::release
    futurePrograms["Cleanup / NEURONA / schools updates<br/>planned"]:::foundation
    futureHF["Models / datasets / Spaces<br/>planned"]:::release
    privateWork["Private records and operations<br/>private/not-public"]:::private

    roadmap --> repos
    roadmap --> futureReports
    roadmap --> futurePrograms
    roadmap --> futureHF
    privateWork -. excluded .-> roadmap

    classDef entity fill:#e7f0ff,stroke:#315a9f,color:#0f274d
    classDef foundation fill:#e8f5ee,stroke:#2b6b4d,color:#123526
    classDef public fill:#fff7df,stroke:#9a6a12,color:#332100
    classDef private fill:#f4e9ff,stroke:#70479c,color:#2f1749
    classDef sealed fill:#ffe8e8,stroke:#a33a3a,color:#4a1111
    classDef release fill:#e8f7ff,stroke:#277491,color:#12323e
    classDef workflow fill:#eef0f3,stroke:#58606b,color:#20242a
```

## Interpretation Notes

- The roadmap records statuses and review gates.
- Future artifacts remain planned until reviewed evidence exists.

## Boundary Notes

- Roadmap visibility does not reveal private operations or sensitive records.
- Planned items are not active services or commitments.

## Follow-Up Actions

- Keep ROADMAP.md and STATUS.md synchronized.
- Add evidence links before changing any item to `released`.
