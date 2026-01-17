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
