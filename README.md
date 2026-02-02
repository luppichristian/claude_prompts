# Claude Code Custom Commands for C/C++ Projects

Reusable prompts for claude code.

## Installation

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/claude_prompts.git

# Symlink to Claude Code's global commands directory
# Linux/macOS
ln -s $(pwd)/claude_prompts/*.md ~/.claude/commands/

# Windows (PowerShell as Admin)
Get-ChildItem "C:\path\to\claude_prompts\*.md" | ForEach-Object {
    New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.claude\commands\$($_.Name)" -Target $_.FullName
}
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
