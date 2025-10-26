# Guia de Instalação do Docling MCP

Este guia fornece instruções passo a passo para instalar o Docling MCP no seu computador.

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Métodos de Instalação](#métodos-de-instalação)
  - [Instalação Rápida (Recomendado)](#instalação-rápida-recomendado)
  - [Instalar do PyPI](#instalar-do-pypi)
  - [Instalar do Código Fonte (Desenvolvimento)](#instalar-do-código-fonte-desenvolvimento)
- [Instruções Específicas por Plataforma](#instruções-específicas-por-plataforma)
  - [Windows](#windows)
  - [macOS](#macos)
  - [Linux](#linux)
- [Verificação](#verificação)
- [Resolução de Problemas](#resolução-de-problemas)

## Pré-requisitos

Antes de instalar o Docling MCP, certifique-se de ter:

- **Python 3.10 ou superior** - Docling MCP requer Python 3.10, 3.11, 3.12 ou 3.13
- **pip** (instalador de pacotes Python) - Geralmente vem com Python
- **uv** (recomendado) - Um instalador de pacotes Python rápido

### Instalando Python

Se você não tem Python instalado:

- **Windows**: Baixe de [python.org](https://www.python.org/downloads/)
- **macOS**: Use Homebrew: `brew install python@3.12` ou baixe de [python.org](https://www.python.org/downloads/)
- **Linux**: Use o gerenciador de pacotes, ex: `sudo apt install python3.12` (Ubuntu/Debian) ou `sudo dnf install python3.12` (Fedora)

Verifique a instalação do Python:

```bash
python --version
# ou
python3 --version
```

### Instalando uv (Recomendado)

`uv` é um instalador de pacotes Python rápido que facilita o trabalho com Docling MCP.

**macOS e Linux:**

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**Windows (PowerShell):**

```powershell
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

**Alternativa (usando pip):**

```bash
pip install uv
```

Verifique a instalação:

```bash
uv --version
```

## Métodos de Instalação

### Instalação Rápida (Recomendado)

A maneira mais fácil de usar Docling MCP é com `uvx`, que o executa sem exigir uma instalação separada:

```bash
uvx --from docling-mcp docling-mcp-server --help
```

Este comando irá:
1. Baixar Docling MCP e suas dependências
2. Criar um ambiente isolado temporário
3. Executar o servidor

Para usar com um protocolo de transporte específico:

```bash
# Para stdio (usado por Claude Desktop, LM Studio)
uvx --from docling-mcp docling-mcp-server --transport stdio

# Para SSE (usado por Llama Stack)
uvx --from docling-mcp docling-mcp-server --transport sse

# Para streamable-http (usado em configurações de contêiner)
uvx --from docling-mcp docling-mcp-server --transport streamable-http
```

### Instalar do PyPI

Para instalar Docling MCP permanentemente no seu sistema:

**Usando uv (recomendado):**

```bash
uv pip install docling-mcp
```

**Usando pip:**

```bash
pip install docling-mcp
```

**Com dependências opcionais:**

Para aplicações RAG com Llama Index e Milvus:

```bash
uv pip install "docling-mcp[llama-index-rag]"
# ou
pip install "docling-mcp[llama-index-rag]"
```

Para integração com Llama Stack (Python 3.12+):

```bash
uv pip install "docling-mcp[llama-stack]"
# ou
pip install "docling-mcp[llama-stack]"
```

Para integração com Smolagents:

```bash
uv pip install "docling-mcp[smolagents]"
# ou
pip install "docling-mcp[smolagents]"
```

### Instalar do Código Fonte (Desenvolvimento)

Para desenvolvedores que querem contribuir ou modificar o Docling MCP:

1. **Clone o repositório:**

```bash
git clone https://github.com/docling-project/docling-mcp.git
cd docling-mcp
```

2. **Crie um ambiente virtual e instale as dependências:**

```bash
uv sync --all-extras
```

Ou sem uv:

```bash
python -m venv venv
source venv/bin/activate  # No Windows: venv\Scripts\activate
pip install -e ".[dev]"
```

3. **Execute no modo de desenvolvimento:**

```bash
uv run docling-mcp-server
# ou
python -m docling_mcp.servers.mcp_server
```

## Instruções Específicas por Plataforma

### Windows

1. **Instale Python:**
   - Baixe o instalador de [python.org](https://www.python.org/downloads/)
   - Durante a instalação, marque "Add Python to PATH"
   - Reinicie o terminal/prompt de comando após a instalação

2. **Instale uv:**
   ```powershell
   powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
   ```

3. **Instale Docling MCP:**
   ```powershell
   uv pip install docling-mcp
   ```

4. **Execute o servidor:**
   ```powershell
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```

### macOS

1. **Instale Python (usando Homebrew):**
   ```bash
   brew install python@3.12
   ```

2. **Instale uv:**
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

3. **Instale Docling MCP:**
   ```bash
   uv pip install docling-mcp
   ```

4. **Execute o servidor:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```

### Linux

**Ubuntu/Debian:**

1. **Instale Python:**
   ```bash
   sudo apt update
   sudo apt install python3.12 python3.12-venv python3-pip
   ```

2. **Instale uv:**
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

3. **Instale Docling MCP:**
   ```bash
   uv pip install docling-mcp
   ```

4. **Execute o servidor:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```

**Fedora/RHEL:**

1. **Instale Python:**
   ```bash
   sudo dnf install python3.12
   ```

2. **Instale uv:**
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

3. **Instale Docling MCP:**
   ```bash
   uv pip install docling-mcp
   ```

4. **Execute o servidor:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```

## Verificação

Após a instalação, verifique se o Docling MCP está funcionando corretamente:

### Verificação Automática (Linux/macOS)

Para usuários de Linux e macOS, você pode usar o script de verificação automática:

```bash
curl -fsSL https://raw.githubusercontent.com/docling-project/docling-mcp/main/scripts/verify_installation.sh | bash
```

Ou se você clonou o repositório:

```bash
./scripts/verify_installation.sh
```

Este script verificará:
- Versão do Python (3.10+)
- Instalação do pip
- Instalação do uv (opcional)
- Status da instalação do Docling MCP

### Verificação Manual

1. **Verifique a versão:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --version
   ```

2. **Veja as opções disponíveis:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --help
   ```

3. **Teste uma execução básica:**
   ```bash
   uvx --from docling-mcp docling-mcp-server --transport stdio
   ```
   
   O servidor deve iniciar sem erros. Pressione `Ctrl+C` para pará-lo.

## Resolução de Problemas

### Problemas de Versão do Python

**Problema:** "Python 3.10 ou superior é necessário"

**Solução:** Atualize sua instalação do Python. Verifique sua versão com:
```bash
python --version
```

Se você tem várias versões do Python, pode precisar especificar a versão:
```bash
python3.12 --version
uv venv --python 3.12
```

### uv Não Encontrado

**Problema:** "uv: command not found"

**Solução:** 
1. Reinicie seu terminal após instalar o uv
2. Verifique se o uv está no seu PATH:
   ```bash
   which uv  # macOS/Linux
   where uv  # Windows
   ```
3. Se não for encontrado, reinstale o uv ou adicione-o ao PATH manualmente

### Instalação Falha com Erros de Permissão

**Problema:** Permissão negada durante a instalação

**Solução:**
- **Não use `sudo` com uv ou pip em um ambiente virtual**
- Crie um ambiente virtual primeiro:
  ```bash
  python -m venv venv
  source venv/bin/activate  # No Windows: venv\Scripts\activate
  pip install docling-mcp
  ```

### Problemas de Rede/Firewall

**Problema:** Não é possível baixar pacotes

**Solução:**
- Verifique sua conexão com a internet
- Se estiver atrás de um firewall corporativo, pode precisar configurar as definições de proxy:
  ```bash
  export HTTP_PROXY=http://proxy.example.com:8080
  export HTTPS_PROXY=http://proxy.example.com:8080
  ```

### Erros de Importação

**Problema:** "ModuleNotFoundError: No module named 'docling_mcp'"

**Solução:**
1. Certifique-se de estar no ambiente virtual correto
2. Reinstale o pacote:
   ```bash
   uv pip install --force-reinstall docling-mcp
   ```

## Próximos Passos

Após a instalação bem-sucedida, você pode:

1. **Integrar com clientes MCP:** Veja a [documentação de integrações](../integrations/README.md)
2. **Explorar exemplos:** Confira o [diretório de exemplos](../../examples/)
3. **Ler a documentação completa:** Visite o [README](../../README.md)

## Obtendo Ajuda

Se você encontrar problemas não cobertos neste guia:

- Verifique as [Issues no GitHub](https://github.com/docling-project/docling-mcp/issues)
- Leia o [Guia de Contribuição](../../CONTRIBUTING.md)
- Participe das discussões da comunidade

Para relatórios de bugs e solicitações de recursos, por favor abra uma issue no GitHub.
