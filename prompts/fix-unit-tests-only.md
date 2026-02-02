# Fix Unit Tests (Test Code Only)

Execute the test suite and fix failing tests by modifying ONLY the test code following these guidelines:

**CRITICAL CONSTRAINT: You are NOT allowed to modify any non-test source code. Only edit files in the tests/ directory.**

## Step 1: Run Tests
1. **Build the project** if not already built (e.g., `cmake --build build`)
2. **Run tests using CTest**: `ctest --test-dir build --output-on-failure`
3. **Analyze the output**: Identify all failing tests and the reasons for failure

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
# Build project
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

## Remember
You can ONLY modify test files. If the source code has bugs or missing features, document them but do not fix them. Your job is to make test code correct, not to fix the implementation.
