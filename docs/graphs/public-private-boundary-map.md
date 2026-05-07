# Public Private Boundary Map

## Purpose

This graph maps what can enter the public org and what remains private/not-public.

## Mermaid Diagram

```mermaid
flowchart LR
    subgraph PublicOrg["Public org material"]
        standards["Standards and review gates"]:::public
        templates["Templates and checklists"]:::public
        synthetic["Synthetic examples"]:::public
        approved["Approved public reports or records<br/>released only after review"]:::release
    end

    subgraph PrivateMaterial["Excluded material"]
        donors["Donor data"]:::private
        students["Student data"]:::private
        volunteers["Volunteer private data"]:::private
        ops["Private Foundation operations"]:::private
        neurona["Security-sensitive NEURONA details"]:::sealed
        companyIp["Sealed YOSO-YAi LLC IP"]:::sealed
    end

    standards --> PublicOrg
    templates --> PublicOrg
    synthetic --> PublicOrg
    approved --> PublicOrg
    donors -. blocked .-> PublicOrg
    students -. blocked .-> PublicOrg
    volunteers -. blocked .-> PublicOrg
    ops -. blocked .-> PublicOrg
    neurona -. blocked .-> PublicOrg
    companyIp -. blocked .-> PublicOrg

    classDef entity fill:#e7f0ff,stroke:#315a9f,color:#0f274d
    classDef foundation fill:#e8f5ee,stroke:#2b6b4d,color:#123526
    classDef public fill:#fff7df,stroke:#9a6a12,color:#332100
    classDef private fill:#f4e9ff,stroke:#70479c,color:#2f1749
    classDef sealed fill:#ffe8e8,stroke:#a33a3a,color:#4a1111
    classDef release fill:#e8f7ff,stroke:#277491,color:#12323e
    classDef workflow fill:#eef0f3,stroke:#58606b,color:#20242a
```

## Interpretation Notes

- The public org is safe for standards, templates, synthetic examples, and reviewed released artifacts.
- Sensitive categories are blocked from the public org regardless of repo visibility.

## Boundary Notes

- Examples inherit input boundaries and must be synthetic unless explicitly approved.
- Hugging Face is release-only and not a sealed development home.

## Follow-Up Actions

- Re-run validation before every push.
- Add a review note before any real report or real governance artifact is introduced.
