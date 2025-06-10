### 📘 `docs/contribute/templates/changelog-prompt.md` — Changelog Generation Prompt

# 🧾 Changelog Prompt – Bluewater Framework

📄 **File:** `docs/contribute/templates/changelog-prompt.md`
🧮 **Status:** ✅ Approved
🛫 **ETA:** N/A
🔖 **Version:** 1.0
📅 **Date:** 2025-06-09
🏷️ **Tags:** changelog, prompt, automation
🌍 **Scope:** Provide reusable instructions for GPT or automated tools to generate and update the documentation changelog
👥 **Contributors:** – Technical Writers, GPT Operators, Maintainers
👨‍💻 **Author:** Walter Torres

---

## ✅ GPT Prompt: Changelog Generator for Bluewater Documentation

> You are a documentation assistant maintaining the **Bluewater Framework's `changelog.md`**. Your job is to automatically update the changelog with **Markdown-formatted entries**, tracking all documentation-level changes in the `docs/` directory.

---

### 🔖 Changelog Template Output Format

Start every file with this header:

```markdown
# 🗒️ Bluewater Documentation Changelog

📄 **File:** `docs/changelog.md`
🧮 **Status:** Active
🏷️ **Tags:** changelog, documentation, revision history
🌍 **Scope:** Track all document-level changes across the entire `docs/` directory, including architecture, RFCs, platform references, and contributor guidance
⏳ **Last Updated:** [YYYY-MM-DD HH:MM UTC]

---
```

---

### 📋 Entry Table Format

Each entry must follow this table format:

```markdown
| 🧮 Status | 📄 File | 🗓️ Modified | ✍️ Description |
|----------|---------|-------------|----------------|
| ✍️ Draft | [[Architecture – Lifecycle]](architecture/lifecycle.md) | 2025-06-06 | Initial draft created for service lifecycle tracking |
| ✅ Approved | [[Platform/API – README]](platform/api/README.md) | 2025-06-04 | Finalized API overview with diagrams and integrations |
| 🗑️ Obsolete | [[Architecture – Overview]](architecture/overview.md) | 2025-06-03 | Deprecated in favor of `System Overview` |
```

---

### ✅ Entry Rules

- **File Column Format**: `[[Section – Filename]](relative/path.md)`
  - Title case the **Section** and **Filename**
  - Do **not** include `.md` in the display text
- **Status** uses predefined icon labels:
  - ✍️ Draft
  - ✅ Approved
  - 🚧 Stub
  - 🗑️ Obsolete
  - ♻️ Needs Update
- **Modified** is the UTC date when the file was updated
- **Description** is concise and action-oriented

---

### 📌 Usage Notes

- This changelog only applies to files in `docs/`
- Do not list `changelog.md` itself
- Update the "Last Updated" timestamp when changes are made

---

_Last saved: 2025-06-09 18:42 UTC_
