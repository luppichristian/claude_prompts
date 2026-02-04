# Run and Fix Unit Tests

Execute the test suite and fix all failing tests following these guidelines:

**IMPORTANT: You ARE allowed to modify non-test source code to fix bugs and add missing edge case handling.**

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
Group test failures by type:
- **Test implementation bugs**: Test code is incorrect
- **Source code bugs**: Implementation doesn't match expected behavior
- **Missing edge case handling**: Source code doesn't handle certain inputs
- **API mismatches**: Test expectations don't match actual API
- **Environment issues**: Missing dependencies, file paths, etc.

## Step 3: Fix Failures Systematically
Work through failures one at a time or by category:

### When to Edit Test Code
- Test has incorrect assertions or expectations
- Test setup/teardown is flawed
- Test is testing the wrong behavior
- Test has typos or logic errors

### When to Edit Source Code
**You ARE allowed to edit non-test source code when:**
- Implementation has clear bugs (crashes, wrong results, memory errors)
- Code doesn't handle documented edge cases (null pointers, empty inputs, boundary values)
- Code behavior contradicts its documentation or API contract
- Missing error handling for invalid inputs
- Logic errors that prevent correct functionality

### What NOT to Change
- Don't modify source code just to make poorly written tests pass
- Don't change intentional API design unless it's clearly wrong
- Don't remove tests - fix them instead

## Step 4: Verification Loop
After each fix:
1. **Rebuild**: Compile the changes
2. **Re-run tests**: `ctest --test-dir build --output-on-failure`
3. **Verify the specific test now passes**
4. **Ensure no regressions**: Check that previously passing tests still pass
5. **Repeat** until all tests pass

## Fix Strategy
1. **Start with easiest fixes**: Simple assertion corrections, typos
2. **Address compilation errors first**: Can't test if code doesn't build
3. **Fix crashes before logic errors**: Segfaults and exceptions take priority
4. **Handle edge cases**: Add missing null checks, bounds checking, etc.
5. **Verify logic**: Ensure implementations match specifications

## Documentation
For each fix, briefly note:
- Which test(s) failed
- Root cause of the failure
- What was changed (test code vs source code)
- Why the change was necessary

## Edge Case Handling
When fixing missing edge case support in source code, consider:
- **Null/nullptr inputs**: Return error or safe default
- **Empty containers**: Handle empty strings, arrays, lists
- **Boundary values**: MIN/MAX integers, zero, negative numbers
- **Invalid states**: Check preconditions and return errors
- **Resource failures**: Handle allocation failures, file I/O errors

## Final Verification
Before completing:
- All tests must pass: `ctest --test-dir build`
- No compilation warnings introduced
- Code changes are minimal and targeted
- Both test and source code follow project conventions

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
