# 🔐 JWT Security Module

The Bluewater framework supports **JWT (JSON Web Tokens)** out of the box using pluggable middleware.

---

## ✅ Features

- Stateless authentication
- Client-to-API bearer token strategy
- Signing via HS256 or RS256
- Per-client secret configuration
- Middleware integration into dispatch flow

---

## 🛠️ Usage

Tokens are passed via the `Authorization: Bearer <token>` header.

```http
GET /api/user
Authorization: Bearer eyJhbGciOiJIUzI1NiIsIn...
````

* Validate tokens in `app/ClientX/Middleware/AuthMiddleware.php`
* Inject claims into the request object

---

## 📁 Directory Structure

```txt
src/
└── Bluewater/
    └── Security/
        └── JWT/
            ├── JWTAuthMiddleware.php
            └── TokenValidator.php
```

---

## 🔧 Configuration

Example `.env`:

```env
JWT_SECRET=super-secret-key
JWT_ALGO=HS256
JWT_EXPIRATION=3600
```

Each client could have:

```env
CLIENT_A_JWT_SECRET=abc123
CLIENT_B_JWT_SECRET=xyz789
```

---

## 🧪 Notes

* Use [`firebase/php-jwt`](https://github.com/firebase/php-jwt)
* Claims can be validated via injected policies or inline handlers

[Ideas and PRs welcome](../../CONTRIBUTING.md) 🧠


````
