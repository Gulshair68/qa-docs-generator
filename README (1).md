# 🚀 QA Documentation Generator

AI-powered automation tool for generating professional Test Plans and Test Cases using Claude AI.

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue)](https://www.python.org/)
[![Anthropic](https://img.shields.io/badge/Anthropic-Claude%20API-purple)](https://www.anthropic.com/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

---

## 📖 Overview

Automatically generate comprehensive QA documentation from requirement PDFs:
- **Test Plans** (Word format) - Complete 20+ section professional documents
- **Test Cases** (Excel format) - 40-60 detailed test cases with priority, type, and platform
- **Web UI** - Beautiful browser interface for easy generation
- **CLI Tools** - Command-line scripts for automation
- **Confluence Integration** - Auto-upload to Confluence (optional)

**Time Saved:** 90%+ (7-10 hours manual → 30-40 minutes automated)

---

## ✨ Features

### 🤖 AI-Powered Generation
- Uses Claude Sonnet 4 for intelligent content creation
- Understands requirements and generates relevant test scenarios
- Covers functional, integration, UI, performance, security testing

### 📄 Test Plan Generation
- 23 comprehensive sections
- Professional Word document output
- Includes: scope, strategy, requirements, risks, metrics
- Customizable templates

### 🧪 Test Cases Generation
- 40-60 detailed test cases per document
- Excel format with formatted columns
- Priority classification (P1/P2/P3)
- Multiple test types covered
- Statistics and analytics

### 🎨 Web UI (Streamlit)
- Beautiful browser interface
- Drag & drop PDF upload
- Real-time progress tracking
- Instant downloads
- Session persistence (no data loss on refresh)

### ⚡ Command Line Interface
- Batch processing support
- Automation-ready scripts
- Integration with CI/CD pipelines

### 🔗 Confluence Integration
- Auto-upload generated documents
- Creates formatted pages
- Attaches files automatically
- Configurable parent pages

---

## 🎯 Use Cases

- **QA Teams:** Accelerate test documentation
- **Project Managers:** Generate QA deliverables quickly
- **Developers:** Create test scenarios for features
- **Consultants:** Rapid client documentation
- **Automation:** Integrate into CI/CD workflows

---

## 🚀 Quick Start

### Prerequisites
- Python 3.8 or higher
- Anthropic Claude API key ([Get one here](https://console.anthropic.com/))
- macOS, Linux, or Windows

### Installation

```bash
# Clone repository
git clone https://github.com/yourusername/qa-docs-generator.git
cd qa-docs-generator

# Create virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip3 install -r requirements.txt

# Configure environment variables
cp .env.example .env
# Edit .env and add your ANTHROPIC_API_KEY
```

### Usage

#### Web UI (Recommended)
```bash
streamlit run web_ui_app.py
# Browser opens at http://localhost:8501
```

#### Command Line
```bash
# Generate test plan only
python3 generate_test_plan.py requirements.pdf "Project Name"

# Generate test cases only
python3 generate_test_cases.py requirements.pdf "Project Name"

# Generate both
python3 generate_complete_qa_docs.py requirements.pdf "Project Name"
```

---

## 📋 Configuration

### Required Environment Variables

```bash
# Anthropic Claude API
ANTHROPIC_API_KEY=your_api_key_here
```

### Optional - Confluence Integration

```bash
CONFLUENCE_URL=https://yourcompany.atlassian.net
CONFLUENCE_EMAIL=your.email@company.com
CONFLUENCE_API_TOKEN=your_confluence_api_token
CONFLUENCE_SPACE_KEY=QA
CONFLUENCE_PARENT_PAGE_ID=123456789  # Optional
```

See `.env.example` for full configuration template.

---

## 📂 Project Structure

```
qa-docs-generator/
├── web_ui_app.py                    # Streamlit web interface
├── generate_test_plan.py            # CLI - Test plan generator
├── generate_test_cases.py           # CLI - Test cases generator
├── generate_complete_qa_docs.py     # CLI - Both generators
├── confluence_upload.py             # Confluence integration
├── setup_confluence.py              # Confluence setup wizard
├── generate_and_upload.py           # Generate + Upload workflow
├── requirements.txt                 # Python dependencies
├── .env.example                     # Environment variables template
├── .gitignore                       # Git ignore rules
├── README.md                        # This file
└── guides/                          # Documentation
    ├── WEB_UI_GUIDE.md
    ├── CONFLUENCE_SETUP_GUIDE.md
    ├── TEST_CASES_GUIDE.md
    └── COMMANDS_REFERENCE.md
```

---

## 🎨 Screenshots

### Web UI
```
[Upload PDF] → [Select Options] → [Generate] → [Download Files]
```

### Generated Output
- **Test Plan**: 15-20 page Word document with 23 sections
- **Test Cases**: Excel file with 40-60 formatted test cases
- **JSON**: Machine-readable format for automation

---

## 📊 Performance

| Metric | Value |
|--------|-------|
| **Generation Time** | 30-60 seconds |
| **Test Plan Size** | 15-20 pages |
| **Test Cases Count** | 40-60 cases |
| **API Cost** | $0.15-$0.35 per generation |
| **Time Saved** | 90%+ vs manual |

---

## 🔧 Development

### Running Tests
```bash
# Run security check
bash security_check.sh

# Test API connection
python3 test_claude_response.py
```

### Adding New Features
1. Create feature branch
2. Make changes
3. Test locally
4. Run security check
5. Submit pull request

---

## 🔒 Security

### Important Security Notes
- **Never commit** `.env` file to Git
- **Never hardcode** API keys in code
- Use environment variables for all secrets
- Run `security_check.sh` before pushing

### API Keys
- Stored in environment variables (not in code)
- Added to `.gitignore`
- Use `.env.example` as template

### Data Privacy
- No data stored permanently
- PDFs processed in memory
- Generated files saved locally only
- Confluence uploads use secure API

---

## 📝 License

MIT License - See [LICENSE](LICENSE) file for details

---

## 🤝 Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create feature branch
3. Make changes with tests
4. Run security checks
5. Submit pull request

---

## 📞 Support

- **Documentation**: See `/guides` folder
- **Issues**: [GitHub Issues](https://github.com/yourusername/qa-docs-generator/issues)
- **Email**: your.email@example.com

---

## 🎓 Resources

- [Anthropic Claude API Docs](https://docs.anthropic.com/)
- [Streamlit Documentation](https://docs.streamlit.io/)
- [Confluence API Guide](https://developer.atlassian.com/cloud/confluence/rest/)

---

## ⚠️ Important Notes

### Before Using
1. Set up API key properly
2. Review generated output
3. Customize as needed
4. Don't share API keys

### Limitations
- Requires internet connection
- API costs apply per generation
- Quality depends on input PDF clarity
- Not a replacement for human review

---

## 🎉 Acknowledgments

- Built with [Anthropic Claude API](https://www.anthropic.com/)
- UI powered by [Streamlit](https://streamlit.io/)
- Document generation using python-docx and openpyxl

---

## 📈 Roadmap

- [ ] RAG system for company-specific templates
- [ ] Custom template support
- [ ] Batch processing UI
- [ ] Integration with Jira/TestRail
- [ ] Multi-language support
- [ ] PDF export for test plans

---

**Made with ❤️ for QA Teams**

*Automate the boring stuff, focus on quality!*
