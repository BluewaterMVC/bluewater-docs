# 🧭 Module 2: Dispatcher Module

The Dispatcher coordinates middleware execution by processing HTTP requests through a chain of callable middleware components. It adheres to [PSR-15](https://www.php-fig.org/psr/psr-15/), ensuring compatibility and composability.

---

## 🧩 Responsibilities

- Construct the middleware pipeline
- Execute middleware in sequence (FIFO)
- Allow short-circuiting of requests (e.g. for auth)
- Pass control to the final request handler (controller)

---

## 🔧 Implementation

Each middleware implements:

```php
interface MiddlewareInterface
{
    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface;
}
````

The dispatcher recursively builds the handler chain, allowing middleware to wrap or modify the request/response.

---

## 📁 Files

```txt
src/
└── Bluewater/
    └── Core/
        └── Dispatcher/
            ├── Dispatcher.php
            ├── MiddlewareQueue.php
            └── HandlerResolver.php
```

---

## 🔄 Middleware Lifecycle

```txt
Request
  ↓
Middleware A
  ↓
Middleware B
  ↓
Controller
  ↑
Middleware B
  ↑
Middleware A
  ↑
Response
```

Each middleware can:

* Modify request
* Short-circuit response
* Enrich or sanitize data

---

## 🧪 Testing

Ensure the following:

* Middleware order respected
* Early returns behave correctly
* Final handler is called if not intercepted

See [testing.md](../testing.md)

---

## 🔗 Related

* [Router](router.md)
* [Middleware Guide](../middleware.md)
* [Responder](responder.md)
* [Architecture Spec](../architecture.md)

---

📎 Tags: `core`, `dispatcher`, `psr-15`, `middleware`, `pipeline`

```
