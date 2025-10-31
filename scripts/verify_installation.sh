#!/bin/bash

# Docling MCP Installation Verification Script
# This script checks if all prerequisites are met and tests the installation

set -e

echo "======================================"
echo "Docling MCP Installation Verification"
echo "======================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print success
success() {
    echo -e "${GREEN}✓${NC} $1"
}

# Function to print error
error() {
    echo -e "${RED}✗${NC} $1"
}

# Function to print warning
warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Check Python version
echo "Checking Python installation..."
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version | awk '{print $2}')
    PYTHON_MAJOR=$(echo $PYTHON_VERSION | cut -d. -f1)
    PYTHON_MINOR=$(echo $PYTHON_VERSION | cut -d. -f2)
    
    if [ "$PYTHON_MAJOR" -eq 3 ] && [ "$PYTHON_MINOR" -ge 10 ]; then
        success "Python $PYTHON_VERSION found (requires 3.10+)"
    else
        error "Python $PYTHON_VERSION found, but Python 3.10+ is required"
        exit 1
    fi
elif command -v python &> /dev/null; then
    PYTHON_VERSION=$(python --version | awk '{print $2}')
    PYTHON_MAJOR=$(echo $PYTHON_VERSION | cut -d. -f1)
    PYTHON_MINOR=$(echo $PYTHON_VERSION | cut -d. -f2)
    
    if [ "$PYTHON_MAJOR" -eq 3 ] && [ "$PYTHON_MINOR" -ge 10 ]; then
        success "Python $PYTHON_VERSION found (requires 3.10+)"
    else
        error "Python $PYTHON_VERSION found, but Python 3.10+ is required"
        exit 1
    fi
else
    error "Python not found. Please install Python 3.10 or higher"
    exit 1
fi

# Check pip
echo ""
echo "Checking pip installation..."
if command -v pip3 &> /dev/null; then
    PIP_VERSION=$(pip3 --version | awk '{print $2}')
    success "pip $PIP_VERSION found"
elif command -v pip &> /dev/null; then
    PIP_VERSION=$(pip --version | awk '{print $2}')
    success "pip $PIP_VERSION found"
else
    error "pip not found. Please install pip"
    exit 1
fi

# Check uv (optional but recommended)
echo ""
echo "Checking uv installation..."
if command -v uv &> /dev/null; then
    UV_VERSION=$(uv --version | awk '{print $2}')
    success "uv $UV_VERSION found (recommended)"
    HAS_UV=true
else
    warning "uv not found (optional but recommended)"
    echo "  Install with: curl -LsSf https://astral.sh/uv/install.sh | sh"
    HAS_UV=false
fi

# Check if uvx is available
echo ""
echo "Checking uvx availability..."
if command -v uvx &> /dev/null; then
    success "uvx available"
    HAS_UVX=true
else
    warning "uvx not available"
    HAS_UVX=false
fi

# Try to check if docling-mcp is installed
echo ""
echo "Checking Docling MCP installation..."
if $HAS_UVX; then
    echo "Testing with uvx..."
    if uvx --from docling-mcp docling-mcp-server --help &> /dev/null; then
        success "Docling MCP can be run with uvx"
        echo ""
        echo "You can start the server with:"
        echo "  uvx --from docling-mcp docling-mcp-server --transport stdio"
    else
        warning "Could not run Docling MCP with uvx"
    fi
fi

# Check if installed via pip
if python3 -c "import docling_mcp" 2>/dev/null; then
    success "Docling MCP is installed via pip"
    echo ""
    echo "You can start the server with:"
    echo "  docling-mcp-server --transport stdio"
elif python -c "import docling_mcp" 2>/dev/null; then
    success "Docling MCP is installed via pip"
    echo ""
    echo "You can start the server with:"
    echo "  docling-mcp-server --transport stdio"
else
    warning "Docling MCP is not installed via pip"
    echo ""
    echo "To install, run one of the following:"
    if $HAS_UV; then
        echo "  uv pip install docling-mcp"
    else
        echo "  pip install docling-mcp"
    fi
    echo ""
    echo "Or use uvx without installation:"
    echo "  uvx --from docling-mcp docling-mcp-server"
fi

echo ""
echo "======================================"
echo "Installation Check Complete"
echo "======================================"
echo ""
echo "For detailed installation instructions, see:"
echo "  https://github.com/docling-project/docling-mcp/blob/main/INSTALL.md"
echo ""
echo "For Portuguese/Galician version:"
echo "  https://github.com/docling-project/docling-mcp/blob/main/docs/INSTALL_pt.md"
