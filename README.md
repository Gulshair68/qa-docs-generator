# 🚀 Automated Test Plan Generator using Claude API

Yeh tool automatically requirement PDF se comprehensive QA Test Plan generate karta hai Claude AI ka use karke.

## ✨ Features

- ✅ **PDF se Requirements Extract**: Automatically PDF se text nikalta hai
- ✅ **Claude AI Integration**: Latest Claude Sonnet 4 model ka use karta hai
- ✅ **Professional Test Plan**: Complete test plan with 15+ sections
- ✅ **Word Document Generation**: Professional formatting ke saath DOCX file
- ✅ **JSON Output**: Reference ke liye structured JSON
- ✅ **Comprehensive Coverage**: Functional, Non-functional, Risks, Dependencies, etc.

## 📋 Generated Test Plan Sections

Yeh tool neeche diye gaye sections ke saath complete test plan generate karta hai:

1. **Project Information** - Name, version, team members
2. **Description & Introduction** - Project overview
3. **Goal** - Testing objectives
4. **Test Strategy** - Testing types (Functional, Integration, Performance, etc.)
5. **Test Scope** - In-scope aur Out-of-scope items
6. **Functional Requirements** - Detailed requirements with acceptance criteria
7. **Non-Functional Requirements** - Performance, Security, etc.
8. **Impact Zones** - Red, Yellow, Green zones
9. **Entry & Exit Criteria** - Testing start aur completion criteria
10. **Test Data Requirements** - Required test data
11. **Test Environment** - Dev, Pre-Prod, Production
12. **Testing Activities** - Timeline aur activities
13. **Roles & Responsibilities** - Team members aur unke responsibilities
14. **Risks** - Potential risks
15. **Assumptions & Dependencies** - Project assumptions aur dependencies
16. **Defect Management** - Priority levels aur process
17. **Test Metrics & KPIs** - Success metrics
18. **Deliverables** - Expected outputs
19. **Limitations & Exclusions** - Scope limitations
20. **Approval Section** - Sign-off table

## 🛠️ Installation

### Step 1: Python Install karein (if not installed)
```bash
# Check if Python is installed
python3 --version

# If not installed, install Python 3.8+
# On macOS
brew install python3

# On Ubuntu/Debian
sudo apt-get install python3 python3-pip

# On Windows
# Download from python.org
```

### Step 2: Virtual Environment banayein (Recommended)
```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
# On macOS/Linux:
source venv/bin/activate

# On Windows:
venv\Scripts\activate
```

### Step 3: Dependencies install karein
```bash
pip install -r requirements.txt
```

## 🔑 Claude API Key Setup

### Step 1: API Key obtain karein
1. https://console.anthropic.com/ par jayein
2. Account banayein ya login karein
3. API Keys section mein jayein
4. New API Key create karein
5. Key ko copy karein

### Step 2: Environment Variable set karein

**macOS/Linux:**
```bash
# Temporary (current session ke liye)
export ANTHROPIC_API_KEY='your-api-key-here'

# Permanent (add to ~/.bashrc or ~/.zshrc)
echo 'export ANTHROPIC_API_KEY="your-api-key-here"' >> ~/.bashrc
source ~/.bashrc
```

**Windows (Command Prompt):**
```cmd
setx ANTHROPIC_API_KEY "your-api-key-here"
```

**Windows (PowerShell):**
```powershell
$env:ANTHROPIC_API_KEY="your-api-key-here"

# Permanent
[Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", "your-api-key-here", "User")
```

## 📖 Usage

### Basic Usage
```bash
python generate_test_plan.py <requirements_pdf_path> [project_name]
```

### Examples

**Example 1: Simple usage**
```bash
python generate_test_plan.py requirements.pdf
```
Output: `Project_Test_Plan.docx` aur `Project_Test_Plan.json`

