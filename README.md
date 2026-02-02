# Claude Code Custom Commands

Reusable prompts for Claude Code that i find useful.

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/claude_prompts.git
cd claude_prompts
```

**Unix:**
```bash
./install-unix.sh
```

**Windows (PowerShell as Admin):**
```powershell
.\install-windows.ps1
```

## Available Commands

| Command | Description |
|---------|-------------|
| `/setup-c-library` | Initialize a C library project with CMake |
| `/setup-cpp-library` | Initialize a C++ library project with CMake |
| `/setup-unit-tests` | Add GoogleTest unit tests to existing project |
| `/setup-examples` | Create example programs for the library |
| `/setup-docs` | Generate documentation structure with GitHub Pages |

## Usage

In any project directory, open Claude Code and type:

```
/setup-cpp-library
```

Claude will follow the prompt instructions to set up your project.
