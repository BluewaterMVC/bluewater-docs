# Bluewater Documentation Structure & Sync Process

This repository hosts the official documentation for the Bluewater project, including architecture guides, technical usage docs, and auto-generated API reference.

To keep documentation accurate and up to date, some sections are written here, while others are synced or generated from the main framework code repository.

---

## Documentation Sources

| Directory        | Maintained In         | Source of Truth     | Sync Method                 |
|------------------|-----------------------|---------------------|-----------------------------|
| `/architecture/` | Here (bluewater-docs) | bluewater-docs      | Direct edit                 |
| `/technical/`    | Framework repo        | bluewater-framework | Manual/automated sync       |
| `/phpdoc/`       | Framework codebase    | bluewater-framework | Generated via phpDocumentor |

---

## Update & Sync Workflow

1. **Architecture Docs (`/architecture/`):**
    - Maintained directly in this repo.
    - Edit as needed and submit Pull Requests here.

2. **Technical Docs (`/technical/`):**
    - Written and updated in the [bluewater-framework](https://github.com/BluewaterMVC/bluewater-framework) repository, under `docs/technical/`.
    - Changes are **pulled into this repo**:
        - [ ] Manually: Copy over updated files regularly.
        - [ ] (Recommended) Automatically: Use a script or GitHub Action to sync these on release.

3. **API Docs (`/phpdoc/`):**
    - Generated from the latest PHP source in `bluewater-framework` using [phpDocumentor](https://www.phpdoc.org/).
    - After major code updates or releases:
        - Regenerate the docs locally or in CI.
        - Copy the output HTML files here.

---

## Contributor Responsibilities

- **Core maintainers:** Ensure architecture docs are current, coordinate technical doc syncs, trigger API doc generation.
- **Framework contributors:** Update technical docs alongside code changes, follow documentation style and sync guidelines.
- **Reviewers:** Check that documentation in all repos stays consistent and accurate.

---

## Notes

- **Do not edit `/technical/` or `/phpdoc/` directly in this repo.**  
  Always make changes in the source (framework) repo and sync them in.
- For questions or sync issues, open an issue or contact the maintainers.

---

*Last updated: {{DATE}}*
