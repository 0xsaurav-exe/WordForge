# 🔥 WordForge

WordForge is a lightweight CLI tool built in Bash to **filter, refine, and optimize password wordlists** for cybersecurity and VAPT workflows.

---

## ⚡ Demo

```bash
./wordforge.sh
```

```
Enter path to wordlist file: rockyou.txt
Choose option: 1
Enter length: 5
```

Output:

```
output/optimized_rockyou.txt
```

---

## 🚀 Features

* 🔍 Filter by length
* 🧠 Pattern matching (e.g. `admin*`)
* 🔢 Character filtering
* ♻️ Remove duplicates
* ⚡ Fast and portable (works on any Linux)

---

## 📦 Installation

```bash
git clone https://github.com/0xsaurav-exe/WordForge.git
cd WordForge
chmod +x wordforge.sh
```

---

## ⚙️ Usage

```bash
./wordforge.sh
```

Follow the interactive prompts.

---

## 📁 Output

All results are saved in:

```
output/optimized_<filename>.txt
```

---

## 🎯 Why WordForge?

Large wordlists like `rockyou.txt` contain millions of entries.
WordForge helps you:

* reduce unnecessary data
* target specific password patterns
* prepare optimized lists for brute-force and auditing

---

## 🧪 Use Cases

* Password auditing
* Wordlist optimization
* Brute-force preparation
* Security research

---

## ⚠️ Disclaimer

This tool is for **educational and ethical use only**.

---

## 👨‍💻 Author

**0xsaurav-exe**
