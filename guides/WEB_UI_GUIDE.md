# 🎨 Web UI Guide - QA Documentation Generator

## Kya Hai Ye?

**Beautiful web interface** jo browser mein khulta hai aur aapko easy UI deta hai! 🚀

### Features:
- ✅ **File Upload** - PDF drag & drop
- ✅ **Interactive Options** - Checkboxes for Test Plan/Test Cases
- ✅ **Real-time Progress** - Generation dekhein live
- ✅ **Instant Download** - Files directly download karein
- ✅ **Statistics** - Test cases ki summary
- ✅ **Beautiful Design** - Professional UI

---

## 🚀 Quick Setup (Mac)

### Step 1: Install Streamlit

```bash
cd ~/Desktop/TestPlanGenerator
source venv/bin/activate
pip3 install streamlit
```

### Step 2: Run Web UI

```bash
streamlit run web_ui_app.py
```

**Browser automatically khulega!** 🌐

---

## 📖 Complete Setup Guide

### 1. Check API Key

```bash
echo $ANTHROPIC_API_KEY
```

Agar nahi hai to set karein:
```bash
export ANTHROPIC_API_KEY='sk-ant-api03-your-key-here'
```

### 2. Install Dependencies

```bash
# Navigate to folder
cd ~/Desktop/TestPlanGenerator

# Activate virtual environment
source venv/bin/activate

# Install Streamlit
pip3 install streamlit

# Verify
pip3 list | grep streamlit
```

### 3. Run Application

```bash
streamlit run web_ui_app.py
```

**Output:**
```
  You can now view your Streamlit app in your browser.

  Local URL: http://localhost:8501
  Network URL: http://192.168.1.x:8501
```

Browser automatically open hoga! 🎉

---

## 💻 Using the Web UI

### Step-by-Step:

1. **Upload PDF**
   - Click "Browse files" or drag & drop
   - PDF requirements document select karein

2. **Enter Project Name**
   - Text box mein project name type karein
   - Example: "Sprint 25", "Payment Gateway v2"

3. **Select What to Generate**
   - ✅ Check "Test Plan" (agar chahiye)
   - ✅ Check "Test Cases" (agar chahiye)
   - ✅ Both select kar sakte hain

4. **Click "Generate Documentation"**
   - Button click karein
   - Wait karein (~30-40 seconds)

5. **Download Files**
   - "Download Test Plan (Word)" button
   - "Download Test Cases (Excel)" button
   - JSON files bhi available

---

## 🎨 UI Features

### Main Screen:

```
┌─────────────────────────────────────────────────┐
│  🚀 QA Documentation Generator                  │
│  Automatically generate Test Plans and          │
│  Test Cases using AI                            │
├─────────────────────────────────────────────────┤
│                                                 │
│  📤 Upload Requirements      📝 Project Name    │
│  [Browse files...]           [My Project___]    │
│                                                 │
├─────────────────────────────────────────────────┤
│                                                 │
│  🎯 What would you like to generate?           │
│                                                 │
│  ☑️ Test Plan    ☑️ Test Cases                 │
│                                                 │
│  [🚀 Generate Documentation]                   │
│                                                 │
└─────────────────────────────────────────────────┘
```

### Sidebar:

```
┌──────────────────────┐
│ ⚙️ Configuration      │
│ ✅ API Key Configured│
├──────────────────────┤
│ 📚 About             │
│ - Test Plans         │
│ - Test Cases         │
│ - Powered by Claude  │
├──────────────────────┤
│ 💡 Tips              │
│ - Clear PDF          │
│ - Descriptive names  │
│ - Review docs        │
└──────────────────────┘
```

### Generation Progress:

```
📖 Processing Requirements
[████████████████] 100%
✅ Extracted 8,169 characters

📄 Generating Test Plan
🤖 Claude AI is generating...
✅ Test Plan generated successfully!
📥 Download Test Plan (Word)
📥 Download Test Plan (JSON)

🧪 Generating Test Cases
🤖 Claude AI is generating...
✅ Generated 48 test cases!

Statistics:
┌─────────────┬─────────────┬─────────────┐
│ Total: 48   │ P1: 32      │ Types: 7    │
└─────────────┴─────────────┴─────────────┘

📥 Download Test Cases (Excel)
📥 Download Test Cases (JSON)

🎉 Generation Complete!
```

