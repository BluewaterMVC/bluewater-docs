# Bluewater Framework Git Hooks

This directory contains all custom Git hooks used to enforce code and documentation standards in the Bluewater Framework project.

---

## Overview

Bluewater Framework leverages automated Git hooks to ensure every commit and push adheres to our quality and style standards for code and documentation.

These hooks:
- Enforce formatting and metadata standards on both code and docs.
- Run markdown linting (per `.markdownlint.json`).
- Prevent commits with missing or invalid documentation.
- Support a consistent, high-quality codebase across all contributors and platforms.

---

## Usage

To install or update the hooks, run:

- **Linux/macOS:**  
  ```bash
  .githooks/setup-hooks.sh
````

* **Windows:**

  ```bash
  .githooks\setup-hooks.bat
  ```

This will automatically install and activate all hooks for your local repository.

---

## Adding or Updating Hooks

* Place new hook scripts in this directory following Git’s standard naming conventions (e.g., `pre-commit`, `commit-msg`).
* Ensure all scripts are executable and cross-platform compatible where possible.
* Update this README with any relevant details as new hooks are added.

---

## More Information

* For details on our commit policy and required checks, see [`CONTRIBUTING.md`](../CONTRIBUTING.md).
* For hook troubleshooting or suggestions, open an issue or contact the maintainers.

---

*This is a placeholder. Expand with specific hook details, usage notes, and scripts as the Bluewater Framework project evolves.*

---

*Last updated: {{DATE}}*

---
