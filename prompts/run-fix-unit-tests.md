# Run and Fix Unit Tests

Execute the test suite and fix all failing tests following these guidelines:

**IMPORTANT: You ARE allowed to modify non-test source code to fix bugs and add missing edge case handling.**

## Step 1: Run Tests
1. **Build the project** if not already built (e.g., `cmake --build build`)
2. **Run tests using CTest**: `ctest --test-dir build --output-on-failure`
3. **Analyze the output**: Identify all failing tests and the reasons for failure

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
