# 📤 Module : Responder Module

The Responder module is responsible for generating **consistent HTTP responses**, including status codes, headers, and body formatting. It serves as the final output layer in the request lifecycle.

---

## 🧩 Responsibilities

- Format successful and error responses as JSON
- Set appropriate HTTP status codes
- Apply headers (e.g., CORS, content type)
- Standardize API response schema

---

## ⚙️ Output Format

Every response returned from an endpoint should adhere to the following structure:

```json
{
  "status": "success",
  "data": { ... },
  "meta": {
    "timestamp": "2025-06-02T14:32:00Z"
  }
}
````

For errors:

```json
{
  "status": "error",
  "message": "Invalid request payload",
  "code": 400
}
```

---

## 📁 Files

```txt
src/
└── Bluewater/
    └── Core/
        └── Responder/
            ├── JsonResponder.php
            └── ResponseBuilder.php
```

---

## 🧪 Testing

* Ensure correct headers (`Content-Type: application/json`)
* Validate response structures (success, error, edge cases)
* Mock internal exceptions for error wrapping
* PSR-7 compliance with `ResponseInterface`

See [testing.md](../testing.md)

---

## 🔗 Related

* [Dispatcher](dispatcher.md)
* [Logger](logger.md)
* [Architecture Spec](../architecture.md)

---

📎 Tags: `core`, `responder`, `json`, `http`, `psr-7`

```
