#!/bin/bash
# NexXaForge - Project Initialization Script
# Author: Claude (Code Quality & Security Lead)
# Purpose: Setup project structure with security & quality standards

set -e

PROJECT_NAME="NexXaForge"
AUTHOR="Wh04miX"

echo "🔱 Initializing $PROJECT_NAME by $AUTHOR..."

# Create directory structure
echo "📁 Creating directory structure..."

# Root directories
mkdir -p cmd/nexxaforge
mkdir -p pkg/{core,http,template,modules,evasion,output,utils}
mkdir -p internal/{security,intelligence}
mkdir -p templates/{vulnerabilities,misconfigs,exposures,staging/pending-review,meta}
mkdir -p tests/{unit,integration,benchmarks,security}
mkdir -p docs
mkdir -p scripts
mkdir -p configs
mkdir -p .github/workflows

# Module subdirectories
mkdir -p pkg/modules/{sqli,xss,lfi,ssrf,dirfuzz,paramfuzz,subdomain}
mkdir -p pkg/modules/sqli/testdata/{positive,negative}
mkdir -p pkg/modules/xss/testdata/{positive,negative}
mkdir -p pkg/modules/lfi/testdata/{positive,negative}
mkdir -p pkg/modules/ssrf/testdata/{positive,negative}

# Intelligence subdirectories
mkdir -p internal/intelligence/mutators
mkdir -p internal/intelligence/dictionaries

# Test subdirectories
mkdir -p tests/unit/modules
mkdir -p tests/integration/fixtures

echo "✅ Directory structure created!"

# Initialize Go module
echo "🔧 Initializing Go module..."
cat > go.mod << 'EOF'
module github.com/Wh04miX/NexXaForge

go 1.21

require (
    gopkg.in/yaml.v3 v3.0.1
    github.com/fatih/color v1.16.0
    github.com/spf13/cobra v1.8.0
)
EOF

echo "✅ Go module initialized!"

# Create .gitignore
echo "📝 Creating .gitignore..."
cat > .gitignore << 'EOF'
# Binaries
*.exe
*.exe~
*.dll
*.so
*.dylib
nexxaforge
NexXaForge

# Test binary, built with `go test -c`
*.test

# Output of the go coverage tool
*.out
coverage.html
coverage.txt

# Dependency directories
vendor/

# Go workspace file
go.work

# IDE
.idea/
.vscode/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Build artifacts
dist/
build/

# Logs
*.log

# Sensitive data
*.key
*.pem
secrets/

# Test results
test-results/

# Templates in development
templates/staging/*.yaml
!templates/staging/.gitkeep
EOF

echo "✅ .gitignore created!"

# Create LICENSE (MIT)
echo "📜 Creating LICENSE..."
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2025 Wh04miX

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

echo "✅ LICENSE created!"

# Create README.md
echo "📖 Creating README.md..."
cat > README.md << 'EOF'
# 🔱 NexXaForge

**Advanced Multi-Purpose Security Scanner** - Built with Go

> A powerful, fast, and extensible vulnerability scanner inspired by Nuclei, enhanced with intelligent fuzzing and comprehensive security testing capabilities.

## 🎯 Features

- **🚀 High Performance**: Built on Go with concurrent scanning
- **🧠 Intelligent Fuzzing**: AI-powered payload generation and mutation
- **🎯 Multi-Module**: SQLi, XSS, LFI, SSRF, Directory Fuzzing, and more
- **🛡️ WAF Evasion**: Advanced techniques to bypass security controls
- **📊 Rich Reporting**: Multiple output formats (JSON, YAML, HTML, Markdown)
- **🔄 Auto-Updates**: Continuous threat intelligence updates
- **🎨 Beautiful CLI**: Intuitive interface with progress indicators

## 🏗️ Architecture

Built by a collaborative team of Wh04miX specialists:
- **unknown**: Architecture & Core Engineering
- **unknown**: Code Quality & Security
- **unknown**: Performance & Core Engine
- **unknown**: Threat Intelligence & Research
- **unknown**: Automation & CLI/UX
- **unknown**: Strategic Advisory

## 🚀 Quick Start

```bash
# Install
go install github.com/C1BENK/NexXaForge/cmd/nexxaforge@latest

# Run basic scan
nexxaforge -u https://example.com

# Run with specific modules
nexxaforge -u https://example.com -m sqli,xss

# Use custom templates
nexxaforge -u https://example.com -t ./templates/custom/
```

## 📚 Documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Contributing](docs/CONTRIBUTING.md)
- [Security Policy](docs/SECURITY.md)
- [Template Guide](docs/TEMPLATE_GUIDE.md)

## ⚠️ Disclaimer

This tool is for **authorized security testing only**. Users are responsible for complying with applicable laws and obtaining proper authorization before testing any systems.

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

## 👤 Author

**Wh04miX**

---

Built with ❤️ by the NexXaForge Team Wh04miX

echo "✅ README.md created!"

# Create .gitkeep files for empty directories
find . -type d -empty -exec touch {}/.gitkeep \;

echo ""
echo "🎉 NexXaForge project structure initialized successfully!"
echo ""
echo "📋 Next steps:"
echo "  1. cd NexXaForge"
echo "  2. git init"
echo "  3. git add ."
echo "  4. git commit -m 'Initial commit: Project structure'"
echo ""
echo "🚀 Ready for development!"

