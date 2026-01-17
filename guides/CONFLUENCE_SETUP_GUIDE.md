# 🔗 Confluence Setup Guide - QA Documentation Generator

Complete guide for integrating with Atlassian Confluence.

---

## 📖 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting API Token](#getting-api-token)
- [Setup Process](#setup-process)
- [Configuration](#configuration)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Best Practices](#best-practices)

---

## 🌟 Overview

Confluence integration allows you to:
- ✅ Auto-upload test plans and test cases
- ✅ Create formatted Confluence pages
- ✅ Attach Word/Excel files
- ✅ Organize documentation in spaces
- ✅ Share with team instantly
- ✅ Maintain version history

**Perfect for:** Team collaboration, centralized documentation, enterprise environments

---

## 📋 Prerequisites

### What You Need

1. **Confluence Account**
   - Atlassian Cloud account
   - Access to a Confluence workspace
   - Permission to create pages

2. **Confluence Details**
   - Workspace URL (e.g., `https://mycompany.atlassian.net`)
   - Email address (your Atlassian account email)
   - Space key (where you'll create pages)

3. **Permissions Required**
   - Create pages in space
   - Upload attachments
   - Edit pages (for updates)

### Check Your Access

1. **Login to Confluence**
   ```
   Visit: https://yourcompany.atlassian.net/wiki
   Login with your credentials
   ```

2. **Verify Space Access**
   - Navigate to your space (e.g., QA space)
   - Try creating a test page
   - If successful, you have required permissions

3. **Note Down Details**
   ```
   URL: https://[YOUR_COMPANY].atlassian.net
   Email: your.email@company.com
   Space Key: QA (or DEV, PROJ, etc.)
   ```

---

## 🔑 Getting API Token

### Why API Token?

- **Security**: More secure than using passwords
- **Scope**: Limited to Confluence operations
- **Revocable**: Can be revoked anytime
- **Multiple**: Can create multiple tokens

### Step-by-Step Token Creation

#### Step 1: Go to Atlassian Account Settings

```
1. Visit: https://id.atlassian.com/manage-profile/security/api-tokens
2. Log in with your Atlassian account
3. You'll see "API tokens" page
```

#### Step 2: Create New Token

```
1. Click "Create API token" button
2. Enter a label (e.g., "QA Docs Generator")
3. Click "Create"
4. Token is generated and displayed
```

**Important:** 
- ⚠️ **Copy token immediately** - it won't be shown again
- ⚠️ **Store securely** - treat like a password
- ⚠️ **Don't share** - keep it private

#### Step 3: Copy and Save Token

```
Token looks like:
ATATT3xFfGF0abcdefghijklmnopqrstuvwxyz1234567890

Save it securely:
- Password manager (recommended)
- Encrypted file
- Secure notes app
```

### Token Management

**View Existing Tokens:**
```
https://id.atlassian.com/manage-profile/security/api-tokens
```

**Revoke Token:**
```
1. Go to API tokens page
2. Find the token
3. Click "Revoke"
4. Confirm revocation
```

**Create Multiple Tokens:**
```
You can create tokens for:
- Development environment
- Production environment
- Different applications
- Team members
```

---

## ⚙️ Setup Process

### Method 1: Interactive Setup (Recommended)

#### Run Setup Script

```bash
cd ~/Desktop/TestPlanGenerator
python3 setup_confluence.py
```

#### Interactive Prompts

**Prompt 1: Confluence URL**
```
🔗 Confluence Integration Setup
================================

Enter your Confluence URL (e.g., https://company.atlassian.net):
>
```

**What to enter:**
```
https://yourcompany.atlassian.net

Notes:
- Include https://
- Don't include /wiki or other paths
- Just base URL
```

**Prompt 2: Email**
```
Enter your Confluence email:
>
```

**What to enter:**
```
your.email@company.com

Notes:
- Your Atlassian account email
- Same email used for Confluence login
```

**Prompt 3: API Token**
```
Enter your Confluence API token:
(Generate at: https://id.atlassian.com/manage-profile/security/api-tokens)
>
```

**What to enter:**
```
Paste your API token (from previous step)

Notes:
- Token is hidden as you type (security)
- Paste entire token
- No quotes needed
```

**Prompt 4: Space Key**
```
Enter your Confluence Space Key (e.g., QA, DEV):
>
```

**What to enter:**
```
QA  (or your space key)

Notes:
- Usually 2-4 letters uppercase
- Found in space URL: /wiki/spaces/QA/
- Case sensitive
```

**Prompt 5: Parent Page ID (Optional)**
```
Enter Parent Page ID (optional, press Enter to skip):
>
```

**What to enter:**
```
Option A: Leave blank (press Enter) - Creates pages at space root
Option B: Enter page ID - Creates pages under specific parent

How to find Page ID:
1. Go to parent page in Confluence
2. Look at URL: /wiki/spaces/QA/pages/123456789/Page+Name
3. Page ID is: 123456789
```

#### Verification

```
✅ Testing Confluence connection...
   Connecting to: https://yourcompany.atlassian.net
   Authenticating: your.email@company.com
   Checking space access: QA
   
✅ Connection successful!
✅ Configuration saved!

Configuration saved to:
- ~/.zprofile (macOS/Linux)
- Environment variables (Windows)

You can now use:
  python3 generate_and_upload.py requirements.pdf "Project Name"
```

---

### Method 2: Manual Configuration

#### Edit .env File

```bash
# Open or create .env file
nano .env

# Add these lines:
CONFLUENCE_URL=https://yourcompany.atlassian.net
CONFLUENCE_EMAIL=your.email@company.com
CONFLUENCE_API_TOKEN=your-api-token-here
CONFLUENCE_SPACE_KEY=QA
CONFLUENCE_PARENT_PAGE_ID=123456789  # Optional
```

#### Save and Verify

```bash
# Check if variables are set
echo $CONFLUENCE_URL
echo $CONFLUENCE_EMAIL
# Don't echo API token (security)

# Or use script
python3 -c "import os; print('✅ Configured' if os.getenv('CONFLUENCE_URL') else '❌ Not configured')"
```

---

### Method 3: Environment Variables

**macOS/Linux:**

```bash
# Add to ~/.zprofile or ~/.bashrc
export CONFLUENCE_URL='https://yourcompany.atlassian.net'
export CONFLUENCE_EMAIL='your.email@company.com'
export CONFLUENCE_API_TOKEN='your-api-token'
export CONFLUENCE_SPACE_KEY='QA'
export CONFLUENCE_PARENT_PAGE_ID='123456789'  # Optional

# Reload shell
source ~/.zprofile
```

**Windows (PowerShell):**

```powershell
[Environment]::SetEnvironmentVariable("CONFLUENCE_URL", "https://yourcompany.atlassian.net", "User")
[Environment]::SetEnvironmentVariable("CONFLUENCE_EMAIL", "your.email@company.com", "User")
[Environment]::SetEnvironmentVariable("CONFLUENCE_API_TOKEN", "your-token", "User")
[Environment]::SetEnvironmentVariable("CONFLUENCE_SPACE_KEY", "QA", "User")
```

---

## 🚀 Usage

### Basic Upload

```bash
python3 generate_and_upload.py requirements.pdf "Project Name"
```

**What happens:**
1. ✅ Generates test plan
2. ✅ Generates test cases
3. ✅ Creates Confluence page
4. ✅ Uploads Word document
5. ✅ Uploads Excel spreadsheet
6. ✅ Formats page content
7. ✅ Provides page URL

**Example output:**
```
============================================================
📤 Generating and Uploading to Confluence
============================================================

📄 Generating test plan...
   Reading PDF...
   Calling Claude API...
   Creating document...
   ✅ Test plan generated

🧪 Generating test cases...
   Analyzing requirements...
   Creating test cases...
   Formatting Excel...
   ✅ Test cases generated (52 cases)

🔗 Uploading to Confluence...
   Creating page: "Project Name - Test Documentation"
   Space: QA
   Parent: Product Documentation
   
   Uploading attachments...
   ✅ Test Plan uploaded: Project_Name_Test_Plan.docx
   ✅ Test Cases uploaded: Project_Name_Test_Cases.xlsx
   
   Formatting page...
   ✅ Page formatted with content

============================================================
✅ Upload Complete!

🔗 Confluence page URL:
   https://yourcompany.atlassian.net/wiki/spaces/QA/pages/123456789

📄 Attachments:
   - Project_Name_Test_Plan.docx
   - Project_Name_Test_Cases.xlsx

============================================================
```

### Upload Existing Files

If you already have generated files:

```bash
python3 confluence_upload.py <file_path> <space_key> [page_title]
```

**Example:**
```bash
python3 confluence_upload.py My_Test_Plan.docx QA "Sprint 25 Test Plan"
```

### Update Existing Page

To update an existing page:

```bash
# Find page ID from URL
# Edit confluence_upload.py to include page_id parameter
# Or use Confluence API directly
```

---

## 📄 Page Structure

### Default Page Layout

```
┌─────────────────────────────────────────────┐
│ Project Name - Test Documentation           │
│ ──────────────────────────────────────────  │
│                                             │
│ 📋 Overview                                 │
│ This page contains comprehensive QA         │
│ documentation for [Project Name].           │
│                                             │
│ ──────────────────────────────────────────  │
│                                             │
│ 📄 Test Plan                                │
│ Download: Project_Name_Test_Plan.docx       │
│                                             │
│ The test plan includes:                     │
│ • Test Strategy                             │
│ • Test Scope                                │
│ • Requirements                              │
│ • Risk Analysis                             │
│ • [23 sections total]                       │
│                                             │
│ ──────────────────────────────────────────  │
│                                             │
│ 🧪 Test Cases                               │
│ Download: Project_Name_Test_Cases.xlsx      │
│                                             │
│ Statistics:                                 │
│ • Total: 52 test cases                      │
│ • P1: 18 cases (34.6%)                      │
│ • P2: 22 cases (42.3%)                      │
│ • P3: 12 cases (23.1%)                      │
│                                             │
│ Test Coverage:                              │
│ • Functional: 15 cases                      │
│ • Integration: 10 cases                     │
│ • UI/UX: 8 cases                            │
│ • Performance: 7 cases                      │
│ • Security: 6 cases                         │
│ • Others: 6 cases                           │
│                                             │
│ ──────────────────────────────────────────  │
│                                             │
│ ℹ️ Metadata                                 │
│ • Generated: 2026-01-17                     │
│ • Generator: QA Docs Generator v1.0         │
│ • Author: your.email@company.com            │
│                                             │
└─────────────────────────────────────────────┘
```

### Customizing Page Content

Edit `generate_and_upload.py` to customize:

```python
# Add custom sections
page_content += """
<h2>Custom Section</h2>
<p>Your custom content here</p>
"""

# Add custom macros
page_content += """
<ac:structured-macro ac:name="info">
  <ac:rich-text-body>
    <p>Important information</p>
  </ac:rich-text-body>
</ac:structured-macro>
"""
```

---

## 🛠️ Troubleshooting

### Issue 1: Authentication Failed

**Error:**
```
❌ Error: Authentication failed
401 Unauthorized
```

**Solutions:**

**Check 1: Verify credentials**
```bash
echo $CONFLUENCE_EMAIL
# Should show your email

# Verify token (don't echo, just check it's set)
python3 -c "import os; print('✅' if os.getenv('CONFLUENCE_API_TOKEN') else '❌')"
```

**Check 2: Regenerate token**
```
1. Go to API tokens page
2. Revoke old token
3. Create new token
4. Update configuration
5. Try again
```

**Check 3: Check account status**
```
- Login to Confluence manually
- Verify account is active
- Check if 2FA is required
```

---

### Issue 2: Space Not Found

**Error:**
```
❌ Error: Space 'QA' not found
404 Not Found
```

**Solutions:**

**Check 1: Verify space key**
```
1. Go to Confluence
2. Navigate to space
3. Check URL: /wiki/spaces/[SPACE_KEY]/
4. Space key is case-sensitive
```

**Check 2: Check permissions**
```
- Verify you have access to space
- Ask space admin for permissions
- Try different space
```

---

### Issue 3: Cannot Create Page

**Error:**
```
❌ Error: Insufficient permissions to create page
403 Forbidden
```

**Solutions:**

**Request permissions:**
```
Contact space administrator to grant:
- Create pages permission
- Upload attachments permission
- Edit pages permission (for updates)
```

**Check parent page:**
```
If using parent page ID:
- Verify page exists
- Check you have permission to add children
- Try without parent page
```

---

### Issue 4: Connection Timeout

**Error:**
```
❌ Error: Connection timeout
Connection timed out after 30 seconds
```

**Solutions:**

**Check 1: Network connection**
```bash
# Test connection
ping atlassian.net

# Test HTTPS
curl -I https://yourcompany.atlassian.net
```

**Check 2: Firewall/VPN**
```
- Check firewall settings
- Try without VPN
- Check proxy settings
```

**Check 3: Increase timeout**
```python
# Edit confluence_upload.py
requests.post(url, timeout=60)  # Increase from 30 to 60
```

---

### Issue 5: File Upload Failed

**Error:**
```
❌ Error: Failed to upload attachment
File size exceeds limit
```

**Solutions:**

**Check file size:**
```bash
ls -lh Project_Test_Plan.docx
# Confluence limit: usually 100MB
```

**Compress if needed:**
```bash
# For images in Word doc
# Open in Word, compress images
# Save as reduced file size
```

---

### Issue 6: Invalid URL Format

**Error:**
```
❌ Error: Invalid URL format
```

**Solutions:**

**Correct format:**
```
✅ Correct: https://mycompany.atlassian.net
❌ Wrong: http://mycompany.atlassian.net (missing 's')
❌ Wrong: https://mycompany.atlassian.net/wiki (extra path)
❌ Wrong: mycompany.atlassian.net (missing https://)
```

---

## 💡 Best Practices

### Organization

**Space Structure:**
```
QA Space
├── Test Plans
│   ├── 2026 Q1
│   │   ├── Project A Test Plan
│   │   └── Project B Test Plan
│   └── 2026 Q2
└── Test Cases
    ├── Mobile App
    └── Web App
```

**Page Naming:**
```
✅ Good:
- "Project Name - Test Plan - v1.0"
- "Sprint 25 - Test Documentation"
- "Feature X - Test Cases"

❌ Avoid:
- "Test Plan" (too generic)
- "asdf test" (unclear)
- "Final Final v2 REAL" (messy)
```

### Version Control

**Track versions:**
```
Version 1.0 - Initial release
Version 1.1 - Updated requirements
Version 2.0 - Major revision
```

**Use labels:**
```
- current
- archived
- in-progress
- approved
```

### Team Collaboration

**Permissions:**
```
- Read: All team members
- Edit: QA team
- Admin: QA lead
```

**Notifications:**
```
- Watch page for updates
- Set up email alerts
- Use @mentions for reviews
```

### Automation

**CI/CD Integration:**
```yaml
# Add to pipeline
- name: Upload to Confluence
  run: |
    python3 generate_and_upload.py \
      requirements.pdf \
      "Auto-Generated - ${BUILD_NUMBER}"
```

---

## 📊 Usage Examples

### Example 1: Sprint Documentation

```bash
# Start of sprint
python3 generate_and_upload.py sprint_25_req.pdf "Sprint 25 - E-commerce Checkout"

# Result: Page in "Sprint 25" section with all docs
```

### Example 2: Feature Documentation

```bash
# For each feature
python3 generate_and_upload.py login_feature.pdf "Login Feature - Test Suite"
python3 generate_and_upload.py search_feature.pdf "Search Feature - Test Suite"
python3 generate_and_upload.py cart_feature.pdf "Shopping Cart - Test Suite"
```

### Example 3: Release Documentation

```bash
# Release testing
python3 generate_and_upload.py v2.0_requirements.pdf "Version 2.0 - Complete Test Suite"

# Result: Comprehensive page with all test documentation
```

---

## 🔐 Security

### Best Practices

**API Token:**
- ✅ Store in environment variables
- ✅ Never commit to version control
- ✅ Rotate tokens regularly (every 90 days)
- ✅ Use different tokens for dev/prod
- ❌ Don't share tokens
- ❌ Don't include in emails

**Configuration:**
```bash
# .gitignore should include:
.env
*_credentials*
*_token*
```

**Access Control:**
```
- Review space permissions regularly
- Remove unused API tokens
- Use minimum required permissions
- Monitor page access logs
```

---

## 📞 Support

### Resources

- **Atlassian Confluence Help**: https://support.atlassian.com/confluence-cloud/
- **API Documentation**: https://developer.atlassian.com/cloud/confluence/rest/
- **Community Forum**: https://community.atlassian.com/

### Getting Help

1. Check this guide
2. Review error messages
3. Test with Confluence web UI
4. Check Atlassian status page
5. Contact space administrator

---

**Made with ❤️ for Team Collaboration**

*Document once, share everywhere!*

---

**[⬆ Back to Top](#-confluence-setup-guide---qa-documentation-generator)**