---

## 🎯 Usage Examples

### Example 1: Both Docs

1. Upload: `webview_requirements.pdf`
2. Project: "WebView Integration"
3. Select: Both checkboxes
4. Click: Generate
5. Wait: 40 seconds
6. Download: Both files

### Example 2: Test Cases Only

1. Upload: `bug_fix.pdf`
2. Project: "Bug Fix 1234"
3. Select: Only Test Cases
4. Click: Generate
5. Wait: 20 seconds
6. Download: Excel file

### Example 3: Test Plan Only

1. Upload: `sprint_25.pdf`
2. Project: "Sprint 25"
3. Select: Only Test Plan
4. Click: Generate
5. Wait: 20 seconds
6. Download: Word file

---

## ⚙️ Configuration

### Port Change (Optional)

Default port: 8501

Change karein:
```bash
streamlit run web_ui_app.py --server.port 8080
```

### Theme (Optional)

Dark mode:
```bash
streamlit run web_ui_app.py --theme.base dark
```

### Auto-reload (Optional)

File changes auto-detect:
```bash
streamlit run web_ui_app.py --server.runOnSave true
```

---

## 🔧 Advanced Options

### Create Config File

`~/.streamlit/config.toml`:
```toml
[server]
port = 8501
headless = false

[browser]
gatherUsageStats = false

[theme]
primaryColor = "#1f77b4"
backgroundColor = "#ffffff"
secondaryBackgroundColor = "#f0f2f6"
textColor = "#262730"
font = "sans serif"
```

### Run in Background

```bash
# Start
nohup streamlit run web_ui_app.py &

# Stop
pkill -f streamlit
```

### Access from Other Devices

```bash
# Run with network access
streamlit run web_ui_app.py --server.address 0.0.0.0
```

Then access from: `http://your-mac-ip:8501`

---

## 💡 Pro Tips

### Tip 1: Create Desktop Shortcut

```bash
#!/bin/bash
# launch_qa_ui.sh

cd ~/Desktop/TestPlanGenerator
source venv/bin/activate
streamlit run web_ui_app.py
```

Make executable:
```bash
chmod +x launch_qa_ui.sh
```

Run:
```bash
./launch_qa_ui.sh
```

### Tip 2: Create Alias

```bash
echo 'alias qaweb="cd ~/Desktop/TestPlanGenerator && source venv/bin/activate && streamlit run web_ui_app.py"' >> ~/.zprofile
source ~/.zprofile
```

Use:
```bash
qaweb
```

### Tip 3: Add to Dock (Mac)

1. Create Automator Application
2. Run Shell Script: `./launch_qa_ui.sh`
3. Save as "QA Generator.app"
4. Drag to Dock

---

## 🆘 Troubleshooting

### Problem: "streamlit: command not found"

**Solution:**
```bash
pip3 install streamlit
```

### Problem: Port already in use

**Solution:**
```bash
# Use different port
streamlit run web_ui_app.py --server.port 8502

# Or kill existing process
lsof -ti:8501 | xargs kill -9
```

### Problem: Browser doesn't open

**Solution:**
```bash
# Manually open
open http://localhost:8501
```

### Problem: API key error

**Solution:**
```bash
# Set API key
export ANTHROPIC_API_KEY='your-key'

# Verify
echo $ANTHROPIC_API_KEY

# Restart Streamlit
```

### Problem: Upload fails

**Solution:**
- Check PDF file size (<10 MB recommended)
- Try different PDF
- Check file permissions

---

## 📊 Performance

### Generation Times:

| Document | Time |
|----------|------|
| Test Plan | 20-30 sec |
| Test Cases | 25-35 sec |
| Both | 45-60 sec |

### File Sizes:

