```markdown
# ❓ FAQ & Troubleshooting

This doc covers common issues, tips, and edge cases encountered when working with the Bluewater Framework.

---

## 🧪 Setup Issues

### 🔸 "Class not found" in autoload
> Run `composer dump-autoload` to rebuild PSR-4 class map.

---

### 🔸 Permissions on `cache/` directory
> Ensure the `cache/` directory is writable by the web server and CLI user.

---

### 🔸 Missing `.env` file
> Copy `.env.example` → `.env` and customize for your environment.

---

## 🔐 Authentication Questions

### 🔸 "Invalid token" on routes
> Check your middleware stack for missing JWT validator or expired tokens.

---

## 🛠️ CLI Tooling

### 🔸 "Command not found"
> Ensure `bin/bluewater` is symlinked to `vendor/bin/bluewater`.  
> Or run it directly from `vendor/bin`.

---

## 🧠 General

- Want to disable a module? Remove it from the service map or CLI bindings.
- Want to change routing structure? Use `routes/` per tenant.

---

✅ PRs welcome! Add your real-world tips to help other Bluewater devs.
````

