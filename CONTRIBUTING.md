# Contributing to Bluewater Framework

Thank you for considering a contribution to the Bluewater Framework!
We welcome code, documentation, and suggestions.

---

## 📚 Quick Links

* [Official Documentation Site](https://BluewaterMVC.github.io/bluewater-docs/)
* [Doc Sync Process](https://github.com/BluewaterMVC/bluewater-docs/blob/main/SYNC_PROCESS.md)
* [Code of Conduct](https://github.com/BluewaterMVC/bluewater-docs/blob/main/CODE_OF_CONDUCT.md)
* [Security Policy](https://github.com/BluewaterMVC/bluewater-docs/blob/main/SECURITY.md)

---

## 🚀 Getting Started

1. **Fork and clone this repository.**

2. **Install PHP dependencies:**

   ```bash
   composer install
   ```

3. **(Optional) Set up for local technical docs preview:**

   * Ensure you have Python 3.x and `pip` installed.
   * Install MkDocs dependencies:

     ```bash
     pip install -r requirements.txt
     ```
   * Or, for Windows users, run:

     ```
     preview-docs.bat
     ```
   * Alternatively:

     ```bash
     mkdocs serve
     ```
   * This will serve the technical docs in `/technical/` at [http://localhost:8000/](http://localhost:8000/).

---

## 🛠️ Git Hooks Setup

To ensure code and documentation quality, Bluewater Framework uses **pre-commit hooks** for formatting, metadata insertion, and doc linting, including Markdown linting.

**How to set up Git hooks:**

* **Linux/macOS:**

  ```bash
  .githooks/setup-hooks.sh
  ```
* **Windows:**

  ```
  .githooks\setup-hooks.bat
  ```

**What this does:**

* Installs and updates all Git hooks (including robust pre-commit checks).
* Ensures “Last Modified” tokens are up to date.
* Blocks commits with missing doc metadata or structure problems.
* Enforces documentation linting, including markdownlint compliance, across all major platforms.

If you update or add new hooks to `.githooks/`, re-run the above command/script.

*For details on the pre-commit policy and hooks, see [.githooks/README.md](.githooks/README.md) or the top of each script file.*

---

## 📝 Technical Documentation

* **All technical documentation** for the framework lives in the `/technical/` directory.
* Preview, edit, and improve docs locally—see above for setup.
* **Do not edit `/docs/` directly.**
  It is auto-generated in the publication process ([SYNC\_PROCESS.md](https://github.com/BluewaterMVC/bluewater-docs/blob/main/SYNC_PROCESS.md)).

---

## 🖋️ Markdown Linting

All Markdown documentation (**including all files in `/technical/` and translations**) must comply with our linting standards defined in `.markdownlint.json` at the repository root.

**Before submitting any documentation pull request:**

* Run markdownlint locally to check for formatting issues:

  ```bash
  npx markdownlint .
  ```
* Fix any issues before submitting, or explain necessary exceptions in your PR description.
* All documentation-related PRs will be checked for markdownlint compliance during review and CI.
* Pre-commit hooks will block commits that fail linting checks.

For more information on style rules, consult the `.markdownlint.json` file or contact the documentation maintainers.

---

## ✏️ Code Contributions

* Follow [PSR-12](https://www.php-fig.org/psr/psr-12/) coding standards.
* Use strict types:

  ```php
  declare(strict_types=1);
  ```
* Document your code with PHPDoc, following the Bluewater PHPDoc standards.

---

## 🌐 Translating Documentation

* All new docs should be created in `/en/` (English) first.
* To add a translation, create a mirror file in the appropriate `/es/`, `/fr/`, etc. subfolder.
* Use the [Translation Request template](.github/ISSUE_TEMPLATE/translation_request.md) for new or updated translations.
* Ensure the folder/file structure matches the English original.
* All translation PRs are reviewed for accuracy before merge.
* See [i18n Contribution Guide](docs/en/contribute/i18n.md) for tips and standards.

---

## 🤝 Pull Request Process

1. Branch from `main`.
2. Write clear commit messages and PR descriptions.
3. Include tests for new features or bugfixes.
4. Update or add technical docs in `/technical/` as needed.
5. Ensure documentation passes markdownlint checks.
6. Submit your pull request to `main`.

All PRs are subject to code review.

For details on how the Bluewater project is managed—including roles, decision-making, issue triage, and release process—see our [GOVERNANCE.md](./GOVERNANCE.md).

---

## 🔀 Branching & Workflow

All contributions should follow the official branching process described in [WORKFLOW.md](./WORKFLOW.md):

* **Branch from `main`** for features, fixes, documentation, or refactoring.
* **Use descriptive branch names** (e.g., `feature/api-auth`, `bugfix/router`, `docs/quickstart-update`).
* **Push your branch** and open a Pull Request (PR) to `main`.
* **Choose the appropriate PR template** for your change (feature, bugfix, docs, etc.).
* All PRs are reviewed and must pass automated checks before merging.
* The `main` branch is always stable and deployable.

For the full, step-by-step workflow (with examples), see [WORKFLOW.md](./WORKFLOW.md).

---

## 🛡️ Code of Conduct & Security

* Please review our [Code of Conduct](https://github.com/BluewaterMVC/bluewater-docs/blob/main/CODE_OF_CONDUCT.md).
* To report a security vulnerability, please follow our [Security Policy](https://github.com/BluewaterMVC/bluewater-docs/blob/main/SECURITY.md).

---

## 📝 Doc Dependencies

* All required Python packages for local documentation preview are listed in [`requirements.txt`](./requirements.txt).
* If you add new MkDocs plugins, please update `requirements.txt` accordingly.

---

## 🙌 Thank You

Your contributions make Bluewater Framework better for everyone.

---

*Last updated: {{DATE}}*

---