| File Type | Size |
|-----------|------|
| Word (.docx) | 50-200 KB |
| Excel (.xlsx) | 40-150 KB |
| JSON | 10-80 KB |

---

## 🎨 Customization

### Change Colors

In `web_ui_app.py`, edit CSS:
```python
st.markdown("""
<style>
    .main-header {
        color: #your-color;  # Change this
    }
    .stButton>button {
        background-color: #your-color;  # Change this
    }
</style>
""", unsafe_allow_html=True)
```

### Add Logo

```python
st.image("logo.png", width=200)
```

### Change Title

```python
st.set_page_config(
    page_title="Your Title",  # Change this
    page_icon="🎯",          # Change this
)
```

---

## ✅ Benefits of Web UI

### Vs Command Line:

| Feature | Command Line | Web UI |
|---------|--------------|--------|
| **Ease of Use** | Medium | ⭐⭐⭐⭐⭐ |
| **Visual Feedback** | Text only | Progress bars, colors |
| **File Upload** | Manual path | Drag & drop |
| **Download** | File location | Direct download |
| **Options** | Type commands | Click checkboxes |
| **Errors** | Terminal text | Visual alerts |

### Best For:

✅ **Non-technical users**
✅ **Quick generation**
✅ **Visual progress tracking**
✅ **Team demonstrations**
✅ **Client presentations**

---

## 📁 File Structure

```
TestPlanGenerator/
├── web_ui_app.py              ← Web UI script ⭐
├── generate_test_plan.py      ← CLI version
├── generate_test_cases.py     ← CLI version
├── generate_complete_qa_docs.py
│
├── WEB_UI_GUIDE.md           ← This guide
├── COMMANDS_REFERENCE.md
└── ...
```

---

## 🎓 Quick Start Summary

```bash
# 1. Install
pip3 install streamlit

# 2. Run
streamlit run web_ui_app.py

# 3. Use
# - Upload PDF
# - Enter name
# - Select options
# - Generate
# - Download

# 4. Done! 🎉
```

---

## 🔄 Workflow Comparison

### Old Way (Command Line):
```bash
cd ~/Desktop/TestPlanGenerator
source venv/bin/activate
python3 generate_complete_qa_docs.py requirements.pdf "Project"
# Wait...
# Type choices...
# Find files...
# Open files...
```

### New Way (Web UI):
```bash
streamlit run web_ui_app.py
# Upload PDF (drag & drop)
# Click generate
# Click download
# Done!
```

**Time saved: 70%** ⚡

---

## 🎯 Use Cases

### Use Case 1: Team Demo
```
- Manager wants to see tool
- Open web UI
- Upload sample PDF
- Generate live
- Show results instantly
```

### Use Case 2: Client Meeting
```
- Client provides requirements
- Upload in meeting
- Generate test plan
- Download and send
```

### Use Case 3: Daily Use
```
- Morning standup
- Upload sprint docs
- Generate QA materials
- Share with team
```

---

## 💻 System Requirements

### Minimum:
- macOS 10.15+
- Python 3.8+
- 4 GB RAM
- Internet connection

### Recommended:
- macOS 12+
- Python 3.11+
- 8 GB RAM
- Fast internet

---

## 🎉 Summary

Ab aapke paas hai:

✅ **Beautiful Web UI** - Browser mein khulta hai
✅ **Easy Upload** - Drag & drop PDF
✅ **Interactive** - Checkboxes, buttons
✅ **Real-time Progress** - Live updates
✅ **Instant Download** - Files direct download
✅ **Professional Look** - Client-ready interface

### Quick Command:
```bash
streamlit run web_ui_app.py
```

**That's it! UI khul jayegi! 🚀**

---

## 📞 Support

### Check Setup:
```bash
# Streamlit installed?
pip3 list | grep streamlit

# API key set?
echo $ANTHROPIC_API_KEY

# File exists?
ls -la web_ui_app.py
```

### Test Run:
```bash
streamlit run web_ui_app.py
```

---

**Web UI is the easiest way! No command line typing needed! 🎨✨**
