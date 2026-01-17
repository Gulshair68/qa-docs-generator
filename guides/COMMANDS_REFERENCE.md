# 🎯 Complete Command Reference - All Scripts

## 📚 Ye File Kya Hai?

Saare commands ek jagah - quick reference ke liye! Copy-paste karein aur use karein!

---

## 🚀 Basic Setup (First Time Only)

### Mac Setup:
```bash
# 1. Navigate to project
cd ~/Desktop/TestPlanGenerator

# 2. Activate virtual environment (if created)
source venv/bin/activate

# 3. Verify API key
echo $ANTHROPIC_API_KEY
```

### Agar API key nahi hai:
```bash
# Claude API key
export ANTHROPIC_API_KEY='sk-ant-api03-your-key-here'

# Confluence (optional)
export CONFLUENCE_URL='https://company.atlassian.net'
export CONFLUENCE_EMAIL='your@email.com'
export CONFLUENCE_API_TOKEN='your-token'
export CONFLUENCE_SPACE_KEY='QA'
```

---

## 📝 Test Plan Commands

### Generate Test Plan Only:
```bash
python3 generate_test_plan.py requirements.pdf "Project Name"
```

**Output:**
- `Project_Name_Test_Plan.docx` (Word document)
- `Project_Name_Test_Plan.json` (JSON data)

### Examples:
```bash
# Example 1: Order Tracking
python3 generate_test_plan.py order_tracking.pdf "Order Tracking Phase 2"

# Example 2: WebView
python3 generate_test_plan.py webview.pdf "WebView Integration"

# Example 3: Payment Gateway
python3 generate_test_plan.py payment.pdf "Payment Gateway"
```

---

## 🧪 Test Cases Commands

### Generate Test Cases Only:
```bash
python3 generate_test_cases.py requirements.pdf "Project Name"
```

**Output:**
- `Project_Name_Test_Cases.xlsx` (Excel file, 40-60 test cases)
- `Project_Name_Test_Cases.json` (JSON data)

### Examples:
```bash
# Example 1: Login Flow
python3 generate_test_cases.py login.pdf "Login Flow v2"

# Example 2: Checkout
python3 generate_test_cases.py checkout.pdf "Checkout Process"

# Example 3: Search
python3 generate_test_cases.py search.pdf "Search Feature"
```

---

## 🎯 Complete QA Documentation

### Generate Both (Test Plan + Test Cases):
```bash
python3 generate_complete_qa_docs.py requirements.pdf "Project Name"
```

**Interactive Prompts:**
```
What would you like to generate?
1. Test Plan only
2. Test Cases only
3. Both Test Plan and Test Cases (Recommended)

Enter your choice (1/2/3) [default: 3]: 3

Upload to Confluence? (y/n) [default: n]: n
```

**Output:**
- `Project_Name_Test_Plan.docx`
- `Project_Name_Test_Plan.json`
- `Project_Name_Test_Cases.xlsx`
- `Project_Name_Test_Cases.json`

### Non-interactive (Auto-select both):
```bash
# For automation - no prompts
echo "3
n" | python3 generate_complete_qa_docs.py requirements.pdf "Project"
```

---

## 🔗 Confluence Upload Commands

### Upload Test Plan to Confluence:
```bash
python3 confluence_upload.py Project_Name_Test_Plan.docx
```

### Generate + Auto Upload:
```bash
python3 generate_and_upload.py requirements.pdf "Project Name"
```

### Setup Confluence (First Time):
```bash
python3 setup_confluence.py
```

---

## 📊 Quick Workflow Commands

### Workflow 1: Just Document Generation (No Upload)
```bash
# Test plan only
python3 generate_test_plan.py requirements.pdf "Sprint 24"

# Test cases only
python3 generate_test_cases.py requirements.pdf "Sprint 24"

# Both
python3 generate_complete_qa_docs.py requirements.pdf "Sprint 24"
```

