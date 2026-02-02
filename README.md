# Claude Code Custom Commands

Reusable prompts for Claude Code that i find useful.

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/claude_prompts.git
cd claude_prompts
```

**Unix:**: 

`./setup-unix.sh`

**Windows:**: 

`./setup-windows.ps1` or `./setup-windows.bat`


## Available Commands

| Command | Description |
|---------|-------------|
| `/setup-c-library` | Initialize a C library project with CMake |
| `/setup-cpp-library` | Initialize a C++ library project with CMake |
| `/setup-unit-tests` | Add GoogleTest unit tests to existing project (separate files per module) |
| `/setup-examples` | Create example programs for the library |
| `/setup-docs` | Generate documentation structure with GitHub Pages |
| `/summarize-project` | Analyze and provide comprehensive project summary |
| `/run-fix-unit-tests` | Run CTest and fix all test failures (can modify source code) |
| `/fix-unit-tests-only` | Run CTest and fix test failures (test code only, no source changes) |

## Usage

In any project directory, open Claude Code and type:

```
/setup-cpp-library
```

Claude will follow the prompt instructions to set up your project.
