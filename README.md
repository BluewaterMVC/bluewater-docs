
# 🌊 Bluewater Framework

**Version:** 1.0  
**License:** MIT  
**Language:** PHP 8.2+  
**Type:** Lightweight Backend-Only REST API Framework

---

# 📘 Bluewater Documentation

> **Official documentation site for the Bluewater Framework** — a lightweight, high-performance backend PHP framework designed for building modular, multi-tenant REST APIs.

This repository contains all structured, versioned documentation for:

- 📐 **Architecture & Specifications**
- 🧱 **Core Modules & Internals**
- 🛡 **Security & Auth**
- 🔁 **Multi-Tenant Support**
- ⚙️ **CLI Tooling**
- 🧪 **Testing & Quality Standards**
- 📦 **Deployment Guides**
- 🔌 **Third-Party Integrations**
- 🚧 **Roadmap, Release Plans, and How-Tos**

---

### 🔗 GitHub Pages (when enabled)

📄 Once published via GitHub Pages:

```

https\://<your-username>.github.io/bluewater-docs/

```

> See `_toc.md` or [docs/index.html](docs/index.html) for a full site navigation map.
```
---

## 🚀 What is Bluewater?

**Bluewater** is a modular, PSR-compliant PHP micro-framework for building secure, fast REST APIs with **no bloat**.

Built for developers who want full control and performance — not opinionated monoliths.

- No templating engines.
- No service containers.
- No magic.

Just fast, testable, and extensible backend code.

---

## ⚡️ Why Bluewater?

- 🧠 **Simple by Design** – Minimalist, composable architecture
- 🚀 **Fast** – Sub-50ms boot and sub-10ms response targets
- 🧪 **Test-Ready** – Built for unit/integration testing from day one
- 🔌 **Extendable** – Bring your own cache, ORM, queue, and auth libs
- 🔒 **Secure** – Middleware-driven security and rate limiting
- 🧱 **Standardized** – Fully PSR-1/4/7/11/15/17 compliant

---

## 📁 Project Layout

```txt
bluewater-api/
│
├── public/              # Public web root (index.php)
├── app/                 # App-specific logic and client folders
│   ├── clientA/
│   ├── clientB/
│   └── common/
│
├── bin/                 # CLI entry point (softlink to vendor bin)
│   └── bluewater
│
├── cache/               # Writable runtime files
├── vendor/              # Composer dependencies (includes Bluewater)
├── .env                 # Environment configuration
├── composer.json        # Autoload + dependencies
└── README.md            # You are here 🧭
````

---

## 🧰 CLI Tool

```bash
bin/bluewater route:list      # List all available routes
bin/bluewater cache:clear     # Clear route + config cache
bin/bluewater config:dump     # Output merged config
bin/bluewater openapi:generate # Generate OpenAPI v3 spec
```

🔗 See: [CLI Tooling Docs](docs/cli/cli-tooling.md)

---

## 🛠️ Requirements

* PHP 8.2+ with FPM
* NGINX/Apache (rewrite to `public/index.php`)
* Composer
* Writable `cache/` directory
* `.env` or runtime env vars

---

## 🧪 Testing & Quality

| Target       | Goal                     |
| ------------ | ------------------------ |
| Boot time    | < 50ms (opcache enabled) |
| API response | < 10ms                   |
| Routing      | Constant-time            |
| Scalability  | Stateless, horizontal    |

