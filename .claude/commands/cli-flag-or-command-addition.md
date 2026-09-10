---
name: cli-flag-or-command-addition
description: Workflow command scaffold for cli-flag-or-command-addition in Mac-freeapi-apfel.
allowed_tools: ["Bash", "Read", "Write", "Grep", "Glob"]
---

# /cli-flag-or-command-addition

Use this workflow when working on **cli-flag-or-command-addition** in `Mac-freeapi-apfel`.

## Goal

Adds a new CLI flag or subcommand, including implementation, tests, documentation, and man page updates.

## Common Files

- `Sources/CLI.swift`
- `Sources/CLI/CLIArguments.swift`
- `Tests/apfelTests/CLIArgumentsTests.swift`
- `docs/cli-reference.md`
- `man/apfel.1.in`

## Suggested Sequence

1. Understand the current state and failure mode before editing.
2. Make the smallest coherent change that satisfies the workflow goal.
3. Run the most relevant verification for touched files.
4. Summarize what changed and what still needs review.

## Typical Commit Signals

- Implement the new flag or subcommand in Sources/CLI.swift and/or Sources/CLI/CLIArguments.swift.
- Update or add parsing/validation logic in CLIArguments.
- Add or update unit tests in Tests/apfelTests/CLIArgumentsTests.swift.
- Update documentation: docs/cli-reference.md and man/apfel.1.in.
- Optionally, add integration tests for the new CLI surface.

## Notes

- Treat this as a scaffold, not a hard-coded script.
- Update the command if the workflow evolves materially.