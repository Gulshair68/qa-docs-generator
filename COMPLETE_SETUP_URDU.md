# 🚀 Complete Setup Guide - Bilkul Shuru Se (Zero to Hero)

## ⚡ Ye Guide Kis Ke Liye Hai?

Agar aapke paas:
- ❌ Python install nahi hai
- ❌ Koi programming experience nahi hai
- ❌ Bas ek working computer hai

To ye guide bilkul aapke liye hai! Main aapko **step-by-step** sab kuch setup karwa dunga.

---

## 📋 Table of Contents

1. [Python Installation](#part-1-python-installation)
2. [Project Setup](#part-2-project-setup)
3. [Claude API Key](#part-3-claude-api-key-setup)
4. [First Test Plan](#part-4-pehla-test-plan-generate-karein)
5. [Troubleshooting](#troubleshooting)

---

## Part 1: Python Installation

### 🪟 **WINDOWS Users** (Sabse Common)

#### Step 1.1: Python Download Karein

1. **Web browser kholein** (Chrome, Edge, Firefox - koi bhi)

2. Is link par jayein: **https://www.python.org/downloads/**

3. Aapko **yellow button** dikhai dega jis par likha hoga:
   ```
   Download Python 3.12.x
   ```
   (Number thoda different ho sakta hai - koi baat nahi)

4. **Is button par click karein** - file download hogi (50-60 MB)

#### Step 1.2: Python Install Karein

1. Downloaded file par **double-click** karein (usually Downloads folder mein hoga)

2. **❗ BOHOT ZAROORI ❗** - Installer ke neeche **2 checkboxes** honge:
   ```
   ☐ Install launcher for all users (recommended)
   ☐ Add Python to PATH
   ```
   
   **Dono boxes ko check karein!** ✅ ✅
   
   Especially **"Add Python to PATH"** - ye bohot important hai!

3. Ab **"Install Now"** par click karein

4. Wait karein - 2-3 minutes lagenge

5. Jab "Setup was successful" dikhe, to **"Close"** par click karein

#### Step 1.3: Verify Karein (Check Karein)

1. **Start Menu** kholein (Windows key dabayein)

2. Type karein: **`cmd`**

3. **Command Prompt** app par click karein (black screen wala)

4. Is command type karein aur **Enter** dabayein:
   ```
   python --version
   ```

5. Agar aapko kuch aisa dikhe:
   ```
   Python 3.12.1
   ```
   To ✅ **Congratulations!** Python install ho gaya!

6. Agar error aaye ("python is not recognized"), to:
   - Computer ko **restart** karein
   - Phir se cmd mein try karein
   - Agar phir bhi na ho to Python ko **uninstall** karke **dubara install** karein (is baar "Add to PATH" zaroor check karein!)

---

### 🍎 **macOS Users**

#### Step 1.1: Homebrew Install Karein (Package Manager)

1. **Terminal** kholein:
   - Spotlight search kholein (Cmd + Space)
   - Type karein: **Terminal**
   - Enter dabayein

2. Ye complete command **copy-paste** karein aur Enter dabayein:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. Password manga to apna Mac password enter karein (typing mein kuch nazar nahi aayega - normal hai)

4. Wait karein - 5-10 minutes lag sakte hain

#### Step 1.2: Python Install Karein

1. Terminal mein ye command run karein:
   ```bash
   brew install python3
   ```

2. Wait karein - 2-3 minutes

#### Step 1.3: Verify Karein

Terminal mein type karein:
```bash
python3 --version
```

Agar version number dikhe (jese: Python 3.12.1) to ✅ Done!

---

### 🐧 **Linux Users** (Ubuntu/Debian)

#### Terminal kholein aur ye commands run karein:

```bash
# Update package list
sudo apt-get update

# Install Python 3 and pip
sudo apt-get install python3 python3-pip

# Verify
python3 --version
```

---

## Part 2: Project Setup

### Step 2.1: Folder Banayein

**Windows:**
1. File Explorer kholein
2. Jahan chahen folder banayein (Desktop par bana sakte hain)
3. Right-click → New → Folder
4. Naam rakhen: **`TestPlanGenerator`**

**macOS/Linux:**
```bash
mkdir ~/TestPlanGenerator
cd ~/TestPlanGenerator
```

### Step 2.2: Files Download Karein

Saari files jo maine aapko di hain, unhe **TestPlanGenerator** folder mein copy karein:

**Zaroori Files:**
- ✅ `generate_test_plan.py`
- ✅ `requirements.txt`
- ✅ `README.md`
- ✅ `QUICK_START_URDU.md`
- ✅ `.env.example`

### Step 2.3: Command Prompt/Terminal Us Folder Mein Kholein

**Windows:**
1. **TestPlanGenerator** folder kholein
2. Address bar par click karein (jahan folder path dikhai deta hai)
3. Type karein: **`cmd`** aur Enter dabayein
4. Command Prompt khul jayega us folder mein

**macOS/Linux:**
```bash
cd ~/TestPlanGenerator
```

### Step 2.4: Dependencies Install Karein

Command prompt/terminal mein ye command run karein:

**Windows:**
```cmd
pip install -r requirements.txt
```

**macOS/Linux:**
```bash
pip3 install -r requirements.txt
```

Wait karein - 1-2 minutes lagenge. Aapko bohot saari lines dikhengi jese:
```
Collecting anthropic>=0.39.0
Downloading anthropic-...
Installing collected packages: ...
Successfully installed anthropic-... PyPDF2-... python-docx-...
```

Jab **"Successfully installed"** dikhe to ✅ Done!

---

## Part 3: Claude API Key Setup

### Step 3.1: Anthropic Account Banayein

1. Browser mein jayein: **https://console.anthropic.com/**

2. **Sign Up** par click karein

3. Apni details enter karein:
   - Email address
   - Password
   - Name

4. Email verify karein (inbox check karein)

5. Login karein

### Step 3.2: API Key Banayein

1. Login hone ke baad, **left sidebar** mein **"API Keys"** par click karein

2. **"Create Key"** button par click karein

3. Key ka naam dein: **`Test Plan Generator`**

4. **Create** par click karein

5. API Key copy karein - ye kuch aisa hoga:
   ```
   sk-ant-api03-xxxxxxxxxxxxxxxxxxxxxxxxxxxx
   ```
   
   ⚠️ **BOHOT IMPORTANT:** 
   - Ye key **copy karke notepad mein save kar lein**
   - Ye dubara nazar nahi aayegi!
   - Is key ko **secret** rakhein - kisi ko mat batayein

### Step 3.3: API Key Set Karein

#### **Windows:**

**Method 1: Simple (Temporary - har baar command prompt kholne par set karna padega)**

Command Prompt mein ye command run karein (apni key dal kar):
```cmd
set ANTHROPIC_API_KEY=sk-ant-api03-your-actual-key-here
```

**Method 2: Permanent (Recommended)**

1. **Start Menu** → Search: **"Environment Variables"**
2. **"Edit the system environment variables"** par click karein
3. **"Environment Variables"** button par click karein
4. **User variables** section mein **"New"** par click karein
5. Variable name: **`ANTHROPIC_API_KEY`**
6. Variable value: **`sk-ant-api03-your-actual-key-here`** (apni key paste karein)
7. **OK** → **OK** → **OK**
8. **Command Prompt ko close karke dobara kholein**

Verify karein:
```cmd
echo %ANTHROPIC_API_KEY%
```
Apni key nazar aani chahiye.

#### **macOS/Linux:**

Terminal mein ye commands run karein:

**Temporary (current session ke liye):**
```bash
export ANTHROPIC_API_KEY='sk-ant-api03-your-actual-key-here'
```

**Permanent (recommended):**

macOS (zsh):
```bash
echo 'export ANTHROPIC_API_KEY="sk-ant-api03-your-actual-key-here"' >> ~/.zshrc
source ~/.zshrc
```

Linux (bash):
```bash
echo 'export ANTHROPIC_API_KEY="sk-ant-api03-your-actual-key-here"' >> ~/.bashrc
source ~/.bashrc
```

Verify:
```bash
echo $ANTHROPIC_API_KEY
```

---

## Part 4: Pehla Test Plan Generate Karein! 🎉

### Step 4.1: Requirements PDF Tayyar Karein

1. Apna **requirements PDF** ko **TestPlanGenerator** folder mein copy karein

2. Naam simple rakhein, spaces avoid karein:
   - ✅ Good: `requirements.pdf`, `order_tracking.pdf`
   - ❌ Avoid: `My Requirements Doc.pdf`, `test req.pdf`

### Step 4.2: Script Chalayein

Command Prompt/Terminal mein (TestPlanGenerator folder mein) ye command run karein:

**Windows:**
```cmd
python generate_test_plan.py requirements.pdf "My First Test Plan"
```

**macOS/Linux:**
```bash
python3 generate_test_plan.py requirements.pdf "My First Test Plan"
```

### Step 4.3: Wait Karein ⏳

Aapko screen par kuch aisa dikhega:
```
============================================================
🚀 Automated Test Plan Generator using Claude API
============================================================
📄 Reading PDF: requirements.pdf
   Total pages: 6
   Extracted page 1/6
   Extracted page 2/6
   ...
✅ Successfully extracted 12450 characters

🤖 Calling Claude API to generate test plan...
```

**Wait karein 15-30 seconds...**

```
✅ Received response from Claude
✅ Successfully parsed test plan JSON

📝 Creating Word document...
✅ Word document created: My_First_Test_Plan_Test_Plan.docx
✅ JSON saved: My_First_Test_Plan_Test_Plan.json

============================================================
✅ Test Plan Generation Complete!
📄 Word Document: My_First_Test_Plan_Test_Plan.docx
📋 JSON File: My_First_Test_Plan_Test_Plan.json
============================================================
```

### Step 4.4: Output Files Check Karein

**TestPlanGenerator** folder mein check karein - 2 nayi files hongi:

1. **`My_First_Test_Plan_Test_Plan.docx`** ← Ye aapka test plan hai!
2. **`My_First_Test_Plan_Test_Plan.json`** ← Technical reference

### Step 4.5: Word Document Kholein

1. `.docx` file par **double-click** karein
2. Microsoft Word mein khulega
3. **Complete professional test plan** dekhen! 🎉

---

## 🎯 Daily Usage (Setup Ke Baad)

Jab aapko dobara test plan banana ho:

### Windows:
```cmd
REM 1. TestPlanGenerator folder mein jayein
cd C:\Users\YourName\Desktop\TestPlanGenerator

REM 2. (Agar permanent API key set nahi kiya) API key set karein
set ANTHROPIC_API_KEY=sk-ant-api03-your-key-here

REM 3. Script chalayein
python generate_test_plan.py your_requirements.pdf "Project Name"
```

### macOS/Linux:
```bash
# 1. Folder mein jayein
cd ~/TestPlanGenerator

# 2. (Agar permanent set nahi kiya) API key set karein
export ANTHROPIC_API_KEY='sk-ant-api03-your-key-here'

# 3. Script chalayein
python3 generate_test_plan.py your_requirements.pdf "Project Name"
```

---

## 🐛 Troubleshooting (Common Problems)

### ❌ Problem: "python is not recognized"

**Solution:**
1. Python install hua hai? Check karein: Control Panel → Programs
2. Agar install hai to path issue hai:
   - Python **uninstall** karein
   - **Dobara install** karein
   - Is baar **"Add Python to PATH"** checkbox ✅ zaroor check karein
3. Computer **restart** karein

### ❌ Problem: "No module named 'anthropic'"

**Solution:**
```bash
pip install -r requirements.txt --force-reinstall
```

### ❌ Problem: "ANTHROPIC_API_KEY not set"

**Solution:**
- Environment variable properly set kiya hai?
- Permanent method use kiya hai to command prompt/terminal **restart** karein
- Temporary method use kar rahe hain to har baar set karna padega:
  ```cmd
  set ANTHROPIC_API_KEY=your-key-here  # Windows
  export ANTHROPIC_API_KEY='your-key'  # macOS/Linux
  ```

### ❌ Problem: "Error reading PDF"

**Solution:**
- PDF file ka naam check karein (spaces avoid karein)
- PDF file TestPlanGenerator folder mein hai?
- PDF corrupted to nahi?
- Full path try karein:
  ```cmd
  python generate_test_plan.py "C:\full\path\to\requirements.pdf" "Project"
  ```

### ❌ Problem: "Permission denied"

**Windows Solution:**
- Command Prompt ko **"Run as Administrator"** karein

**macOS/Linux Solution:**
```bash
sudo pip3 install -r requirements.txt
```

---

## 📞 Quick Help Commands

### Check Kya Install Hai:
```bash
# Python version
python --version

# pip version
pip --version

# Installed packages
pip list

# API key set hai?
echo %ANTHROPIC_API_KEY%     # Windows
echo $ANTHROPIC_API_KEY      # macOS/Linux
```

### Agar Sab Kuch Fresh Start Chahiye:
```bash
# Virtual environment (optional but recommended)
python -m venv venv
venv\Scripts\activate           # Windows
source venv/bin/activate        # macOS/Linux

# Dependencies install
pip install -r requirements.txt
```

---

## 💰 Cost (Claude API)

- Claude API paid hai (but bohot sasta)
- Pehle **$5 free credit** milta hai
- Ek test plan generation: **$0.10 - $0.30**
- Free credit se **20-50 test plans** bana sakte hain

---

## ✅ Checklist - Sab Kuch Ready Hai?

- ✅ Python install hai aur working hai (`python --version` works)
- ✅ pip install hai aur working hai (`pip --version` works)
- ✅ Dependencies install hain (`pip list` mein anthropic dikhai deta hai)
- ✅ Claude API key set hai (`echo` command se verify kiya)
- ✅ Requirements PDF ready hai
- ✅ Script file (generate_test_plan.py) folder mein hai

**Agar saare ✅ hain to aap READY hain!** 🚀

---

## 🎓 Video Tutorial Style Steps

1. ✅ Python download → Install (Add to PATH check karein!)
2. ✅ Folder banayein (TestPlanGenerator)
3. ✅ Files copy karein (sab files folder mein)
4. ✅ Command prompt/terminal kholein us folder mein
5. ✅ `pip install -r requirements.txt` run karein
6. ✅ Anthropic account banayein + API key generate karein
7. ✅ API key environment variable mein set karein
8. ✅ Requirements PDF folder mein copy karein
9. ✅ Script chalayein: `python generate_test_plan.py requirements.pdf "Project"`
10. ✅ Generated .docx file check karein!

---

**Bas itna hi! Aap ab professional test plans generate kar sakte hain! 🎉**

Koi problem ho to mujhe batayein, main help karunga! 😊
