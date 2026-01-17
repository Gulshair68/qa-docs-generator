# 🚀 QA Documentation Generator

[![Python Version](https://img.shields.io/badge/python-3.8%2B-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Anthropic Claude](https://img.shields.io/badge/AI-Claude%20Sonnet%204-purple)](https://www.anthropic.com/)
[![Streamlit](https://img.shields.io/badge/UI-Streamlit-red)](https://streamlit.io/)

An AI-powered automation tool that generates professional QA documentation from requirement PDFs using Anthropic's Claude AI.

**Transform hours of manual work into minutes of automation!**

---

## 📖 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [What It Generates](#-what-it-generates)
- [Quick Start](#-quick-start)
- [Installation](#-installation)
- [Configuration](#-configuration)
- [Usage](#-usage)
- [Project Structure](#-project-structure)
- [Examples](#-examples)
- [Performance](#-performance)
- [Troubleshooting](#-troubleshooting)
- [Security](#-security)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🌟 Overview

QA Documentation Generator automates the creation of comprehensive test documentation, saving **90%+ of manual effort**. Simply upload your requirements PDF and get professionally formatted test plans and test cases in seconds.

### Why Use This Tool?

- ⏰ **Save Time**: 7-10 hours manual work → 30-40 minutes automated
- 📊 **Consistent Quality**: AI-generated professional documentation every time
- 🎯 **Comprehensive Coverage**: Includes all testing types and scenarios
- 🔄 **Easy Updates**: Regenerate documentation as requirements change
- 🤖 **AI-Powered**: Leverages Claude Sonnet 4 for intelligent content creation

---

## ✨ Features

### 🤖 AI-Powered Generation
- Uses Anthropic's **Claude Sonnet 4** for intelligent content creation
- Understands context and generates relevant test scenarios
- Covers functional, integration, UI, performance, and security testing
- Analyzes requirements and creates comprehensive coverage

### 📄 Test Plan Generation
- **23 comprehensive sections** including:
  - Project information and metadata
  - Test strategy and approach
  - Scope definition (in-scope/out-of-scope)
  - Functional and non-functional requirements
  - Impact zone analysis with risk assessment
  - Entry and exit criteria
  - Test data requirements
  - Testing activities timeline
  - Roles and responsibilities
  - Risk management and mitigation strategies
  - Defect management process
  - Test metrics and KPIs
  - Deliverables and limitations
- Professional **Word document** output (.docx)
- **JSON format** for automation and reference

### 🧪 Test Cases Generation
- **40-60 detailed test cases** per document
- **Excel format** (.xlsx) with formatted columns:
  - Test Case ID
  - Module/Feature
  - Test Case Title
  - Detailed Description
  - Pre-conditions
  - Step-by-step test procedures
  - Expected results
  - Priority (P1/P2/P3)
  - Test Type (Functional/Integration/UI/Performance/Security)
  - Platform (Android/iOS/Web/Both)
- Color-coded priority levels
- Statistical summary with charts
- **JSON export** for test automation tools

### 🎨 Web UI (Streamlit)
- Beautiful, intuitive browser interface
- **Drag & drop** PDF upload
- Interactive checkboxes for selection
- Real-time progress tracking
- **Session persistence** - no data loss on page refresh
- Instant file downloads
- Statistics display
- Mobile-responsive design

### ⚡ Command Line Interface (CLI)
- **Batch processing** support
- Automation-ready scripts
- **CI/CD integration** compatible
- Multiple file processing
- Scriptable workflows

### 🔗 Confluence Integration (Optional)
- Auto-upload generated documents
- Creates formatted Confluence pages
- Attaches Word/Excel files automatically
- Configurable parent pages and spaces
- Interactive setup wizard
- Connection testing

---

## 🎯 What It Generates

### Test Plan Document Sections

The tool generates a comprehensive test plan with **20+ sections**:

1. **Project Information** - Name, version, team members, environment
2. **Description & Introduction** - Project overview and context
3. **Goal** - Clear testing objectives
4. **Test Strategy** - Detailed approach for:
   - Functional Testing
   - Integration Testing
   - UI/UX Testing
   - Performance Testing
   - Security Testing
   - Cross-Platform Testing
   - Regression Testing
5. **Test Scope** - In-scope and out-of-scope items clearly defined
6. **Functional Requirements** - Detailed requirements with acceptance criteria
7. **Non-Functional Requirements** - Performance, security, scalability needs
8. **Impact Zones** - Risk analysis (Red/Yellow/Green zones)
9. **Entry Criteria** - Prerequisites for starting testing
10. **Exit Criteria** - Conditions for completing testing
11. **Test Data Requirements** - Data needs and sources
12. **Test Environment** - Development, staging, production specifications
13. **Testing Activities** - Timeline with phases and milestones
14. **Roles & Responsibilities** - Team structure and assignments
15. **Risks & Mitigation** - Identified risks with mitigation plans
16. **Assumptions** - Project assumptions documented
17. **Dependencies** - External and internal dependencies
18. **Defect Management** - Bug classification (P1-P4) and workflow
19. **Test Metrics & KPIs** - Success measurement criteria
20. **Deliverables** - Expected outputs and artifacts
21. **Limitations & Exclusions** - Scope boundaries
22. **Approval Section** - Sign-off table for stakeholders

### Test Cases Coverage

Generates **40-60 comprehensive test cases** covering:

- ✅ **Positive scenarios** - Happy path testing
- ✅ **Negative scenarios** - Error handling
- ✅ **Edge cases** - Boundary conditions
- ✅ **Integration points** - System interactions
- ✅ **UI/UX validation** - User interface testing
- ✅ **Performance checks** - Load and response time
- ✅ **Security testing** - Authentication, authorization
- ✅ **Cross-platform** - Android, iOS, Web compatibility
- ✅ **Regression tests** - Existing functionality verification

---

## 🚀 Quick Start

### Prerequisites

- **Python 3.8 or higher** ([Download](https://www.python.org/downloads/))
- **Anthropic Claude API key** ([Get one here](https://console.anthropic.com/))
- **Operating System**: macOS, Linux, or Windows
- **Internet connection** for API calls

### One-Minute Setup

```bash
# 1. Clone repository
git clone https://github.com/Gulshair68/qa-docs-generator.git
cd qa-docs-generator

# 2. Create virtual environment
python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Configure API key
cp env.example .env
# Edit .env and add: ANTHROPIC_API_KEY=your-key-here

# 5. Run!
streamlit run web_ui_app.py
```

**That's it! Your browser will open automatically.** 🎉

---

## 🛠️ Installation

### Step 1: Check Python Installation

```bash
# Verify Python is installed
python3 --version

# Should show Python 3.8 or higher
```

**If Python is not installed:**

**macOS:**
```bash
brew install python3
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install python3 python3-pip
```

**Windows:**
Download from [python.org](https://www.python.org/downloads/)

### Step 2: Clone Repository

```bash
git clone https://github.com/Gulshair68/qa-docs-generator.git
cd qa-docs-generator
```

### Step 3: Create Virtual Environment (Recommended)

```bash
# Create virtual environment
python3 -m venv venv

# Activate it
# macOS/Linux:
source venv/bin/activate

# Windows (Command Prompt):
venv\Scripts\activate.bat

# Windows (PowerShell):
venv\Scripts\Activate.ps1
```

You should see `(venv)` in your terminal prompt.

### Step 4: Install Dependencies

```bash
pip install -r requirements.txt
```

This installs:
- `anthropic` - Claude AI API
- `streamlit` - Web UI framework
- `python-docx` - Word document generation
- `openpyxl` - Excel file generation
- `PyPDF2` - PDF processing
- `requests` - Confluence API (optional)

---

## 🔑 Configuration

### Step 1: Get Claude API Key

1. Go to [Anthropic Console](https://console.anthropic.com/)
2. Sign up or log in
3. Navigate to **API Keys** section
4. Click **Create Key**
5. Copy your API key (starts with `sk-ant-api03-`)

### Step 2: Configure Environment Variables

**Create `.env` file:**

```bash
# Copy template
cp env.example .env

# Edit with your favorite editor
nano .env
# or
code .env
```

**Add your API key:**

```env
# Required
ANTHROPIC_API_KEY=sk-ant-api03-your-actual-key-here

# Optional - Confluence Integration
CONFLUENCE_URL=https://yourcompany.atlassian.net
CONFLUENCE_EMAIL=your.email@company.com
CONFLUENCE_API_TOKEN=your_confluence_api_token
CONFLUENCE_SPACE_KEY=QA
CONFLUENCE_PARENT_PAGE_ID=123456789
```

### Alternative: Environment Variables (macOS/Linux)

**Temporary (current session):**
```bash
export ANTHROPIC_API_KEY='your-api-key-here'
```

**Permanent (add to shell profile):**
```bash
# For Zsh (macOS default)
echo 'export ANTHROPIC_API_KEY="your-key-here"' >> ~/.zprofile
source ~/.zprofile

# For Bash
echo 'export ANTHROPIC_API_KEY="your-key-here"' >> ~/.bashrc
source ~/.bashrc
```

### Alternative: Environment Variables (Windows)

**Command Prompt:**
```cmd
setx ANTHROPIC_API_KEY "your-api-key-here"
```

**PowerShell:**
```powershell
[Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", "your-key-here", "User")
```

### Step 3: Verify Configuration

```bash
# Check API key is set
python3 -c "import os; print('✅ API Key configured' if os.getenv('ANTHROPIC_API_KEY') else '❌ API Key not set')"
```

---

## 💻 Usage

### Method 1: Web UI (Recommended) 🌟

**Best for:** Quick generation, visual feedback, non-technical users

```bash
# Start web interface
streamlit run web_ui_app.py
```

Browser opens automatically at `http://localhost:8501`

**Steps:**
1. 📤 **Upload PDF** - Drag & drop or browse for your requirements file
2. ✏️ **Enter Project Name** - Type a descriptive name
3. ✅ **Select Options** - Check boxes for Test Plan and/or Test Cases
4. 🚀 **Click Generate** - Wait 30-60 seconds
5. 📥 **Download Files** - Click download buttons for Word/Excel files

**Features:**
- Real-time progress tracking
- Session persistence (downloads survive page refresh)
- Statistics display for test cases
- Error messages with helpful hints
- Mobile-friendly responsive design

### Method 2: Command Line Interface (CLI)

**Best for:** Automation, batch processing, scripting

#### Generate Test Plan Only

```bash
python3 generate_test_plan.py <pdf_file> [project_name]
```

**Example:**
```bash
python3 generate_test_plan.py requirements.pdf "Order Tracking System"
```

**Output:**
- `Order_Tracking_System_Test_Plan.docx` - Professional Word document
- `Order_Tracking_System_Test_Plan.json` - JSON for reference

#### Generate Test Cases Only

```bash
python3 generate_test_cases.py <pdf_file> [project_name]
```

**Example:**
```bash
python3 generate_test_cases.py specs.pdf "Mobile App Login"
```

**Output:**
- `Mobile_App_Login_Test_Cases.xlsx` - Excel with 40-60 test cases
- `Mobile_App_Login_Test_Cases.json` - JSON for automation

#### Generate Both (Recommended)

```bash
python3 generate_complete_qa_docs.py <pdf_file> [project_name]
```

**Example:**
```bash
python3 generate_complete_qa_docs.py requirements.pdf "WebView Integration"
```

**Output:** All 4 files (2 documents + 2 JSON files)

### Method 3: With Confluence Integration

#### One-Time Setup

```bash
python3 setup_confluence.py
```

Prompts you for:
- Confluence URL
- Email address
- API Token ([Generate here](https://id.atlassian.com/manage-profile/security/api-tokens))
- Space key
- Parent page ID (optional)

#### Generate and Upload

```bash
python3 generate_and_upload.py requirements.pdf "Project Name"
```

This will:
1. Generate test plan and/or test cases
2. Upload to Confluence automatically
3. Create formatted page with document attached
4. Provide Confluence page URL

---

## 📂 Project Structure

```
qa-docs-generator/
├── 📱 web_ui_app.py                 # Streamlit web interface (main UI)
├── 📄 generate_test_plan.py         # CLI - Test plan generator
├── 🧪 generate_test_cases.py        # CLI - Test cases generator
├── 🔄 generate_complete_qa_docs.py  # CLI - Combined generator
├── 🔗 confluence_upload.py          # Confluence API integration
├── ⚙️ setup_confluence.py           # Interactive Confluence setup
├── 🚀 generate_and_upload.py        # Generate + Upload workflow
├── 🔒 security_check.sh             # Security scanner script
├── 📋 requirements.txt              # Python dependencies
├── 🔑 env.example                   # Environment variables template
├── 🚫 .gitignore                    # Git ignore rules
├── 📖 README.md                     # This file
└── 📚 guides/                       # Additional documentation
    ├── WEB_UI_GUIDE.md              # Web UI detailed guide
    ├── CONFLUENCE_SETUP_GUIDE.md    # Confluence integration
    ├── TEST_CASES_GUIDE.md          # Test cases generation
    ├── COMMANDS_REFERENCE.md        # CLI commands reference
    └── GITHUB_SETUP.md              # Git setup and security
```

---

## 📋 Examples

### Example 1: E-commerce Checkout Feature

**Scenario:** Generate QA docs for new checkout flow

```bash
# Using Web UI
streamlit run web_ui_app.py
# Upload: checkout_requirements.pdf
# Project: "E-commerce Checkout v2.0"
# Select: Both (Test Plan + Test Cases)
# Generate & Download

# Using CLI
python3 generate_complete_qa_docs.py checkout_requirements.pdf "E-commerce Checkout v2.0"
```

**Output:**
- `E-commerce_Checkout_v2.0_Test_Plan.docx` (18 pages, 23 sections)
- `E-commerce_Checkout_v2.0_Test_Cases.xlsx` (52 test cases)
- JSON files for both

### Example 2: Mobile App Login Screen

```bash
python3 generate_test_plan.py mobile_login_specs.pdf "Mobile Login Flow"
```

**Output:**
```
============================================================
🚀 Automated Test Plan Generator using Claude API
============================================================
📄 Reading PDF: mobile_login_specs.pdf
   Total pages: 4
   Extracted page 1/4
   Extracted page 2/4
   Extracted page 3/4
   Extracted page 4/4
✅ Successfully extracted 8,245 characters

🤖 Calling Claude API to generate test plan...
✅ Received response from Claude
✅ Successfully parsed test plan JSON

📝 Creating Word document...
✅ Word document created: Mobile_Login_Flow_Test_Plan.docx
✅ JSON saved: Mobile_Login_Flow_Test_Plan.json

============================================================
✅ Test Plan Generation Complete!
📄 Word Document: Mobile_Login_Flow_Test_Plan.docx
📋 JSON File: Mobile_Login_Flow_Test_Plan.json
============================================================
```

### Example 3: Batch Processing Multiple Files

```bash
# Process all PDFs in a folder
for file in requirements/*.pdf; do
    python3 generate_complete_qa_docs.py "$file" "$(basename "$file" .pdf)"
    echo "Processed: $file"
done
```

### Example 4: Simple Usage (Default Project Name)

```bash
# Generates with auto-generated project name
python3 generate_test_plan.py requirements.pdf
# Output: Project_Test_Plan.docx
```

---

## 📊 Performance

### Generation Metrics

| Metric | Value |
|--------|-------|
| **PDF Reading** | 1-5 seconds |
| **Claude API Call** | 15-30 seconds |
| **Document Generation** | 2-5 seconds |
| **Total Time** | **30-60 seconds** |
| **Test Plan Length** | 15-20 pages |
| **Test Cases Count** | 40-60 cases |

### Cost Analysis

| Component | Cost |
|-----------|------|
| **Input Tokens** | ~3,000-5,000 tokens |
| **Output Tokens** | ~10,000-15,000 tokens |
| **Cost per Generation** | **$0.15-$0.35** |
| **Claude Sonnet 4 Rate** | ~$0.015 per 1K tokens |

### Time Savings

**Manual Process:**
- Test Plan: 2-3 hours
- Test Cases: 4-6 hours
- Formatting: 1 hour
- **Total:** 7-10 hours

**Automated Process:**
- Generation: 1 minute
- Review: 30 minutes
- **Total:** 30-40 minutes

**Time Saved: 90%+** ⚡

---

## 🔧 Customization

### Modify Generation Prompts

Edit the prompt in `generate_test_plan.py`:

```python
def generate_test_plan_with_claude(requirements_text, project_name):
    prompt = f"""You are a professional QA Test Plan writer.
    
    Based on these requirements, create a comprehensive test plan:
    
    {requirements_text}
    
    Project: {project_name}
    
    [Your custom instructions here...]
    """
```

### Change AI Model

At the top of the script:

```python
# Use Sonnet (faster, cheaper)
MODEL_NAME = "claude-sonnet-4-20250514"

# Or use Opus (more detailed, expensive)
MODEL_NAME = "claude-opus-4-20250514"
```

### Customize Document Formatting

In `create_word_document()` function:

```python
# Change font
paragraph.runs[0].font.name = 'Arial'
paragraph.runs[0].font.size = Pt(11)

# Change colors
cell.fill = PatternFill(start_color='FF0000', end_color='FF0000')

# Add custom styles
doc.styles['Normal'].font.name = 'Calibri'
```

---

## 🛠️ Troubleshooting

### Common Issues & Solutions

#### Issue 1: "ANTHROPIC_API_KEY not set"

**Problem:** Environment variable not configured

**Solution:**
```bash
# Check if set
echo $ANTHROPIC_API_KEY

# If empty, set it:
export ANTHROPIC_API_KEY='your-key-here'

# Or create .env file
cp env.example .env
nano .env  # Add your key
```

#### Issue 2: "ModuleNotFoundError"

**Problem:** Dependencies not installed

**Solution:**
```bash
# Install all dependencies
pip install -r requirements.txt

# Or install individually
pip install anthropic streamlit python-docx openpyxl PyPDF2
```

#### Issue 3: "Error reading PDF"

**Problem:** PDF file issues

**Solutions:**
- Check file exists: `ls -la requirements.pdf`
- Check file permissions: `chmod 644 requirements.pdf`
- Try different PDF (some PDFs have protection)
- Ensure PDF contains text (not scanned images)

#### Issue 4: "Error parsing JSON from Claude"

**Problem:** Claude response format issue

**Solution:**
```bash
# The script automatically cleans markdown formatting
# If error persists:
# 1. Check if API key is valid
# 2. Try with simpler PDF
# 3. Check API rate limits
```

#### Issue 5: Streamlit not opening browser

**Problem:** Browser doesn't launch automatically

**Solution:**
```bash
# Manually open
open http://localhost:8501

# Or specify port
streamlit run web_ui_app.py --server.port 8080

# Or use different browser
BROWSER=/path/to/browser streamlit run web_ui_app.py
```

#### Issue 6: "Permission denied: security_check.sh"

**Problem:** Script not executable

**Solution:**
```bash
chmod +x security_check.sh
./security_check.sh
```

#### Issue 7: Slow API response

**Problem:** Claude API taking too long

**Reasons:**
- Large PDF (many pages)
- Complex requirements
- API server load

**Solutions:**
- Split large PDFs into smaller documents
- Reduce max_tokens if needed
- Try during off-peak hours

---

## 🔒 Security

### 🚨 Security Best Practices

#### ✅ DO's

- ✅ Store API keys in environment variables
- ✅ Use `.env` file (excluded from Git)
- ✅ Run `security_check.sh` before commits
- ✅ Use `.gitignore` to exclude sensitive files
- ✅ Keep dependencies updated
- ✅ Review generated documents before sharing
- ✅ Use virtual environments
- ✅ Rotate API keys regularly

#### ❌ DON'Ts

- ❌ Never hardcode API keys in code
- ❌ Never commit `.env` file to Git
- ❌ Never share API keys in chat/email
- ❌ Never commit generated files with sensitive data
- ❌ Never use root/admin privileges unnecessarily
- ❌ Never skip security checks
- ❌ Never ignore security warnings

### Security Check Script

**Run before every Git push:**

```bash
./security_check.sh
```

**What it checks:**
- ✅ No API keys in tracked files
- ✅ `.gitignore` properly configured
- ✅ No sensitive files tracked
- ✅ No large files
- ✅ Environment variables properly used
- ✅ Git history clean

**Expected output:**
```
🔒 Security Check - Scanning for Exposed Secrets
==================================================

🔍 Check 1: Scanning for API keys...
✅ No API keys found in tracked files

🔍 Check 2: Checking .gitignore...
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
✅ ALL CHECKS PASSED!
Your repository is safe to push to GitHub! 🎉
==================================================
```

### Data Privacy

- **No data stored**: All processing happens in memory
- **Local files only**: Generated docs saved on your machine
- **Secure API**: HTTPS communication with Anthropic
- **Confluence optional**: Upload only if you configure it

---

## 💡 Tips & Best Practices

### 📝 For Best Results

1. **Clear Requirements**: Use well-structured PDFs with clear sections
2. **Reasonable Size**: Keep PDFs under 50 pages for best performance
3. **Text-based**: Ensure PDF contains actual text (not just images)
4. **Review Output**: Always review generated documentation
5. **Customize**: Adapt generated content to your organization's standards
6. **Version Control**: Save different versions with timestamps

### 🚀 Workflow Recommendations

**For Individual Projects:**
```bash
1. Receive requirements PDF
2. Run: streamlit run web_ui_app.py
3. Upload PDF and generate
4. Review output
5. Customize as needed
6. Share with team
```

**For Multiple Projects:**
```bash
1. Create folder structure
2. Place PDFs in input/ folder
3. Run batch processing script
4. Review all outputs
5. Organize by project
```

**For CI/CD Integration:**
```bash
1. Store requirements in repo
2. Add generation script to pipeline
3. Auto-generate on requirement changes
4. Store outputs as artifacts
5. Notify team
```

---

## 🤝 Contributing

Contributions are welcome! Here's how:

### Getting Started

```bash
# Fork the repository on GitHub
# Clone your fork
git clone https://github.com/YOUR-USERNAME/qa-docs-generator.git
cd qa-docs-generator

# Create feature branch
git checkout -b feature/amazing-feature

# Make your changes
# ...

# Run security check
./security_check.sh

# Commit changes
git commit -m "Add amazing feature"

# Push to your fork
git push origin feature/amazing-feature

# Open Pull Request on GitHub
```

### Contribution Guidelines

1. **Code Quality**: Follow PEP 8 style guidelines
2. **Documentation**: Update README if needed
3. **Testing**: Test your changes thoroughly
4. **Security**: Run security checks
5. **Commit Messages**: Use clear, descriptive messages

### Areas for Contribution

- 🐛 Bug fixes
- ✨ New features
- 📚 Documentation improvements
- 🎨 UI/UX enhancements
- 🌍 Translations
- ⚡ Performance improvements
- 🧪 Test coverage

---

## 📄 License

This project is licensed under the **MIT License**.

**What this means:**
- ✅ Use commercially
- ✅ Modify as needed
- ✅ Distribute freely
- ✅ Private use
- ❗ Provide attribution
- ❗ Include license in copies

See [LICENSE](LICENSE) file for full details.

---

## 🙏 Acknowledgments

Built with amazing open-source tools:

- **[Anthropic Claude AI](https://www.anthropic.com/)** - Powerful AI API
- **[Streamlit](https://streamlit.io/)** - Beautiful web framework
- **[python-docx](https://python-docx.readthedocs.io/)** - Word document generation
- **[OpenPyXL](https://openpyxl.readthedocs.io/)** - Excel file handling
- **[PyPDF2](https://pypdf2.readthedocs.io/)** - PDF processing

---

## 📞 Support & Contact

### Documentation

- **Complete Guides**: See `/guides` folder
- **Web UI Guide**: Detailed interface usage
- **CLI Reference**: All commands explained
- **Confluence Setup**: Integration guide
- **Security**: Best practices

### Get Help

- **Issues**: [GitHub Issues](https://github.com/Gulshair68/qa-docs-generator/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Gulshair68/qa-docs-generator/discussions)
- **Email**: For private inquiries

### Useful Links

- **Anthropic Docs**: https://docs.anthropic.com/
- **Streamlit Docs**: https://docs.streamlit.io/
- **Confluence API**: https://developer.atlassian.com/cloud/confluence/rest/

---

## 🗺️ Roadmap

### Planned Features

- [ ] **RAG System** - Company-specific template learning
- [ ] **Custom Templates** - User-defined document templates
- [ ] **Jira Integration** - Direct export to Jira
- [ ] **TestRail Integration** - Sync with TestRail
- [ ] **Batch UI** - Web interface for multiple files
- [ ] **Multi-language** - Support for Spanish, French, German
- [ ] **PDF Export** - Generate test plans as PDF
- [ ] **API Endpoint** - REST API for integration
- [ ] **Docker Support** - Containerized deployment
- [ ] **Chrome Extension** - Browser-based generation

### Version History

**v1.0.0** - Initial Release
- Test Plan generation
- Test Cases generation
- Web UI
- CLI tools
- Confluence integration

---

## 📈 Project Stats

![GitHub repo size](https://img.shields.io/github/repo-size/Gulshair68/qa-docs-generator)
![GitHub language count](https://img.shields.io/github/languages/count/Gulshair68/qa-docs-generator)
![GitHub top language](https://img.shields.io/github/languages/top/Gulshair68/qa-docs-generator)
![GitHub last commit](https://img.shields.io/github/last-commit/Gulshair68/qa-docs-generator)

---

## 🎓 Learn More

### Tutorials

- Getting started with Claude API
- Building Streamlit applications
- Document generation with Python
- Test automation best practices

### Resources

- [Anthropic Claude Documentation](https://docs.anthropic.com/)
- [Software Testing Help](https://www.softwaretestinghelp.com/)
- [ISTQB Test Plan Template](https://www.istqb.org/)

---

## ⭐ Star History

If you find this project useful, please consider giving it a star! ⭐

It helps others discover the project and motivates continued development.

---

**Made with ❤️ for QA Teams Worldwide**

*Automate the boring stuff, focus on quality testing!*

---

## 🔗 Quick Links

- [🏠 Home](https://github.com/Gulshair68/qa-docs-generator)
- [📖 Documentation](/guides)
- [🐛 Report Bug](https://github.com/Gulshair68/qa-docs-generator/issues)
- [💡 Request Feature](https://github.com/Gulshair68/qa-docs-generator/issues)
- [⭐ Star This Repo](https://github.com/Gulshair68/qa-docs-generator)

---

**[⬆ Back to Top](#-qa-documentation-generator)**
