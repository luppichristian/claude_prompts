# Create Unit Tests for C/C++ Library

Set up unit tests for this project following these guidelines:

## Testing Framework Selection
1. Use the testing framework already configured in the build system if present
2. If none exists, default to **GoogleTest** for C/C++ projects

## Project Structure
- Place all test files in `tests/` unless otherwise specified
- Create one test file per module: for `parser.h`/`parser.cpp`, create `tests/test_parser.cpp`
- Mirror the source directory structure in tests if the project uses subdirectories

## Build System Integration
- For CMake projects, ensure all tests are discoverable via **CTest**
- Add a `tests/CMakeLists.txt` that registers each test executable
- Provide a way to run all tests with a single command (e.g., `ctest` or `make test`)

## Test Coverage Requirements
Write tests that cover:
- **Normal cases**: typical/expected inputs and usage patterns
- **Edge cases**: empty inputs, boundary values, null pointers, maximum sizes
- **Error handling**: invalid inputs, expected failures, exception behavior
- **State transitions**: if the module maintains state, test state changes

## Test Naming Convention
Use descriptive test names: `TEST(ModuleName, DescribesExpectedBehavior)`

Example:
```cpp
TEST(Parser, ReturnsEmptyOnNullInput)
TEST(Parser, ParsesValidJsonObject)
TEST(Parser, ThrowsOnMalformedInput)
```

## Before Writing Tests
1. Read the existing source files to understand the API
2. Identify public functions/classes that need testing
3. Check for existing test infrastructure in the project

# Launch subagents if you think its worth it