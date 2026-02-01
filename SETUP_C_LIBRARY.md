# Setup a new project for a C library

C Standard: 11

Build System: CMake 3.19

Testing Framework: Googletest 1.14.0 C++ 20

All file names, function types, data types, variable types, directory names should be lower_snake_case.

Follow the next steps and properly setup the project:

## 1 - Configuration

Ask the user some **configuration** info: 
- Name of the project (if you cant figure it from directory name)
- If unit testing should be setup
- If examples should be setup
- Github repository link
- Ask the user to setup a `LICENSE.md` if its not present
- Ask the user if they have a `.clang-format` to setup
- Create a `.gitignore` file with the extension you deem necessary

## 2 - Directory setup

Create **directories** if they dont exist:
- `build/` Build directory for CMake
- `include/` Public headers for library users
- `src/` Implementation of the library
- `tests/` Test files using the testing framework (if enabled)
- `examples/` Example applications that use the library  (if enabled)

## 3 - Stub files

Create these **files** if they dont exist:
- `include/[project_name].h` Test header library
- `src/[project_name].c` Test source library
- `tests/[project_name]_tests.cpp` Test 
- `examples/test_example.c` Example file

For testing purposes:
- In the library create a test function that returns a value.
- Create a google test that checks the returned value.
- In the example just print the value calling the library function.

In the library header define something like this and use it in the test function:
```
#if defined(PROJECTNAME_SHARED)
#  if defined(_WIN32) || defined(_WIN64)
#    if defined(PROJECTNAME_EXPORTS)
#      define PROJECTNAME_API __declspec(dllexport)
#    else
#      define PROJECTNAME_API __declspec(dllimport)
#    endif
#  elif defined(__GNUC__) && __GNUC__ >= 4
#    define PROJECTNAME_API __attribute__((visibility("default")))
#  else
#    define PROJECTNAME_API
#  endif
#else
#  define PROJECTNAME_API
#endif
```

The defines should later be defined by CMake.

Each file should have the LICENSE embedded at the top.
Each header should have `#pragma once`

## 4 - Build system

Create `CMakelists.txt` following the next instructions.

Setup **options** for the build step:
```
option(PROJECTNAME_BUILD_SHARED "Build as a shared library" OFF)
option(PROJECTNAME_BUILD_TESTS "Build tests" ON)
option(PROJECTNAME_BUILD_EXAMPLES "Build examples" ON)
option(PROJECTNAME_GTEST_FETCH "Fetch GoogleTest if not found" ON)
```

For each **third party** library:
- Attempt to find the target (`find_package(QUIET)`)
- If not found use fetchcontent to get the library only if the related option is ON

Cmake should setup the following **targets**:
- `project_name` or (`project_name-static`) for the main library
- `project_name-tests` create one target google tests
- `project_name-example-name` create a target for each file in the examples directory 

Source **code** files for each target should be fetched using wildcards, never hardcode files.

`include/` should be setup as a `PUBLIC` include directory in the library target.

## 5 - Testing

- Ensure everything is implemented correctly.
- Make sure all `project_name` names are replaced with the actual library name.
- Run and configure cmake.
- Build all targets.