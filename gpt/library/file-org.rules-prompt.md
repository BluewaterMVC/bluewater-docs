### 📘 `docs/contribute/file-organization.md` — Documentation File Organization Rules

# 🗂️ Documentation File Organization – Bluewater Framework

📄 **File:** `docs/contribute/file-organization.md`
🧮 **Status:** ✅ Approved
🛫 **ETA:** 2025-06-30
🔖 **Version:** 1.0
📅 **Date:** 2025-06-09
🏷️ **Tags:** organization, structure, standards
🌍 **Scope:** Defines folder structure, naming conventions, and document storage strategy for all documentation in the `docs/` directory
👥 **Contributors:** – Technical Writers, Architects, Maintainers
👨‍💻 **Author:** Walter Torres

---

## 📁 Bluewater Documentation File Organization Rules

### 1. Top-Level Directory: `docs/`

The root for all project documentation. It contains major sections and foundational files.

**Required files:**
- `README.md`
- `changelog.md`
- `.pages` (for MkDocs nav control)

---

### 2. Major Sections (Subdirectories of `docs/`)

| Directory         | Purpose                                                      |
|------------------|--------------------------------------------------------------|
| `architecture/`  | System design, infrastructure, environments, services        |
| `platform/`      | API, CLI, internal tools, and integrations                   |
| `configuration/` | Runtime, secrets, and feature flags configuration            |
| `security/`      | Auth, RBAC, encryption, tenant isolation                     |
| `core/`          | Core logic, services, domain modules                         |
| `deployment/`    | CI/CD, infrastructure as code, hosting layers                |
| `integration/`   | Third-party systems, adapter patterns                        |
| `observability/` | Logging, monitoring, tracing                                 |
| `policies/`      | Compliance, auditing, and internal governance                |
| `rfc/`           | Formal proposals and feature designs                         |
| `blueprints/`    | Reference implementations and service scaffolds              |
| `contribute/`    | Templates, writing guidelines, and meta-documentation        |

---

### 3. File Naming Conventions

- Use `kebab-case` for filenames (e.g., `system-overview.md`, `service-lifecycle.md`)
- Use `README.md` for section entry points
- Diagrams/images are always `.png` and in `kebab-case`

---

### 4. Diagrams Location

Store all images under:

```
docs/assets/diagrams/<section>/
```

- Match `<section>` with the document's parent directory
- Reference diagrams like:

```markdown
![Alt Text](../../assets/diagrams/architecture/bluewater-architecture-v1.png)
```

---

### 5. Stub Files

If a document is planned but not yet written:
- Create the file with a proper header
- Set `🧮 Status:` to `🚧 Stub / Placeholder`
- Use `🔖 Version:` `0.0`

---

_Last updated: 2025-06-09_
