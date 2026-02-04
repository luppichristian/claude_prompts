# Create Documentation for C/C++ Library

Generate a comprehensive README.md and documentation in `docs/` directory.

## Before Writing Docs
1. Read all public headers to understand the API
2. Check existing documentation to maintain consistency
3. Review examples for usage patterns to document (if present)
4. Identify the project name, dependencies, and build requirements
5. Check for CLI utility to document (if present)

## README.md Format
Create a project README following this structure:

```markdown
# {Project Name}

Brief one-line description of what the library does and its purpose.

[Optional badges: build status, license, version]

More detailed description (2-3 sentences) explaining the core functionality
and what problem it solves.

## Features

• Feature 1: Brief description
• Feature 2: Brief description
• Feature 3: Brief description
• Feature 4: Brief description

## Requirements

• CMake 3.x+
• C11/C++17 compiler
• List all required dependencies
• Optional dependencies with purpose

### Build Options

| Option | Default | Description |
|--------|---------|-------------|
| BUILD_SHARED_LIBS | OFF | Build as shared library |
| BUILD_TESTS | ON | Build test suite |
| BUILD_EXAMPLES | ON | Build example programs |

## Documentation

See [docs](https://user.github.io/project/) for comprehensive API documentation and usage patterns.

## Examples

See the [examples/](examples/) directory for complete working examples.

## License

MIT License - see [LICENSE](LICENSE)
```

## Documentation Directory Structure
```
docs/
├── index.md          # Overview and quick start (picked up by github pages)
├── getting-started.md # Installation and basic usage
├── _config.yml
├── modules/
│   └── <module>.md   # One file per public module
├── examples.md       # Links to and explains examples (if present)
└── cli.md            # CLI utility documentation (if present)
```

## Module Documentation Format
Each module page (`docs/api/<module>.md`) should include:

```markdown
# <Module Name>

## Overview
Brief description of what this module does.

## Why Use This?
When and why you would use this module.

## Types
| Type | Description |
|------|-------------|
| `type_name` | What it represents |

## Functions
### `function_name`
Brief description.

**Signature:**
`return_type function_name(params)`

**Parameters:**
- `param` — description

**Returns:** what it returns

**Notes:** (if applicable) edge cases, thread safety, memory ownership, etc.

**Example:** (minimal usage)

```

## Style Guidelines
- Use consistent header levels across all pages
- Keep descriptions concise
- Include code examples for non-obvious functions
- Link between related modules/functions

## GitHub Pages Setup
1. Create `docs/_config.yml`:
   ```yaml
   title: "Project Name Documentation"
   theme: jekyll-theme-cayman
   baseurl: "/repository-name"
   ```
2. Add front matter to each `.md` file:
   ```markdown
   ---
   layout: default
   title: Page Title
   ---
   ```
3. Enable in GitHub: **Settings** → **Pages** → Source: `main` branch, `/docs` folder