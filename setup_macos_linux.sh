#!/bin/bash
# Automatic Setup Script for Test Plan Generator (macOS/Linux)
# This script will setup everything automatically

echo "============================================================"
echo "  Test Plan Generator - Automatic Setup for macOS/Linux"
echo "============================================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Python 3 is installed
echo "[Step 1/6] Checking Python installation..."
if command -v python3 &> /dev/null; then
    python3 --version
    echo -e "${GREEN}✅ Python 3 is installed${NC}"
else
    echo -e "${RED}❌ Python 3 is not installed${NC}"
    echo ""
    
    # Check OS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        echo "Installing Python 3 via Homebrew..."
        echo ""
        
        # Check if Homebrew is installed
        if ! command -v brew &> /dev/null; then
            echo "Installing Homebrew first..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        
        # Install Python
        brew install python3
        
    elif [[ -f /etc/debian_version ]]; then
        # Debian/Ubuntu
        echo "Installing Python 3..."
        sudo apt-get update
        sudo apt-get install -y python3 python3-pip
        
    elif [[ -f /etc/redhat-release ]]; then
        # RedHat/CentOS/Fedora
        echo "Installing Python 3..."
        sudo yum install -y python3 python3-pip
    else
        echo "Please install Python 3 manually from: https://www.python.org/downloads/"
        exit 1
    fi
    
    # Verify installation
    if command -v python3 &> /dev/null; then
        echo -e "${GREEN}✅ Python 3 installed successfully${NC}"
    else
        echo -e "${RED}❌ Failed to install Python 3${NC}"
        exit 1
    fi
fi
echo ""

# Check if pip is available
echo "[Step 2/6] Checking pip..."
if command -v pip3 &> /dev/null; then
    pip3 --version
    echo -e "${GREEN}✅ pip3 is available${NC}"
else
    echo "Installing pip..."
    python3 -m ensurepip --upgrade
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ pip installed${NC}"
    else
        echo -e "${RED}❌ Failed to install pip${NC}"
        exit 1
    fi
fi
echo ""

# Upgrade pip
echo "[Step 3/6] Upgrading pip..."
python3 -m pip install --upgrade pip
echo -e "${GREEN}✅ pip upgraded${NC}"
echo ""

# Create virtual environment (optional but recommended)
echo "[Step 4/6] Setting up virtual environment..."
read -p "Do you want to create a virtual environment? (Recommended) [Y/n]: " create_venv
create_venv=${create_venv:-Y}

if [[ $create_venv =~ ^[Yy]$ ]]; then
    if [ ! -d "venv" ]; then
        python3 -m venv venv
        echo -e "${GREEN}✅ Virtual environment created${NC}"
    else
        echo -e "${YELLOW}⚠️  Virtual environment already exists${NC}"
    fi
    
    # Activate virtual environment
    source venv/bin/activate
    echo -e "${GREEN}✅ Virtual environment activated${NC}"
    echo ""
    echo -e "${YELLOW}Note: Run 'source venv/bin/activate' before using the script in future${NC}"
else
    echo "Skipping virtual environment creation"
fi
echo ""

# Install dependencies
echo "[Step 5/6] Installing dependencies..."
echo "This may take 1-2 minutes. Please wait..."
echo ""

pip3 install anthropic PyPDF2 python-docx requests --upgrade

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ All dependencies installed successfully!${NC}"
else
    echo ""
    echo -e "${RED}❌ Error installing dependencies${NC}"
    echo "Please check your internet connection and try again"
    exit 1
fi
echo ""

# Check for API key
echo "[Step 6/6] Checking Claude API key..."
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo ""
    echo -e "${YELLOW}⚠️  API Key is not set!${NC}"
    echo ""
    echo "To set your API key:"
    echo "1. Get your API key from: https://console.anthropic.com/"
    echo "2. Run this command:"
    echo ""
    
    # Detect shell
    if [[ "$SHELL" == *"zsh"* ]]; then
        echo '   echo '\''export ANTHROPIC_API_KEY="your-api-key-here"'\'' >> ~/.zshrc'
        echo '   source ~/.zshrc'
    else
        echo '   echo '\''export ANTHROPIC_API_KEY="your-api-key-here"'\'' >> ~/.bashrc'
        echo '   source ~/.bashrc'
    fi
    echo ""
    echo "OR"
    echo ""
    read -p "Enter your Claude API key (or press Enter to skip): " api_key
    
    if [ ! -z "$api_key" ]; then
        export ANTHROPIC_API_KEY="$api_key"
        echo -e "${GREEN}✅ API key set for this session${NC}"
        echo ""
        echo -e "${YELLOW}⚠️  Note: This is temporary. To make it permanent, add to your shell config:${NC}"
        if [[ "$SHELL" == *"zsh"* ]]; then
            echo "   echo 'export ANTHROPIC_API_KEY=\"$api_key\"' >> ~/.zshrc"
        else
            echo "   echo 'export ANTHROPIC_API_KEY=\"$api_key\"' >> ~/.bashrc"
        fi
    else
        echo "Skipping API key setup. You'll need to set it later."
    fi
else
    echo -e "${GREEN}✅ API key is already set${NC}"
fi
echo ""

# Verify files
echo "Verifying setup..."
echo ""

# Check if script file exists
if [ ! -f "generate_test_plan.py" ]; then
    echo -e "${YELLOW}⚠️  Warning: generate_test_plan.py not found in current directory${NC}"
    echo "Please make sure all files are in the same folder"
    echo ""
fi

# Check if requirements.txt exists
if [ ! -f "requirements.txt" ]; then
    echo -e "${YELLOW}⚠️  Warning: requirements.txt not found${NC}"
    echo ""
fi

# Show installed packages
echo "Installed packages:"
pip3 list | grep -E "anthropic|PyPDF2|python-docx"
echo ""

# Create a helper script for activation
cat > activate_env.sh << 'EOF'
#!/bin/bash
# Helper script to activate virtual environment

if [ -d "venv" ]; then
    source venv/bin/activate
    echo "✅ Virtual environment activated"
    echo ""
    echo "To run the test plan generator:"
    echo "  python generate_test_plan.py requirements.pdf \"Project Name\""
    echo ""
    echo "To deactivate: deactivate"
else
    echo "❌ Virtual environment not found"
    echo "Run setup_macos_linux.sh first"
fi
EOF

chmod +x activate_env.sh

echo "============================================================"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo "============================================================"
echo ""
echo "Next Steps:"
echo "1. Get your Claude API key from: https://console.anthropic.com/"
echo "2. Set the API key (if not done above)"
echo "3. Place your requirements PDF in this folder"
echo "4. Run:"
if [ -d "venv" ]; then
    echo "   source venv/bin/activate"
fi
echo "   python3 generate_test_plan.py requirements.pdf \"Project Name\""
echo ""
echo "For detailed instructions, read: COMPLETE_SETUP_URDU.md"
echo "============================================================"
echo ""

# Make helper script message
if [ -f "activate_env.sh" ]; then
    echo -e "${GREEN}Tip: Run './activate_env.sh' to quickly activate virtual environment${NC}"
    echo ""
fi
