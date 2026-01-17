# 🐙 GitHub Setup Guide - Safe & Secure

## ⚠️ CRITICAL - Read This First!

**Before pushing to GitHub, ensure:**
1. ✅ No API keys in code
2. ✅ `.gitignore` is properly configured
3. ✅ Security check passes
4. ✅ Sensitive files excluded

**If you expose an API key:**
- 🚨 Deactivate it IMMEDIATELY at https://console.anthropic.com/
- 🚨 Generate a new key
- 🚨 Never reuse the exposed key

---

## 🎯 Step-by-Step Setup

### Step 1: Navigate to Project

```bash
cd ~/Desktop/TestPlanGenerator
```

### Step 2: Initialize Git (if not already done)

```bash
# Check if Git is initialized
if [ -d ".git" ]; then
    echo "✅ Git already initialized"
else
    echo "Initializing Git..."
    git init
fi
```

### Step 3: Copy Essential Files

```bash
# Copy .gitignore
cp /path/to/downloaded/.gitignore .

# Copy .env.example
cp /path/to/downloaded/.env.example .

# Copy security check script
cp /path/to/downloaded/security_check.sh .
chmod +x security_check.sh

# Copy README
cp /path/to/downloaded/README.md .
```

### Step 4: Create .env from .env.example

```bash
# Create .env file (this stays LOCAL, never push)
cp .env.example .env

# Edit .env with your actual keys
nano .env
# Add: ANTHROPIC_API_KEY=your_actual_key_here
# Save: Ctrl+O, Enter, Ctrl+X
```

### Step 5: Run Security Check

```bash
# Make script executable
chmod +x security_check.sh

# Run security check
./security_check.sh
```

**Expected output:**
```
🔒 Security Check - Scanning for Exposed Secrets
==================================================

🔍 Check 1: Scanning for API keys...
✅ No API keys found in tracked files

🔍 Check 2: Checking .gitignore file...
✅ .gitignore looks good

🔍 Check 3: Checking for sensitive files...
✅ No sensitive files tracked

🔍 Check 4: Checking for large files...
✅ No large files found

🔍 Check 5: Checking for PDF/Excel files...
✅ No document files tracked

🔍 Check 6: Scanning Git history...
✅ Git history looks clean

🔍 Check 7: Verifying environment variables...
✅ Using environment variables properly

==================================================
📊 Security Check Summary
==================================================
✅ ALL CHECKS PASSED!

Your repository is safe to push to GitHub! 🎉
```

### Step 6: Review Files to Commit

```bash
# See what will be committed
git status

# Should see (GOOD):
# - *.py files
# - *.md files
# - *.sh files
# - requirements.txt
# - .gitignore
# - .env.example

# Should NOT see (BAD):
# - .env
# - *.pdf files
# - *.docx files
# - *.xlsx files
# - API keys anywhere
```

### Step 7: Add Files to Git

```bash
# Add safe files
git add .gitignore
git add .env.example
git add README.md
git add requirements.txt
git add *.py
git add *.md
git add *.sh

# Check what's staged
git status
```

### Step 8: Verify No Secrets Before Commit

```bash
# Final check - scan staged files
git diff --cached | grep -i "sk-ant-api"
git diff --cached | grep -i "api_key.*="

# Should return NOTHING
# If anything found, DON'T commit!
```

### Step 9: Make Initial Commit

```bash
# Create first commit
git commit -m "Initial commit: QA Documentation Generator

- Test plan generator
- Test cases generator
- Web UI with Streamlit
- Confluence integration
- CLI tools
- Documentation"
```

### Step 10: Create GitHub Repository

```bash
# Go to https://github.com/new
# Create new repository (don't initialize with README)
# Copy the repository URL
```

### Step 11: Link to GitHub

```bash
# Add remote (replace with YOUR GitHub URL)
git remote add origin https://github.com/yourusername/qa-docs-generator.git

# Verify remote
git remote -v
```

### Step 12: Push to GitHub

```bash
# Push to main branch
git branch -M main
git push -u origin main
```

---

## ✅ Post-Push Verification

### Check 1: GitHub Web UI

```
1. Go to your GitHub repo
2. Click on files
3. Verify .env is NOT there
4. Verify .gitignore IS there
5. Check no API keys visible
```

### Check 2: Clone Test

```bash
# Test clone in different directory
cd /tmp
git clone https://github.com/yourusername/qa-docs-generator.git
cd qa-docs-generator

# Check for secrets
grep -r "sk-ant-api" .
# Should return NOTHING or only in .gitignore comments

# Cleanup
cd ~
rm -rf /tmp/qa-docs-generator
```

---

## 🔄 Regular Workflow

### Before Every Push