**Example 2: Custom project name**
```bash
python generate_test_plan.py requirements.pdf "Order Tracking Updates"
```
Output: `Order_Tracking_Updates_Test_Plan.docx` aur `Order_Tracking_Updates_Test_Plan.json`

**Example 3: Full path**
```bash
python generate_test_plan.py /path/to/requirements.pdf "WebView Integration"
```

## 📂 File Structure

After running, aap ke paas yeh files hongi:
```
project-folder/
├── generate_test_plan.py          # Main script
├── requirements.txt                # Dependencies
├── README.md                       # This file
├── <ProjectName>_Test_Plan.docx   # Generated Word document
└── <ProjectName>_Test_Plan.json   # Generated JSON (for reference)
```

## 🎯 Output Format

### Word Document (.docx)
- Professional formatting
- Proper headings and sections
- Tables for structured data
- Bullet points for lists
- Ready to share with team

### JSON File (.json)
- Structured data
- Easy to parse
- Can be used for automation
- Reference for modifications

## 🔧 Customization

### Modify the Prompt
Script mein `generate_test_plan_with_claude()` function mein prompt ko customize kar sakte hain:

```python
prompt = f"""Your custom prompt here...
{requirements_text}
...
"""
```

### Change Model
Script ke top par model change kar sakte hain:
```python
MODEL_NAME = "claude-sonnet-4-20250514"  # Latest Sonnet
# or
MODEL_NAME = "claude-opus-4-20250514"    # For more detailed analysis
```

### Adjust Document Formatting
`create_word_document()` function mein formatting customize kar sakte hain:
- Font size
- Colors
- Table styles
- Section headings

## ⚡ Performance

- **PDF Reading**: 1-5 seconds (PDF size par depend karta hai)
- **Claude API Call**: 10-30 seconds (complexity par depend karta hai)
- **Document Generation**: 2-5 seconds
- **Total Time**: Usually 15-40 seconds

## 💡 Tips & Best Practices

1. **Clear Requirements**: PDF mein clear aur structured requirements ho
2. **API Key Security**: Never commit API key to version control
3. **Error Handling**: Agar error aaye to output check karein
4. **Review Output**: Generated test plan ko review zaroor karein
5. **Customize**: Apne organization ke standards ke mutabiq customize karein

## 🐛 Troubleshooting

### Problem: "ANTHROPIC_API_KEY not set"
**Solution**: Environment variable properly set karein (see Setup section)

### Problem: "Error reading PDF"
**Solution**: 
- Check if PDF file exists
- Check file permissions
- Try with different PDF

### Problem: "Error parsing JSON"
**Solution**:
- Claude ka response kabhi kabhi markdown format mein aata hai
- Script automatically clean karta hai, but agar error aaye to JSON manually check karein

### Problem: "Module not found"
**Solution**:
```bash
pip install -r requirements.txt --upgrade
```

## 🔒 Security Notes

- ⚠️ API Key ko secure rakhein
- ⚠️ API Key ko code mein hardcode na karein
- ⚠️ API Key ko git repository mein commit na karein
- ✅ Environment variables use karein
- ✅ .env files ko .gitignore mein add karein

## 📝 Example Output

Running the script:
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
✅ Received response from Claude
✅ Successfully parsed test plan JSON

📝 Creating Word document...
✅ Word document created: Order_Tracking_Updates_Test_Plan.docx
✅ JSON saved: Order_Tracking_Updates_Test_Plan.json

============================================================
✅ Test Plan Generation Complete!
📄 Word Document: Order_Tracking_Updates_Test_Plan.docx
📋 JSON File: Order_Tracking_Updates_Test_Plan.json
============================================================
```

## 🤝 Support

Issues ya questions ke liye:
1. README carefully padhein
2. Error messages check karein
3. Logs check karein
4. Requirements properly install hain ya nahi verify karein

## 📄 License

This tool is provided as-is for internal use.

## 🙏 Credits

- Claude AI by Anthropic
- Python-docx library
- PyPDF2 library

---

**Happy Testing! 🎉**
