# Create Examples for C/C++ Library

Create example programs demonstrating library usage.

## Before Writing Examples
1. Read the public API headers to understand available functionality
2. Check existing examples in `examples/` to avoid duplication
3. Identify the build system and how examples are compiled

## Example Structure
Place examples in `examples/` directory. Each example should be:
- **Self-contained**: single file when possible
- **Minimal**: only code necessary to demonstrate the feature
- **Commented**: brief explanations of key steps
- **Runnable**: compiles and executes without modification
- **Dont repeat yourself**: when too much code is shared across examples, you can create utility files

## Naming Convention
- `basic.c/cpp` — minimal "hello world" usage
- `<feature>.c/cpp` — demonstrates specific feature (e.g., `parsing.cpp`, `async_io.cpp`)

## Example Content
Each example should include:
```
1. Required includes
2. Brief comment explaining what the example demonstrates
3. Main function with:
   - Setup/initialization
   - Core demonstration
   - Cleanup (if needed)
   - Return 0 on success
```

## Coverage
Create examples for:
- Basic initialization and teardown
- Each major feature or module
- Common use cases and patterns
- Error handling where relevant

## Build Integration
- Ensure examples compile with existing build system
- For CMake: verify `examples/` is included when `PROJECTNAME_BUILD_EXAMPLES=ON`
- Each example should produce a separate executable: `<project>-<example_name>`
