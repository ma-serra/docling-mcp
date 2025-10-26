# Installation Guide for Docling MCP

This guide provides step-by-step instructions for installing Docling MCP on your computer.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation Methods](#installation-methods)
  - [Quick Install (Recommended)](#quick-install-recommended)
  - [Install from PyPI](#install-from-pypi)
  - [Install from Source (Development)](#install-from-source-development)
- [Platform-Specific Instructions](#platform-specific-instructions)
  - [Windows](#windows)
  - [macOS](#macos)
  - [Linux](#linux)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)

## Prerequisites

Before installing Docling MCP, ensure you have the following:

- **Python 3.10 or higher** - Docling MCP requires Python 3.10, 3.11, 3.12, or 3.13
- **pip** (Python package installer) - Usually comes with Python
- **uv** (recommended) - A fast Python package installer and resolver

### Installing Python

If you don't have Python installed:

- **Windows**: Download from [python.org](https://www.python.org/downloads/)
- **macOS**: Use Homebrew: `brew install python@3.12` or download from [python.org](https://www.python.org/downloads/)
- **Linux**: Use your package manager, e.g., `sudo apt install python3.12` (Ubuntu/Debian) or `sudo dnf install python3.12` (Fedora)

Verify your Python installation:

```bash
python --version
# or
python3 --version
```

### Installing uv (Recommended)

`uv` is a fast Python package installer that makes working with Docling MCP easier.

**macOS and Linux:**

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**Windows (PowerShell):**

```powershell
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

**Alternative (using pip):**

```bash
pip install uv
```

Verify the installation:

```bash
uv --version
```

## Installation Methods

### Quick Install (Recommended)

The easiest way to use Docling MCP is with `uvx`, which runs it without requiring a separate installation:

```bash
uvx --from docling-mcp docling-mcp-server --help
```

This command will:
1. Download Docling MCP and its dependencies
2. Create a temporary isolated environment
3. Run the server

To use it with a specific transport protocol:

```bash
# For stdio (used by Claude Desktop, LM Studio)
uvx --from docling-mcp docling-mcp-server --transport stdio

# For SSE (used by Llama Stack)
uvx --from docling-mcp docling-mcp-server --transport sse

# For streamable-http (used in container setups)
uvx --from docling-mcp docling-mcp-server --transport streamable-http
```

### Install from PyPI

To install Docling MCP permanently on your system:

**Using uv (recommended):**

```bash
uv pip install docling-mcp
```

**Using pip:**

```bash
pip install docling-mcp
```

**With optional dependencies:**

For RAG applications with Llama Index and Milvus:

```bash
uv pip install "docling-mcp[llama-index-rag]"
# or
pip install "docling-mcp[llama-index-rag]"
```

For Llama Stack integration (Python 3.12+):

```bash
uv pip install "docling-mcp[llama-stack]"
# or
pip install "docling-mcp[llama-stack]"
```

For Smolagents integration:

```bash
uv pip install "docling-mcp[smolagents]"
# or
pip install "docling-mcp[smolagents]"
```

### Install from Source (Development)

For developers who want to contribute or modify Docling MCP:

1. **Clone the repository:**

```bash
git clone https://github.com/docling-project/docling-mcp.git
cd docling-mcp
```

2. **Create a virtual environment and install dependencies:**

```bash
uv sync --all-extras
```

Or without uv:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -e ".[dev]"
```

3. **Run in development mode:**

```bash
uv run docling-mcp-server
# or
python -m docling_mcp.servers.mcp_server
```

## Platform-Specific Instructions

### Windows

1. **Install Python:**
   - Download the installer from [python.org](https://www.python.org/downloads/)
   - During installation, check "Add Python to PATH"
   - Restart your terminal/command prompt after installation

2. **Install uv:**
   ```powershell
   powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
   ```

3. **Install Docling MCP:**
   ```powershell
   uv pip install docling-mcp
   ```

4. **Run the server:**
   ```powershell
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```

### macOS

1. **Install Python (using Homebrew):**
   ```bash
   brew install python@3.12
   ```

2. **Install uv:**
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

3. **Install Docling MCP:**
   ```bash
   uv pip install docling-mcp
   ```

4. **Run the server:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```

### Linux

**Ubuntu/Debian:**

1. **Install Python:**
   ```bash
   sudo apt update
   sudo apt install python3.12 python3.12-venv python3-pip
   ```

2. **Install uv:**
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

3. **Install Docling MCP:**
   ```bash
   uv pip install docling-mcp
   ```

4. **Run the server:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```

**Fedora/RHEL:**

1. **Install Python:**
   ```bash
   sudo dnf install python3.12
   ```

2. **Install uv:**
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

3. **Install Docling MCP:**
   ```bash
   uv pip install docling-mcp
   ```

4. **Run the server:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```

## Verification

After installation, verify that Docling MCP is working correctly:

1. **Check the version:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --version
   ```

2. **View available options:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --help
   ```

3. **Test a basic run:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```
   
   The server should start without errors. Press `Ctrl+C` to stop it.

## Troubleshooting

### Python Version Issues

**Problem:** "Python 3.10 or higher is required"

**Solution:** Update your Python installation. Check your version with:
```bash
python --version
```

If you have multiple Python versions, you may need to specify the version:
```bash
python3.12 --version
uv venv --python 3.12
```

### uv Not Found

**Problem:** "uv: command not found"

**Solution:** 
1. Restart your terminal after installing uv
2. Check if uv is in your PATH:
   ```bash
   which uv  # macOS/Linux
   where uv  # Windows
   ```
3. If not found, reinstall uv or add it to your PATH manually

### Installation Fails with Permission Errors

**Problem:** Permission denied during installation

**Solution:**
- **Don't use `sudo` with uv or pip in a virtual environment**
- Create a virtual environment first:
  ```bash
  python -m venv venv
  source venv/bin/activate  # On Windows: venv\Scripts\activate
  pip install docling-mcp
  ```

### Network/Firewall Issues

**Problem:** Unable to download packages

**Solution:**
- Check your internet connection
- If behind a corporate firewall, you may need to configure proxy settings:
  ```bash
  export HTTP_PROXY=http://proxy.example.com:8080
  export HTTPS_PROXY=http://proxy.example.com:8080
  ```

### Import Errors

**Problem:** "ModuleNotFoundError: No module named 'docling_mcp'"

**Solution:**
1. Ensure you're in the correct virtual environment
2. Reinstall the package:
   ```bash
   uv pip install --force-reinstall docling-mcp
   ```

## Next Steps

After successful installation, you can:

1. **Integrate with MCP clients:** See the [integrations documentation](docs/integrations/README.md)
2. **Explore examples:** Check the [examples directory](examples/)
3. **Read the full documentation:** Visit the [README](README.md)

## Getting Help

If you encounter issues not covered in this guide:

- Check the [GitHub Issues](https://github.com/docling-project/docling-mcp/issues)
- Read the [Contributing Guide](CONTRIBUTING.md)
- Join the community discussions

For bug reports and feature requests, please open an issue on GitHub.
