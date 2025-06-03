### 📄 `docs/security/auth-modules.md`

# 🛡️ Authentication Modules – Bluewater Framework

📄 **File:** `docs/security/auth-modules.md`  
📅 **Status:** Stub  
🏷️ **Tags:** security, authentication, jwt, oauth  
🔖 **Version:** 1.0  
📦 **Scope:** 🔐 Security – Developers & DevOps  
👨‍💻 **Maintainer:** Bluewater Core Team

---

## 📘 OVERVIEW

This document outlines the authentication modules supported in Bluewater, providing pluggable and per-tenant mechanisms for securing APIs. The goal is to enable **computer-to-computer communication** with flexibility and future expansion.

---

## 🔐 Supported Authentication Strategies

| Module                        | Description                                                  |
|-------------------------------|--------------------------------------------------------------|
| [JWT](./jwt.md)               | Token-based, stateless authentication                        |
| [OAuth2](./oauth.md)          | Delegated auth, per-client config                            |
| [Next-Gen Auth](./nextgen.md) | Each module can be activated per-tenant via config settings. |

---

## 🧱 Directory Structure

```txt
/src/Bluewater/Security/
├── jwt/
├── oauth/
└── nextgen/
````

These folders contain interfaces and pluggable implementations.

---

## 🧩 Integration Strategy

* Defined in tenant config:

  ```php
  return [
    'auth' => [
      'driver' => 'jwt',
      'issuer' => 'client-name',
      'secret' => 'your-client-secret'
    ]
  ];
  ```

* Middleware pulls correct driver at runtime

* Stateless design enables horizontal scaling

---

## 🔄 Swappable Design

All modules follow a common interface pattern, making it easy to:

* Replace JWT with OAuth2 without core changes
* Extend drivers for enterprise-specific policies
* Create mocks for testing

---

## 🔗 Related

* [`middleware.md`](../core/middleware.md) – For adding authentication filters
* [`multi-tenant.md`](../architecture/multi-tenant.md) – Per-client auth strategy
* [PSR-15 Middleware Spec](https://www.php-fig.org/psr/psr-15/)

---

🔐 *Security should be consistent, transparent, and tenant-aware.*

---