✔️ Follows [PSR-12 Coding Standard](https://www.php-fig.org/psr/psr-12/)
✔️ Uses [PHPUnit](https://phpunit.de/) for testing

🔗 See: [Testing Docs](docs/testing/testing.md)

---

## 📘 Documentation

🔗 Browse the [Interactive HTML Index](docs/index.html)
📁 Explore full markdown docs in [`/docs`](docs/index.md)

<details>
<summary>🏛️ <strong>Architecture</strong> 📐</summary>

* 📐 [Architecture](docs/architecture/architecture.md)
* 🗂️ [Structure](docs/architecture/structure.md)
* 🧩 [Multi-Tenant](docs/architecture/multi-tenant.md)
* 📄 [Specifications](docs/architecture/specifications.md)
* 🚀 [Release](docs/architecture/release.md)
* 🗺️ [Roadmap](docs/architecture/roadmap.md)

</details>

<details>
<summary>🧩 <strong>Core Modules</strong> 🧱</summary>

* [Core Modules](docs/core/core-modules.md)
* [Router](docs/core/router.md)
* [Dispatcher](docs/core/dispatcher.md)
* [Responder](docs/core/responder.md)
* [Middleware](docs/core/middleware.md)
* [Logger](docs/core/logger.md)
* [Config](docs/core/config.md)

</details>

<details>
<summary>🔐 <strong>Security</strong> 🔒</summary>

* [Auth Modules](docs/security/auth-modules.md)
* [JWT](docs/security/jwt.md)
* [OAuth](docs/security/oauth.md)
* [NextGen Security](docs/security/nextgen.md)

</details>

<details>
<summary>💻 <strong>CLI</strong> 🛠️</summary>

* [CLI Tooling](docs/cli/cli-tooling.md)

</details>

<details>
<summary>🚀 <strong>Deployment</strong> 📦</summary>

* [Deployment](docs/deployment/deployment.md)
* [Build Process](docs/deployment/build-process.md)
* [Config Management](docs/deployment/config-management.md)
* [Environments](docs/deployment/environments.md)

</details>

<details>
<summary>📚 <strong>Guides</strong> 📖</summary>

* [Docs Writing](docs/guides/docs-guides.md)
* [Getting Started](docs/guides/getting-started.md)
* [Project Layout](docs/guides/project-layout.md)
* [Usage Examples](docs/guides/usage-examples.md)

</details>

<details>
<summary>🧪 <strong>Testing</strong> 🧬</summary>

* [Testing Overview](docs/testing/testing.md)
* [Unit Testing](docs/testing/unit-testing.md)
* [Integration Testing](docs/testing/integration-testing.md)
* [Mocking](docs/testing/mocking.md)

</details>

<details>
<summary>📘 <strong>API & Specs</strong> 🌐</summary>

* [OpenAPI Generator](docs/api/openapi.md)
* [OpenAPI Spec](docs/api/openapi-spec.md)
* [Rate Limiting](docs/api/rate-limiting.md)
* [Spec Format](docs/api/spec-format.md)
* [Versioning](docs/api/versioning.md)

</details>

<details>
<summary>📦 <strong>Modules / Integrations</strong> 🔌</summary>

* [Auth](docs/modules/auth.md)
* [Cache](docs/modules/cache.md)
* [Monitoring](docs/modules/monitoring.md)
* [Queues](docs/modules/queues.md)

</details>

<details>
<summary>🧠 <strong>Meta</strong> 📚</summary>

* [FAQ](docs/meta/faq.md)
* [Troubleshooting](docs/meta/troubleshooting.md)
* [Performance](docs/meta/performance.md)
* [Extending Bluewater](docs/meta/extending.md)
* [Upgrading](docs/meta/upgrading.md)
* [License](docs/meta/license.md)

</details>

---

## 🧠 Philosophy

> *"A good framework gets out of your way. A great one lets you see how it works."*
> — Bluewater Principle

---

## 🤝 Contributing

PRs and issues are welcome!

* 🔗 [Contribution Guide](docs/meta/contributing.md)
* 🧹 Follow [PSR-12](https://www.php-fig.org/psr/psr-12/)
* 📄 Use [PHPDoc](https://docs.phpdoc.org/) on all methods/classes

---

## 📄 License

[MIT License](LICENSE)

---

⚡ Built for speed.
🌊 Powered by simplicity.
👾 Backed by hackers.

```
