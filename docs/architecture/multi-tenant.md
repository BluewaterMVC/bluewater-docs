### 📘 `docs/multi-tenant.md` — Stub Content

# 🧩 Multi-Tenant Architecture – Bluewater Framework

📁 File: `docs/multi-tenant.md`  
📅 Status: Draft  
🧠 Author: Walter Torres (System Architect)

---

## 📌 Purpose

This document describes how Bluewater supports **multi-tenant APIs** where each client (or tenant) has isolated logic, config, routes, and security policy.

---

## 🗂️ File Structure

Each tenant lives in a subdirectory under `/app/`:

```txt
/app/
├── common/                   # Shared utilities/helpers
│   └── helpers/
├── clientA/
│   ├── Controllers/
│   ├── Middleware/
│   ├── config/
│   └── helpers/
└── clientB/
    └── ...
````

📎 See [`app/common/README.md`](../app/common/README.md) for usage guidance and developer responsibility disclaimer.

---

## 🧠 Responsibilities

| Layer          | Function                               |
|----------------|----------------------------------------|
| `Controllers/` | Request logic per tenant               |
| `Middleware/`  | Tenant-specific processing/auth        |
| `config/`      | Per-tenant settings (e.g., DB, keys)   |
| `helpers/`     | Utility functions scoped to the tenant |

---

## 🔐 Security Strategy

Each tenant can define its own authentication driver in config:

```php
return [
  'auth' => [
    'driver' => 'jwt',
    'secret' => 'client-specific-key',
    'issuer' => 'clientA',
  ]
];
```

Later: Support for OAuth/mTLS per tenant under `/security/`

---

## 🧰 Dispatch Flow (Planned)

1. Incoming request hits router
2. Tenant is resolved via subdomain/header/path
3. Config + routes are loaded from `/app/{tenant}/`
4. Auth middleware is applied dynamically
5. Response is returned via `Responder`

---

## ⚠️ Risks & Considerations

| Risk                        | Mitigation                                   |
|-----------------------------|----------------------------------------------|
| Config bleed across clients | Strict directory isolation (`/app/{client}`) |
| Route conflicts             | Namespace routes by tenant or version        |
| Auth leakage                | Require driver selection per-tenant          |
| Code duplication            | Use `/app/common` and helpers                |

---

## 🧭 Next Steps

* [ ] Build a `TenantResolver` interface + default middleware
* [ ] Add route grouping per tenant
* [ ] Auto-merge common + client config
* [ ] Document fallback behavior

---

## ⚠️ Developer Responsibility Disclaimer

The `/app/common/` directory is **owned and maintained entirely by you** — the developer or internal team responsible for application-level logic.

Bluewater Framework does **not** ship, maintain, or version anything inside `app/`, including `common/`. As such:

- 🔧 **You control its structure and behavior**
- 🧪 **You are responsible for testing its stability**
- 🔄 **You are responsible for refactoring or updating code inside it**

If breaking changes occur due to modifications within `common/`, they are not the responsibility of the Bluewater maintainers or framework updates.

> 💡 Treat `common/` like your own private shared library — maintain contracts, add tests, and avoid breaking downstream tenants.

---

🧠 *Tenants should feel like first-class citizens — but never see each other.*
— Bluewater Principle

````
