---
description: Reviews the current uncommitted diff for bugs, security issues, and AGENTS.md compliance.
agent: build
---

Dispatch the code-reviewer subagent against the current uncommitted diff.
Present its findings to the user verbatim, with file:line references.
Do not fix or edit anything yourself; the user decides what to change.