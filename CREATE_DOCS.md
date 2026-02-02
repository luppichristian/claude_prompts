# Create Documentation for C/C++ Library

Generate documentation in `docs/` directory.

## Before Writing Docs
1. Read all public headers to understand the API
2. Check existing documentation to maintain consistency
3. Review examples for usage patterns to document

## Directory Structure
```
docs/
├── index.md          # Overview and quick start
├── getting-started.md # Installation and basic usage
├── api/
│   └── <module>.md   # One file per public module
└── examples.md       # Links to and explains examples
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

**Example:**
```c
// minimal usage
```
```

## Style Guidelines
- Use consistent header levels across all pages
- Keep descriptions concise
- Include code examples for non-obvious functions
- Link between related modules/functions

## GitHub Pages Setup
- Add workflow file `.github/workflows/docs.yml` for automatic deployment
- Configure to build from `docs/` on main branch
- Use Jekyll or static markdown hosting