### Workflow 2: Generate + Confluence Upload
```bash
# Test plan with upload
python3 generate_and_upload.py requirements.pdf "Sprint 24"

# Complete docs (manual upload)
python3 generate_complete_qa_docs.py requirements.pdf "Sprint 24"
python3 confluence_upload.py Sprint_24_Test_Plan.docx
```

### Workflow 3: Review First, Then Upload
```bash
# 1. Generate
python3 generate_complete_qa_docs.py requirements.pdf "Feature X"

# 2. Review files
open Feature_X_Test_Plan.docx
open Feature_X_Test_Cases.xlsx

# 3. Upload if satisfied
python3 confluence_upload.py Feature_X_Test_Plan.docx
```

---

## 🔍 Verification Commands

### Check Setup:
```bash
# Check Python
python3 --version

# Check dependencies
pip3 list | grep -E "anthropic|PyPDF2|python-docx|openpyxl"

# Check API keys
echo $ANTHROPIC_API_KEY
echo $CONFLUENCE_URL
echo $CONFLUENCE_SPACE_KEY

# Check scripts exist
ls -la generate_*.py
```

### Test Generation:
```bash
# Quick test with any PDF
python3 generate_test_plan.py sample.pdf "Test"
python3 generate_test_cases.py sample.pdf "Test"
```

---

## 📁 File Management Commands

### List Generated Files:
```bash
# All test plans
ls -lh *_Test_Plan.docx

# All test cases
ls -lh *_Test_Cases.xlsx

# All JSON files
ls -lh *.json

# Today's files
ls -lt *.docx *.xlsx | head -10
```

### Open Files:
```bash
# Open Word document
open Project_Name_Test_Plan.docx

# Open Excel file
open Project_Name_Test_Cases.xlsx

# Open in specific app
open -a "Microsoft Word" Project_Name_Test_Plan.docx
open -a "Microsoft Excel" Project_Name_Test_Cases.xlsx
```

### Clean Up:
```bash
# Remove all generated test files
rm -f *_Test_Plan.*
rm -f *_Test_Cases.*

# Remove specific project
rm -f Sprint_24_*

# Backup before cleanup
mkdir backup_$(date +%Y%m%d)
mv *_Test_* backup_$(date +%Y%m%d)/
```

---

## 🎨 Customization Commands

### Batch Processing (Multiple PDFs):
```bash
# Process all PDFs in current folder
for pdf in *.pdf; do
    name=$(basename "$pdf" .pdf)
    python3 generate_complete_qa_docs.py "$pdf" "$name"
done
```

### With Custom Options:
```bash
# Set custom model (if needed)
ANTHROPIC_MODEL="claude-sonnet-4-20250514" python3 generate_test_plan.py requirements.pdf "Project"

# Use different Confluence space
CONFLUENCE_SPACE_KEY="DEV" python3 confluence_upload.py Test_Plan.docx
```

---

## 🔧 Troubleshooting Commands

### Fix Dependencies:
```bash
# Reinstall all
pip3 install -r requirements.txt --force-reinstall

# Update specific package
pip3 install --upgrade anthropic
pip3 install --upgrade openpyxl
```

### Reset Virtual Environment:
```bash
# Remove old venv
rm -rf venv

# Create new
python3 -m venv venv

# Activate
source venv/bin/activate

# Install dependencies
pip3 install -r requirements.txt
```

### Clear Cache:
```bash
# Clear Python cache
find . -type d -name "__pycache__" -exec rm -rf {} +
find . -type f -name "*.pyc" -delete
```

---

## 💡 Useful Aliases

### Add to ~/.zprofile:
```bash
# Navigate to project
alias qatools="cd ~/Desktop/TestPlanGenerator && source venv/bin/activate"

# Generate test plan
alias genplan="cd ~/Desktop/TestPlanGenerator && source venv/bin/activate && python3 generate_test_plan.py"

# Generate test cases
alias gencases="cd ~/Desktop/TestPlanGenerator && source venv/bin/activate && python3 generate_test_cases.py"

# Generate both
alias genall="cd ~/Desktop/TestPlanGenerator && source venv/bin/activate && python3 generate_complete_qa_docs.py"

# Upload to Confluence
alias confup="cd ~/Desktop/TestPlanGenerator && source venv/bin/activate && python3 confluence_upload.py"

# Reload configuration
source ~/.zprofile
```

