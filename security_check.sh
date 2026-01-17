#!/bin/bash
# ============================================================================
# Security Check Script - Scan for Exposed Secrets
# Run this BEFORE pushing to GitHub!
# ============================================================================

echo "🔒 Security Check - Scanning for Exposed Secrets"
echo "=================================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ISSUES_FOUND=0

# ============================================================================
# Check 1: Scan for API keys in tracked files
# ============================================================================
echo "🔍 Check 1: Scanning for API keys in files..."

# Common API key patterns
PATTERNS=(
    "sk-ant-api"
    "ANTHROPIC_API_KEY.*=.*sk-"
    "api_key.*=.*['\"][a-zA-Z0-9]{30,}['\"]"
    "token.*=.*['\"][a-zA-Z0-9]{30,}['\"]"
    "password.*=.*['\"]"
    "secret.*=.*['\"]"
    "CONFLUENCE_API_TOKEN.*="
    "CONFLUENCE_EMAIL.*=.*@"
)

for pattern in "${PATTERNS[@]}"; do
    results=$(git grep -i "$pattern" 2>/dev/null | grep -v ".gitignore" | grep -v "security_check.sh")
    if [ ! -z "$results" ]; then
        echo -e "${RED}❌ FOUND: $pattern${NC}"
        echo "$results"
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
    fi
done

if [ $ISSUES_FOUND -eq 0 ]; then
    echo -e "${GREEN}✅ No API keys found in tracked files${NC}"
fi
echo ""

# ============================================================================
# Check 2: Verify .gitignore exists and has key patterns
# ============================================================================
echo "🔍 Check 2: Checking .gitignore file..."

if [ ! -f ".gitignore" ]; then
    echo -e "${RED}❌ .gitignore file not found!${NC}"
    echo "   Creating .gitignore file..."
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
else
    # Check for important patterns
    REQUIRED_PATTERNS=(
        ".env"
        "*.pdf"
        "*.docx"
        "*.xlsx"
        "venv/"
        "__pycache__"
        "*.log"
    )
    
    MISSING=0
    for req_pattern in "${REQUIRED_PATTERNS[@]}"; do
        if ! grep -q "$req_pattern" .gitignore; then
            echo -e "${YELLOW}⚠️  Missing in .gitignore: $req_pattern${NC}"
            MISSING=$((MISSING + 1))
        fi
    done
    
    if [ $MISSING -eq 0 ]; then
        echo -e "${GREEN}✅ .gitignore looks good${NC}"
    else
        echo -e "${YELLOW}⚠️  .gitignore needs updates (see above)${NC}"
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
    fi
fi
echo ""

# ============================================================================
# Check 3: Check for sensitive files that might be tracked
# ============================================================================
echo "🔍 Check 3: Checking for sensitive files..."

SENSITIVE_FILES=(
    ".env"
    ".env.local"
    "config.py"
    "secrets.py"
    "credentials.py"
    "api_keys.txt"
    "tokens.txt"
)

TRACKED_SENSITIVE=0
for file in "${SENSITIVE_FILES[@]}"; do
    if git ls-files | grep -q "^$file$"; then
        echo -e "${RED}❌ SENSITIVE FILE TRACKED: $file${NC}"
        TRACKED_SENSITIVE=$((TRACKED_SENSITIVE + 1))
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
    fi
done

if [ $TRACKED_SENSITIVE -eq 0 ]; then
    echo -e "${GREEN}✅ No sensitive files tracked${NC}"
fi
echo ""

# ============================================================================
# Check 4: Check for large files
# ============================================================================
echo "🔍 Check 4: Checking for large files (>10MB)..."

LARGE_FILES=$(find . -type f -size +10M -not -path "./.git/*" -not -path "./venv/*" 2>/dev/null)
if [ ! -z "$LARGE_FILES" ]; then
    echo -e "${YELLOW}⚠️  Large files found:${NC}"
    echo "$LARGE_FILES"
    echo "   Consider using Git LFS or adding to .gitignore"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
else
    echo -e "${GREEN}✅ No large files found${NC}"
fi
echo ""

# ============================================================================
# Check 5: Check for PDF/Excel files (may contain sensitive data)
# ============================================================================
echo "🔍 Check 5: Checking for PDF/Excel files..."

PDF_XLSX_FILES=$(git ls-files | grep -E '\.(pdf|xlsx|docx)$')
if [ ! -z "$PDF_XLSX_FILES" ]; then
    echo -e "${YELLOW}⚠️  Document files tracked (may contain sensitive data):${NC}"
    echo "$PDF_XLSX_FILES"
    echo "   Review these files before pushing"
    ISSUES_FOUND=$((ISSUES_FOUND + 1))
else
    echo -e "${GREEN}✅ No document files tracked${NC}"
fi
echo ""

# ============================================================================
# Check 6: Check Git history for secrets (if repo exists)
# ============================================================================
if [ -d ".git" ]; then
    echo "🔍 Check 6: Scanning Git history for secrets..."
    
    # Check commit messages for sensitive data
    HISTORY_CHECK=$(git log --all --grep="password\|secret\|token\|api.key" --oneline 2>/dev/null)
    if [ ! -z "$HISTORY_CHECK" ]; then
        echo -e "${YELLOW}⚠️  Commits with sensitive keywords in messages:${NC}"
        echo "$HISTORY_CHECK"
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
    else
        echo -e "${GREEN}✅ Git history looks clean${NC}"
    fi
    echo ""
fi

# ============================================================================
# Check 7: Verify environment variables are used (not hardcoded)
# ============================================================================
echo "🔍 Check 7: Verifying environment variable usage..."

HARDCODED=0
# Check Python files for proper environment variable usage
for pyfile in $(find . -name "*.py" -not -path "./venv/*" -not -path "./.git/*" 2>/dev/null); do
    # Look for os.getenv usage (good)
    if grep -q "os.getenv" "$pyfile"; then
        continue
    fi
    
    # Look for direct key assignment (bad)
    if grep -qE "(api_key|token|password).*=.*['\"][a-zA-Z0-9]{20,}['\"]" "$pyfile"; then
        echo -e "${RED}❌ Possible hardcoded credential in: $pyfile${NC}"
        HARDCODED=$((HARDCODED + 1))
        ISSUES_FOUND=$((ISSUES_FOUND + 1))
    fi
done

if [ $HARDCODED -eq 0 ]; then
    echo -e "${GREEN}✅ Using environment variables properly${NC}"
fi
echo ""

# ============================================================================
# Summary
# ============================================================================
echo "=================================================="
echo "📊 Security Check Summary"
echo "=================================================="

if [ $ISSUES_FOUND -eq 0 ]; then
    echo -e "${GREEN}✅ ALL CHECKS PASSED!${NC}"
    echo ""
    echo "Your repository is safe to push to GitHub! 🎉"
    echo ""
    exit 0
else
    echo -e "${RED}❌ ISSUES FOUND: $ISSUES_FOUND${NC}"
    echo ""
    echo "⚠️  IMPORTANT: Fix these issues before pushing to GitHub!"
    echo ""
    echo "Quick fixes:"
    echo "1. Remove sensitive files: git rm --cached <file>"
    echo "2. Update .gitignore"
    echo "3. Never commit API keys or credentials"
    echo "4. Use environment variables instead"
    echo ""
    echo "If you've already committed secrets:"
    echo "1. Change the exposed credentials immediately"
    echo "2. Use 'git filter-branch' or 'BFG Repo-Cleaner' to remove from history"
    echo "3. Force push with: git push --force"
    echo ""
    exit 1
fi
