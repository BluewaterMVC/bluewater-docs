### 📘 `docs/auth-modules.md` — Stub Content


# 🔐 Modular Auth System – Bluewater Framework

📁 File: `docs/auth-modules.md`  
📅 Status: Draft  
🧠 Author: Walter Torres (System Architect)

---

## 📌 Purpose

This document defines how authentication is implemented in Bluewater using **pluggable modules**.  

Each tenant or project may choose its own auth method via config — enabling JWT, OAuth2, API keys, or future methods independently.

---

## 📂 Directory Structure

All security mechanisms live in:

```txt
/vendor/bluewater/framework/
└── src/Bluewater/Security/
    ├── jwt/
    ├── oauth/
    └── [future-modules]/
````

---

## 🧱 Design Goals

* 🔌 Pluggable per tenant
* 🔒 Stateless auth (computer-to-computer)
* ✅ Configurable via `app/clientX/config/auth.php`
* 🧩 Interface-driven (`AuthDriverInterface`)

---

## 🔑 Auth Drivers

### ✅ JWT

* Uses PSR-7-compatible middleware
* Verifies HMAC-signed tokens (RS256 support planned)
* Expects config:

```php
return [
  'driver' => 'jwt',
  'issuer' => 'bluewater',
  'secret' => $_ENV['JWT_SECRET'],
  'ttl' => 3600
];
```

---

### ⚙️ OAuth2 (Planned)

* Token verification only (no user interaction)
* Multi-client flow with different providers per tenant
* May use external libraries (e.g., league/oauth2-server)

---

### 🧪 API Key (Future)

* Simple header-based validation
* Useful for internal service-to-service traffic
* Possible storage: `.env`, Redis, file-based

---

### 🛸 Next-Gen Support (Planned)

Support for other mechanisms like:

* 🔐 mTLS (client cert auth)
* 📍 IP-locked tokens
* 🔁 Refresh-token flow (for JWT)
* 🧠 Token introspection endpoints

---

## 🛠️ AuthDriver Interface (Draft)

```php
interface AuthDriverInterface {
    public function validate(RequestInterface $request): bool;
    public function getIdentity(): ?array;
}
```

---

## 🔧 Middleware Integration

Each tenant can opt-in:

```php
// app/clientA/config/middleware.php
return [
  \Bluewater\Security\JWT\JwtMiddleware::class
];
```

Or bind their own implementation.

---

## 🧪 Testing & Fallbacks

| Scenario            | Behavior                     |
| ------------------- | ---------------------------- |
| Invalid token       | 401 Unauthorized             |
| Missing auth config | Framework boots without auth |
| Expired JWT         | 401 with reason in response  |
| Custom auth handler | Allowed via config override  |

---

## 🧭 Next Steps

* [ ] Finalize `AuthDriverInterface`
* [ ] Implement and test JWT module
* [ ] Define per-tenant auth override config
* [ ] Document fallback modes and error codes

---

🧠 *Authentication shouldn’t be hardcoded — it should be pluggable, testable, and replaceable.*

````