### Usage After Aliases:
```bash
# Just navigate
qatools

# Generate test plan
genplan requirements.pdf "Project"

# Generate test cases
gencases requirements.pdf "Project"

# Generate everything
genall requirements.pdf "Project"

# Upload
confup Project_Test_Plan.docx
```

---

## 📊 Statistics & Analysis

### Count Test Cases:
```bash
# Count test cases in Excel (approximate)
python3 << EOF
from openpyxl import load_workbook
wb = load_workbook('Project_Test_Cases.xlsx')
sheet = wb.active
print(f"Total test cases: {sheet.max_row - 1}")
EOF
```

### File Sizes:
```bash
# Size of all generated files
du -sh *_Test_*

# Detailed list
ls -lh *_Test_* | awk '{print $5, $9}'
```

---

## 🎯 Complete Example Workflows

### Example 1: New Sprint Documentation
```bash
#!/bin/bash
# Create complete QA docs for new sprint

PDF="sprint_25_requirements.pdf"
PROJECT="Sprint 25"

echo "Generating QA documentation for: $PROJECT"

# Generate both docs
python3 generate_complete_qa_docs.py "$PDF" "$PROJECT"

# Open for review
open Sprint_25_Test_Plan.docx
open Sprint_25_Test_Cases.xlsx

echo "✅ Done! Review files before uploading to Confluence"
```

### Example 2: Bug Fix Testing
```bash
#!/bin/bash
# Generate test cases for bug fix

PDF="bug_fix_1234.pdf"
PROJECT="Bug Fix 1234"

# Just test cases for regression
python3 generate_test_cases.py "$PDF" "$PROJECT"

# Auto-upload
python3 confluence_upload.py Bug_Fix_1234_Test_Cases.xlsx

echo "✅ Test cases uploaded to Confluence"
```

### Example 3: Weekly QA Reports
```bash
#!/bin/bash
# Generate weekly QA documentation

WEEK=$(date +%Y-W%U)

for pdf in requirements_*.pdf; do
    name=$(basename "$pdf" .pdf)
    echo "Processing: $name"
    python3 generate_complete_qa_docs.py "$pdf" "$WEEK - $name"
done

echo "✅ All weekly docs generated"
```

---

## 📋 Quick Reference Table

| Task | Command |
|------|---------|
| **Test Plan** | `python3 generate_test_plan.py req.pdf "Name"` |
| **Test Cases** | `python3 generate_test_cases.py req.pdf "Name"` |
| **Both** | `python3 generate_complete_qa_docs.py req.pdf "Name"` |
| **Upload** | `python3 confluence_upload.py file.docx` |
| **Setup Confluence** | `python3 setup_confluence.py` |
| **Open File** | `open filename.docx` |
| **Check Setup** | `echo $ANTHROPIC_API_KEY` |

---

## 🆘 Emergency Commands

### If nothing works:
```bash
# 1. Check you're in right folder
pwd

# 2. Check virtual env is activated
which python3

# 3. Check API key
echo $ANTHROPIC_API_KEY

# 4. Reinstall everything
pip3 install -r requirements.txt --force-reinstall

# 5. Try simplest command
python3 generate_test_plan.py requirements.pdf "Test"
```

---

## ✅ Daily Use - Quick Copy-Paste

### Morning Routine:
```bash
cd ~/Desktop/TestPlanGenerator
source venv/bin/activate
```

### Generate Docs:
```bash
python3 generate_complete_qa_docs.py requirements.pdf "Today's Project"
```

### Review & Upload:
```bash
open Today's_Project_Test_Plan.docx
open Today's_Project_Test_Cases.xlsx
python3 confluence_upload.py Todays_Project_Test_Plan.docx
```

**That's it! 🎉**

---

**Save this file as your cheat sheet! Copy commands as needed! 📋**
