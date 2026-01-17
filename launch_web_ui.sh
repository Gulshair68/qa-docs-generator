#!/bin/bash
# QA Documentation Generator - Web UI Launcher
# Quick launch script for Mac/Linux

echo "============================================================"
echo "🚀 QA Documentation Generator - Web UI"
echo "============================================================"
echo ""

# Check if we're in the right directory
if [ ! -f "web_ui_app.py" ]; then
    echo "❌ Error: web_ui_app.py not found!"
    echo "   Please run this script from the TestPlanGenerator directory"
    exit 1
fi

# Check if virtual environment exists
if [ -d "venv" ]; then
    echo "✅ Virtual environment found"
    source venv/bin/activate
else
    echo "⚠️  Virtual environment not found (optional)"
fi

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed!"
    exit 1
fi

echo "✅ Python 3: $(python3 --version)"

# Check API key
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "⚠️  Warning: ANTHROPIC_API_KEY not set"
    echo "   Set it with: export ANTHROPIC_API_KEY='your-key'"
    echo ""
    read -p "Do you want to continue anyway? (y/n): " response
    if [[ ! $response =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo "✅ API Key configured"
fi

# Check if Streamlit is installed
if ! python3 -c "import streamlit" 2>/dev/null; then
    echo ""
    echo "❌ Streamlit is not installed!"
    echo ""
    read -p "Would you like to install it now? (y/n): " install_response
    
    if [[ $install_response =~ ^[Yy]$ ]]; then
        echo "📦 Installing Streamlit..."
        pip3 install streamlit
        
        if [ $? -eq 0 ]; then
            echo "✅ Streamlit installed successfully!"
        else
            echo "❌ Failed to install Streamlit"
            exit 1
        fi
    else
        echo "❌ Cannot run web UI without Streamlit"
        exit 1
    fi
else
    echo "✅ Streamlit installed"
fi

echo ""
echo "============================================================"
echo "🌐 Starting Web UI..."
echo "============================================================"
echo ""
echo "The browser will open automatically at:"
echo "   http://localhost:8501"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""
echo "============================================================"
echo ""

# Run Streamlit
streamlit run web_ui_app.py

# Cleanup message on exit
echo ""
echo "============================================================"
echo "👋 Web UI stopped"
echo "============================================================"
