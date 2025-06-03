### 📘 `docs/api/openapi.md` — Stub Content

# 📑 OpenAPI Integration – Bluewater Framework

📁 File: `docs/openapi.md`  
📅 Status: Planned  
🧠 Author: Jake (AI Systems Architect)

---

## 📌 Purpose

This document outlines how Bluewater APIs can be documented using **OpenAPI v3**, enabling:

- ✅ Developer visibility
- 🧪 Mock server/test generation
- 🔄 SDK generation
- ✅ Contract-driven development

---

## 🧭 Overview

Bluewater itself does not auto-generate OpenAPI docs — it encourages **explicit definition** and **tool-driven publishing**.

OpenAPI definitions are stored and served per client (multi-tenant compatible).

---

## 📂 File Location (Recommended)

```txt
/docs/
└── openapi/
    ├── base.yaml                # Shared base schema
    ├── clientA.yaml             # Full spec for Client A
    └── clientB.yaml             # ...
````

Optionally serve via HTTP:

```php
GET /docs/openapi/clientA.yaml
```

---

## 🛠️ Tools for OpenAPI Generation

| Tool                                                 | Usage                        |
|------------------------------------------------------|------------------------------|
| [Swagger UI](https://swagger.io/tools/swagger-ui/)   | Visual explorer in browser   |
| [Redoc](https://github.com/Redocly/redoc)            | Clean, readable API docs     |
| [Stoplight](https://stoplight.io/)                   | GUI + versioned spec editing |
| [OpenAPI Generator](https://openapi-generator.tech/) | Generate SDKs/test clients   |

---

## 🧪 Testing with OpenAPI

* 🧰 Validate schema before deploy
* ✅ Use `mockoon` or `prism` for local API mocking
* 🔁 Enable contract testing between services

---

## 🔐 Security Definition (Per Client)

Each OpenAPI spec can define auth type:

```yaml
components:
  securitySchemes:
    bearerAuth:
      type: http
      scheme: bearer
```

Or specify OAuth2 flow if supported by tenant.

---

## 🔄 Runtime Usage (Planned)

Future support for:

* 📦 Auto-route listing to YAML
* 📃 Inline doc annotations → OpenAPI fragment generator
* 🔁 Swagger/Redoc proxy route (e.g. `/docs/api`)

---

## 🧭 Next Steps

* [ ] Define minimum required fields per spec
* [ ] Add `bin/bluewater openapi:validate`
* [ ] Provide Redoc integration instructions

---

🧠 *A fast API means nothing if no one knows how to use it. OpenAPI fixes that.*
