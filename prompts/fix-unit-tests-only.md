# Fix Unit Tests (Test Code Only)

Execute the test suite and fix failing tests by modifying ONLY the test code following these guidelines:

**CRITICAL CONSTRAINT: You are NOT allowed to modify any non-test source code. Only edit files in the tests/ directory.**

**CRITICAL: Always run the tests and carefully read all error messages and output. This is essential for diagnosing issues.**

## Preferred Method: Use VS Code Build & Test Features

**ALWAYS prefer using VS Code's integrated build and test features when available:**
- Use VS Code's build tasks (Terminal → Run Build Task or Ctrl+Shift+B)
- Use VS Code's Test Explorer to run tests
- These methods properly configure environment variables and paths (especially important with MSVC)

**Benefits:**
- Automatically sets up MSVC environment and include paths
- Avoids "cannot find includes" errors common with MSVC from raw command line
- Provides integrated error navigation and test result visualization

### MSVC Include Path Issues
When using MSVC on Windows, running CMake/CTest directly from PowerShell/Command Prompt often fails with:
- "cannot open include file" errors
- Missing system headers like `<stdio.h>`, `<windows.h>`, etc.
- Linker errors for standard libraries

**This happens because MSVC requires environment variables (INCLUDE, LIB, PATH) that are set by Visual Studio Developer Command Prompt or VS Code's CMake Tools extension.**

**If you encounter "cannot find includes" or similar MSVC errors:**
1. **Stop and ask the user to build and configure manually** using VS Code or Visual Studio Developer Command Prompt
2. Do not continue attempting raw `cmake` or `ctest` commands
3. Once the user confirms the build works, they can provide test output for you to analyze

## Step 1: Run Tests
1. **Build the project** if not already built:
   - **PREFERRED**: Use VS Code build task (Ctrl+Shift+B)
   - **ALTERNATIVE**: `cmake --build build` (may fail with MSVC)
2. **Run tests**:
   - **PREFERRED**: Use VS Code Test Explorer or Testing view
   - **ALTERNATIVE**: `ctest --test-dir build --output-on-failure`
3. **Analyze the output carefully**: Identify all failing tests and the reasons for failure
   - **Read every error message thoroughly**
   - **Note the specific assertions that failed**
   - **Identify patterns across multiple test failures**

## Step 2: Categorize Failures
Identify which failures can be fixed by modifying test code:
- **Incorrect assertions**: Test expectations don't match actual behavior
- **Test setup/teardown issues**: Improper initialization or cleanup
- **Wrong test inputs**: Test is using invalid or inappropriate test data
- **API misunderstandings**: Test is calling functions incorrectly
- **Timing issues**: Race conditions or timing assumptions in tests
- **Environment issues**: Test assumptions about file paths, dependencies

## Step 3: Fix Test Code Only
**Allowed modifications (test files only):**
- Correct assertions to match actual source code behavior
- Fix test setup and initialization
- Update test expectations to match documented API
- Fix incorrect function calls or parameter usage
- Adjust test data and inputs
- Fix memory management in test code
- Update mocks and stubs

**NOT allowed:**
- ❌ Do NOT modify any source code files (src/, lib/, include/, etc.)
- ❌ Do NOT change implementation code to make tests pass
- ❌ Do NOT add edge case handling to source code
- ❌ Do NOT fix bugs in the actual implementation

## Step 4: Handle Unfixable Tests
If a test fails due to actual source code bugs:
1. **Document the issue**: Note the test name and what's wrong with the source code
2. **Skip the test temporarily**: Add `DISABLED_` prefix or use test framework's skip mechanism
3. **Add a comment**: Explain why the test is disabled and what needs to be fixed
4. **Report at the end**: List all tests that couldn't be fixed and why

Example:
```cpp
// DISABLED: Source code doesn't handle null pointer - needs fix in parser.cpp
TEST(Parser, DISABLED_HandlesNullInput) {
    // Test code remains here for when source code is fixed
}
```

## Step 5: Verification Loop
After each fix:
1. **Rebuild**: Compile the changes
2. **Re-run tests**: `ctest --test-dir build --output-on-failure`
3. **Verify the specific test now passes**
4. **Ensure no regressions**: Check that previously passing tests still pass
5. **Repeat** until all fixable tests pass

## Documentation
For each action taken:
- **Fixed tests**: Which test and what was corrected in test code
- **Disabled tests**: Which test, why it was disabled, what source code bug exists
- **Unchanged failures**: Tests that still fail and require source code changes

## Final Summary
Provide:
- ✅ **Tests fixed**: Count and list of tests now passing
- ⚠️ **Tests disabled**: Count and list with reasons (source code bugs)
- ❌ **Tests still failing**: Any tests that couldn't be resolved

## Commands Reference
```bash
# PREFERRED: Use VS Code build tasks and Test Explorer instead of these commands

# Build project (may fail with MSVC due to missing environment variables)
cmake --build build

# Run all tests with verbose output
ctest --test-dir build --output-on-failure

# Run specific test
ctest --test-dir build -R TestName --output-on-failure

# Run tests in verbose mode
ctest --test-dir build -V

# Re-run only failed tests
ctest --test-dir build --rerun-failed --output-on-failure
```

## Troubleshooting MSVC Issues

**Symptom**: `fatal error C1083: Cannot open include file` or similar MSVC errors

**Cause**: Running from PowerShell/Command Prompt without MSVC environment variables

**Solution**:
1. Ask the user to build using VS Code (CMake Tools extension)
2. OR ask user to run from "Developer Command Prompt for VS"
3. Do not attempt to manually set environment variables
4. Wait for user to provide successful build or test output

## Remember
You can ONLY modify test files. If the source code has bugs or missing features, document them but do not fix them. Your job is to make test code correct, not to fix the implementation.
