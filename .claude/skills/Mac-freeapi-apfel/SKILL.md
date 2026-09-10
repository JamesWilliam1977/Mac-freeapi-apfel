```markdown
# Mac-freeapi-apfel Development Patterns

> Auto-generated skill from repository analysis

## Overview

This skill teaches you how to contribute to the Mac-freeapi-apfel codebase, a Swift project that provides a free API compatible with OpenAI endpoints. You'll learn the project's coding conventions, commit patterns, and structured workflows for feature development, CLI extension, documentation, and testing. The repository emphasizes test-driven development (TDD), clear documentation, and robust integration testing.

## Coding Conventions

- **File Naming:**  
  Use PascalCase for Swift files (e.g., `TokenCounter.swift`, `BuildInfo.swift`).  
  Test files follow the pattern `*_test.py` for Python and `*Tests.swift` for Swift.

- **Import Style:**  
  Use relative imports in Swift:
  ```swift
  import Foundation
  import Core
  ```

- **Export Style:**  
  Use named exports in Swift:
  ```swift
  public struct TokenCounter { ... }
  ```

- **Commit Messages:**  
  Follow [Conventional Commits](https://www.conventionalcommits.org/) with prefixes like `fix:`, `feat:`, `docs:`, `test:`, `build:`.  
  Example:
  ```
  feat: add --dry-run flag to CLI and update CLIArguments parsing
  ```

## Workflows

### Feature Development (TDD Red-Green)
**Trigger:** When adding a new feature or fixing a bug with full test coverage  
**Command:** `/feature-tdd`

1. **Add failing (RED) tests** for the new feature or bugfix in test files (e.g., `Tests/apfelTests/RedTDDTests.swift`, `Tests/integration/test_tdd_red.py`).
   ```swift
   func testNewFeatureFails() {
       // Test should fail before implementation
       XCTAssertEqual(someFunction(), expectedValue)
   }
   ```
2. **Commit only the tests** (tests should fail).
3. **Implement the feature or bugfix** in relevant source files (e.g., `Sources/Core/*.swift`).
   ```swift
   public func someFunction() -> Int {
       // New implementation
       return 42
   }
   ```
4. **Update or add tests** to cover new/changed behavior.
5. **Commit the implementation and updated tests** (tests should now pass).
6. **Merge the feature branch** (squash or merge commit, referencing affected files).
7. **Release a new version** (bump `.version`, update `README.md`, `Sources/BuildInfo.swift`).

---

### CLI Flag or Command Addition
**Trigger:** When adding a new CLI flag or subcommand  
**Command:** `/add-cli-flag`

1. **Implement the new flag or subcommand** in `Sources/CLI.swift` and/or `Sources/CLI/CLIArguments.swift`.
   ```swift
   case "--dry-run":
       // handle dry-run logic
   ```
2. **Update parsing/validation logic** in `CLIArguments`.
3. **Add or update unit tests** in `Tests/apfelTests/CLIArgumentsTests.swift`.
   ```swift
   func testDryRunFlag() {
       // Assert correct CLI parsing
   }
   ```
4. **Update documentation**: `docs/cli-reference.md` and `man/apfel.1.in`.
5. **Optionally add integration tests** for the new CLI surface.
6. **Commit all related changes together**.

---

### Documentation and Release Update
**Trigger:** When releasing a new version or adding major features  
**Command:** `/release-docs-update`

1. **Update `.version`, `README.md`, and `Sources/BuildInfo.swift`** for the new release.
2. **Update `CLAUDE.md`** with current status (test counts, version).
3. **Update docs**: `docs/cli-reference.md`, `docs/openai-api-compatibility.md`, and `man/apfel.1.in`.
4. **Add or update feature-specific guides** (e.g., `docs/apfel-tag.md`, `docs/vscode-copilot.md`).
5. **Commit all documentation and metadata changes**.

---

### Integration Test Suite Expansion
**Trigger:** When a new feature or CLI command needs end-to-end validation  
**Command:** `/add-integration-tests`

1. **Write new integration test scripts** in `Tests/integration/*.py` for the feature or CLI command.
   ```python
   def test_cli_dry_run():
       # Simulate CLI call and check output
   ```
2. **Include various input/output cases**, including edge and error cases.
3. **Update `README.md` and/or feature docs** with usage examples and test coverage.
4. **Commit the new tests and documentation together**.

## Testing Patterns

- **Unit Tests:**  
  Swift unit tests are placed in `Tests/apfelTests/*.swift`, using `XCTestCase` conventions.
  ```swift
  import XCTest
  class TokenCounterTests: XCTestCase {
      func testCountTokens() {
          XCTAssertEqual(TokenCounter.count("hello world"), 2)
      }
  }
  ```

- **Integration Tests:**  
  Python scripts in `Tests/integration/*.py` test CLI and API surfaces end-to-end.
  ```python
  def test_api_response():
      # Call CLI, capture output, assert correctness
  ```

- **TDD Workflow:**  
  New features/bugs start with failing tests, then implementation, then passing tests.

## Commands

| Command                | Purpose                                                      |
|------------------------|--------------------------------------------------------------|
| /feature-tdd           | Start TDD workflow for new feature or bugfix                 |
| /add-cli-flag          | Add a new CLI flag or subcommand with tests and docs         |
| /release-docs-update   | Update documentation and release metadata after new features  |
| /add-integration-tests | Add or expand integration test suites for new features/CLI    |
```
