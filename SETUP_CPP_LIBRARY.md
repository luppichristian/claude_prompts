# Setup C++ Library Project

**C++20 | CMake 3.19 | GoogleTest 1.14.0**

Naming: `lower_snake_case` for all identifiers, files, and directories.

## 1 - Configuration
Ask user for:
- Project name (if not inferrable from directory)
- Enable tests? Enable examples?
- GitHub repo URL
- `LICENSE.md` and `.clang-format` if missing

Create `.gitignore` with appropriate entries.

## 2 - Directory Structure
```
build/      # CMake build output
include/    # Public headers
src/        # Implementation
tests/      # GoogleTest files (if enabled)
examples/   # Example apps (if enabled)
```

## 3 - Stub Files
| File | Purpose |
|------|---------|
| `include/<name>.hpp` | Public API header |
| `src/<name>.cpp` | Implementation |
| `tests/test_<name>.cpp` | Unit tests |
| `examples/basic.cpp` | Usage example |

Requirements:
- Add LICENSE header to all files
- Use `#pragma once` in headers
- Create a test function returning a value; test it with GoogleTest; print it in example
- Include export macro in public header:

```cpp
#if defined(NAME_SHARED)
#  if defined(_WIN32) || defined(_WIN64)
#    define NAME_API __declspec(NAME_EXPORTS ? dllexport : dllimport)
#  elif __GNUC__ >= 4
#    define NAME_API __attribute__((visibility("default")))
#  else
#    define NAME_API
#  endif
#else
#  define NAME_API
#endif
```

## 4 - CMakeLists.txt

Options (only implement the ones necessary):
```cmake
option(PROJECTNAME_BUILD_SHARED "Build as a shared library" OFF)
option(PROJECTNAME_BUILD_TESTS "Build tests" ON)
option(PROJECTNAME_BUILD_EXAMPLES "Build examples" ON)
option(PROJECTNAME_GTEST_FETCH "Fetch GoogleTest if not found" ON)
```

Targets:
- `<name>` — main library (static by default)
- `<name>-tests` — test executable
- `<name>-<example>` — one per example file

Rules:
- Use `file(GLOB ...)` for sources
- `find_package(... QUIET)` then `FetchContent` as fallback
- `include/` as PUBLIC include directory

## 5 - Verify
Build and run all targets to confirm setup works.
