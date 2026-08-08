---
name: feature-development-tdd-red-green
description: Workflow command scaffold for feature-development-tdd-red-green in Mac-freeapi-apfel.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /feature-development-tdd-red-green

Use this workflow when working on **feature-development-tdd-red-green** in `Mac-freeapi-apfel`.

## Goal

Implements new features or bugfixes using a TDD workflow: first adding failing tests (RED), then implementing the fix/feature to make them pass (GREEN), followed by merging and release.

## Common Files

- `Tests/apfelTests/RedTDDTests.swift`
- `Tests/integration/test_tdd_red.py`
- `Sources/Core/*.swift`
- `Sources/CLI/*.swift`
- `Sources/Handlers.swift`
- `Sources/Session.swift`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Add failing (RED) unit/integration tests for each open ticket in test files (e.g., Tests/apfelTests/RedTDDTests.swift, Tests/integration/test_tdd_red.py).
- Commit only the tests, ensuring no source changes (tests fail).
- Implement the feature or bugfix in source files (e.g., Sources/Core/*.swift, Sources/CLI/*.swift, Sources/Handlers.swift, etc.).
- Update or add corresponding tests to cover the new/changed behavior.
- Commit the implementation and updated tests (tests now pass).

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.