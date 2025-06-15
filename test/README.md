# Documentation Test Automation

This folder contains scripts and tools for testing the quality and style of Bluewater documentation.

## Purpose

To ensure all documentation files in this repository:
- Follow required templates and style guidelines
- Include standard metadata (such as `Last updated` and license lines)
- Pass linting and formatting checks

These checks are run automatically in Continuous Integration (CI) for every pull request, but you can also run them locally before committing changes.

---

## Included Scripts

- `check_metadata.sh` — **Bash script** for Linux/macOS users; checks all Markdown files for required sections and metadata lines.
- `check_metadata.bat` — **Batch script** for Windows users; performs similar checks.
- (Add others as needed, e.g., `check_license.py` or custom linters.)

---

## Running Tests Locally

### **Linux/macOS**

1. **Install prerequisites (optional):**  
   For advanced linting, you may need tools like [markdownlint](https://github.com/DavidAnson/markdownlint).
   ```bash
   npm install -g markdownlint-cli
````

2. **Run all checks:**

   ```bash
   markdownlint "**/*.md"
   bash check_metadata.sh
   ```

### **Windows**

1. **Install prerequisites (optional):**
   [Install Node.js](https://nodejs.org/) and then run:

   ```cmd
   npm install -g markdownlint-cli
   ```

2. **Run all checks:**

   ```cmd
   markdownlint "**/*.md"
   check_metadata.bat
   ```

   or, if using PowerShell:

   ```powershell
   .\check_metadata.bat
   ```

3. **Interpret results:**
   Fix any reported errors before pushing or opening a Pull Request.

---

## Running Tests in CI

All tests in this folder are run automatically via GitHub Actions as defined in `.github/workflows/lint-docs.yml`.
If any check fails, the Pull Request will be marked as failing until issues are resolved.

---

## Contributing Test Scripts

* Place new test or linter scripts in this folder.
* Add/update this README with descriptions.
* Provide both `.sh` (Bash) and `.bat` (Batch) versions if possible for cross-platform compatibility.
* Follow the script style and output conventions of the project.

---

This test suite and documentation are licensed under the [CC BY 4.0 License](https://creativecommons.org/licenses/by/4.0/).

---

*Last updated: {{DATE}}*