```bash
# 1. Run security check
./security_check.sh

# 2. Check what's changed
git status

# 3. Review changes
git diff

# 4. Add files
git add <files>

# 5. Commit
git commit -m "Description of changes"

# 6. Push
git push
```

---

## 🚨 Emergency - Exposed Key!

### If You Accidentally Committed a Secret

```bash
# 1. IMMEDIATELY deactivate the key
# Go to: https://console.anthropic.com/
# Deactivate exposed key

# 2. Remove from latest commit
git reset HEAD~1
# Edit files to remove secret
# Recommit without secret

# 3. If already pushed, force push
git push --force

# 4. If in history, use BFG Repo-Cleaner
# Download from: https://rtyley.github.io/bfg-repo-cleaner/
java -jar bfg.jar --replace-text passwords.txt
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push --force
```

### Prevention is Better

```bash
# Use pre-commit hook
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
./security_check.sh
if [ $? -ne 0 ]; then
    echo "❌ Security check failed! Commit blocked."
    exit 1
fi
EOF

chmod +x .git/hooks/pre-commit
```

---

## 📝 .gitignore Explained

### Critical Entries

```gitignore
# API Keys and Secrets
.env                    # YOUR actual keys
.env.local
config.py              # Any config with secrets

# Generated Output
*.docx                 # Test plans (may have sensitive data)
*.xlsx                 # Test cases
*.pdf                  # Requirements (sensitive)

# Virtual Environment
venv/                  # Large, user-specific

# Python Cache
__pycache__/           # Auto-generated

# OS Files
.DS_Store              # Mac
Thumbs.db              # Windows
```

---

## 🔒 Security Best Practices

### ✅ DO

- Use environment variables for secrets
- Add `.env` to `.gitignore`
- Run security checks before pushing
- Use `.env.example` as template
- Commit only source code
- Review diffs before commit
- Use strong API keys
- Rotate keys regularly

### ❌ DON'T

- Hardcode API keys in code
- Commit `.env` file
- Share API keys in chat/email
- Push generated output files
- Ignore security warnings
- Reuse exposed keys
- Commit passwords
- Skip security checks

---

## 🎓 Git Commands Reference

### Check Status

```bash
# What's changed
git status

# See changes
git diff

# See staged changes
git diff --cached

# View commit history
git log --oneline
```

### Undo Changes

```bash
# Unstage file
git reset HEAD <file>

# Discard changes
git checkout -- <file>

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1
```

### Branches

```bash
# Create branch
git checkout -b feature-name

# Switch branch
git checkout main

# Merge branch
git merge feature-name

# Delete branch
git branch -d feature-name
```

---

## 📋 Checklist Before Push

```
[ ] Security check passes (./security_check.sh)
[ ] No .env file in repo
[ ] No API keys in code
[ ] No PDF/Excel files (unless examples)
[ ] .gitignore is present
[ ] .env.example is present
[ ] README.md is updated
[ ] Commit message is clear
[ ] Changes reviewed
[ ] All files tested locally
```

---

## 🆘 Common Issues

### Issue 1: ".env file tracked"

```bash
# Remove from Git (keep local)
git rm --cached .env

# Add to .gitignore
echo ".env" >> .gitignore

# Commit
git add .gitignore
git commit -m "Remove .env from tracking"
```

### Issue 2: "Large files warning"

```bash
# Remove large file
git rm --cached large_file.pdf

# Add to .gitignore
echo "*.pdf" >> .gitignore

# Commit
git add .gitignore
git commit -m "Remove large files"
```

### Issue 3: "API key in history"

```bash
# Use BFG Repo-Cleaner
# Or rewrite history
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch .env" \
  --prune-empty --tag-name-filter cat -- --all

# Force push
git push --force
```

---

## 🎯 Quick Setup Commands (Copy-Paste)

```bash
# Complete setup in one go
cd ~/Desktop/TestPlanGenerator

# Initialize Git
git init

# Copy essential files (adjust paths)
# cp .gitignore .env.example security_check.sh README.md .

# Create .env from template
cp .env.example .env
# Edit .env with your keys

# Run security check
chmod +x security_check.sh
./security_check.sh

# Add files
git add .gitignore .env.example README.md requirements.txt *.py *.md *.sh

# Commit
git commit -m "Initial commit: QA Documentation Generator"

# Add remote (replace URL)
git remote add origin https://github.com/yourusername/qa-docs-generator.git

# Push
git branch -M main
git push -u origin main

echo "✅ Setup complete! Check GitHub repo."
```

---

## 📞 Need Help?

If something goes wrong:
1. **Don't panic**
2. **Don't push** if unsure
3. **Run security check** again
4. **Review this guide** carefully
5. **Ask for help** if needed

**Remember:** It's better to be safe than sorry! 🔒

---

**Stay secure! 🛡️**
