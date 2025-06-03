### 📄 `docs/testing/testing.md`

# 🧪 Testing Strategy – Bluewater Framework

📄 **File:** `docs/testing/testing.md`  
📅 **Status:** Stub  
🏷️ **Tags:** testing, quality, phpunit, automation  
🔖 **Version:** 1.0  
📦 **Scope:** 🧪 Full-Stack Testing Plan  
👨‍💻 **Maintainer:** QA Lead / Core Contributor

---

## 📘 OVERVIEW

This document provides a top-level overview of **testing philosophy, tooling, and coverage strategy** for the Bluewater PHP framework.  

Testing is central to the framework’s stability, and is enforced via both code-level checks and CI pipelines.

---

## 🧪 Testing Layers

| Layer            | Purpose                                 | Tools       |
|------------------|-----------------------------------------|-------------|
| Unit             | Test isolated logic                     | PHPUnit     |
| Integration      | Validate multiple components in sync    | PHPUnit     |
| Functional       | Simulate framework behavior (CLI/API)   | PHPUnit     |
| End-to-End (opt) | Full lifecycle (optional, not included) | Cypress etc |

---

## 🛠️ Tools Used

- ✅ [PHPUnit](https://phpunit.de/) – primary test runner  
- ✅ [Mockery](https://github.com/mockery/mockery) – fluent mocks  
- ✅ [Psalm](https://psalm.dev/) – static analysis (optional)  
- 🔄 [GitHub Actions](https://docs.github.com/actions) – CI/CD integration (planned)

---

## 📂 Recommended Test Directory Layout

```txt
/tests/
├── Unit/
├── Integration/
├── Functional/
├── Helpers/
└── bootstrap.php
````

---

## 🎯 Coverage Goals

| Layer          | Target Coverage   |
|----------------|-------------------|
| Framework Core | 95–100%           |
| CLI Commands   | 90%+              |
| Middleware     | 100% (edge logic) |
| Router         | 100% route map    |
| Sample App     | ≥80% minimum      |

---

## 📎 Related Files

* [`unit-testing.md`](./unit-testing.md)
* [`mocking.md`](./mocking.md)
* [`integration-testing.md`](./integration-testing.md)
* [PSR-12 Coding Style](https://www.php-fig.org/psr/psr-12/)
* [PHPUnit Docs](https://phpunit.readthedocs.io/)

---

📎 *Test like you’re the last developer who’ll ever touch this repo.*

---
