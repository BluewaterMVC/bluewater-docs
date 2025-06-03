
# 🤝 Contributing to Bluewater Framework

Thank you for your interest in contributing to Bluewater!  
Whether you're fixing a bug, suggesting an enhancement, or writing docs — you're helping make the framework better for everyone.

---

## 📜 Code Standards

Bluewater follows these coding conventions:

| Standard | Purpose                          |
|----------|----------------------------------|
| [PSR-12](https://www.php-fig.org/psr/psr-12/) | PHP code formatting         |
| [PHPDoc](https://docs.phpdoc.org/latest/index.html) | Class/method documentation  |
| [PSR-4](https://www.php-fig.org/psr/psr-4/) | Autoloading structure       |

> ✅ Use PHPDoc for all methods/classes — not just public ones.

---

## 🧪 Testing & QA

Before submitting code:

1. ✅ Run all PHPUnit tests
2. ✅ Pass static analysis via PHPStan
3. ✅ Format with PHP-CS-Fixer (`make lint` or Composer script)

---

## 🛠️ How to Contribute

### 🔧 Fix a Bug

- Open an issue with clear reproduction steps
- Fork the repo
- Create a new branch: `fix/bug-title`
- Write a test (if possible)
- Submit a pull request with description

---

### ✨ Add a Feature

- Suggest the idea first via issue or discussion
- Label it as `enhancement`
- Fork & branch: `feature/your-feature-name`
- Include docs if applicable

---

### 📚 Improve Documentation

- Docs live in `/docs/`
- Use `.md` with clean structure and headings
- Fix typos, expand examples, or improve clarity

---

## ✅ Pull Request Checklist

- [ ] Follows PSR-12 format
- [ ] Passes tests
- [ ] Includes or updates tests
- [ ] PHPDoc is complete
- [ ] PR description includes context and links to related issues

---

## 🧭 Project Structure

```txt
bluewater/
├── src/Bluewater/       # Framework core (PSR-4)
├── bin/                 # CLI tools
├── app/                 # Per-tenant APIs
├── public/              # Entry point
├── cache/               # Runtime cache
├── tests/               # PHPUnit test suites
└── docs/                # Documentation
````

---

## 🛡️ Community Standards

* Be respectful and constructive
* Keep feedback technical and focused
* Use inclusive, welcoming language
* Code should be readable and maintainable by others

---

## 🙏 Thank You!

Your contribution means a lot.
This project is built for builders — and made stronger by you.

> — The Bluewater Team 🌊

```
