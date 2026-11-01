---
name: code-write
description: >-
  Use this skill when asked to write, implement, or refactor code, modules, or tests.
  Enforces KISS, language selection (Python/Go over fragile Bash), file size limits (<300 lines),
  and pragmatic "Core 3" testing without mock overkill.
---

# Code Write Skill

This skill enforces clean, maintainable, and pragmatic software engineering standards for all authored code.

---

## 1. Tool & Language Selection (No Fragile Bash)

* **Bash is ONLY for**:
  - Simple package installation (`apt install ...`).
  - CLI execution and process dispatching.
  - Very short glue scripts under 15 lines.
* **Use Python or Go for**:
  - Any task that parses JSON, YAML, XML, or CSV.
  - Any logic with loops, conditionals, math, or regex text transformation.
  - Any code that needs unit tests, error recovery, or cross-environment stability.
* **Golden Rule**: If a shell script requires `awk`, `sed -i`, or nested pipes, **stop and write a Python (or Go) script instead**.

---

## 2. File & Function Sizing (Anti-Bloat)

* **Target File Size (< 250–300 lines)**:
  - Do not create sprawling monster files.
  - If a file starts managing data models, business logic, AND network/CLI handling, split it into separate modules by concern.
* **Function Sizing (< 30 lines)**:
  - Each function must do one thing well with explicit inputs and outputs.
  - If a function has 4+ levels of nesting or several distinct phases, decompose it into private helper functions.

---

## 3. Simplicity & Design (KISS & YAGNI)

* **You Aren't Gonna Need It (YAGNI)**:
  - Do not create abstract factories, generic wrapper classes, or speculative interfaces for single-use components.
  - Write the direct, readable solution first. Refactor to abstractions only when a 3rd distinct caller emerges.
* **Fail Fast & Loud**:
  - Never swallow exceptions with empty handlers (`except Exception: pass`).
  - Validate preconditions and configuration at the top of functions/entrypoints.
* **Preserve Integrity**:
  - Never strip out existing comments, docstrings, or types unless specifically requested.

---

## 4. Pragmatic Testing: "The Core 3"

Do not write 200 lines of brittle, over-mocked boilerplate. For every new feature or bug fix, write concise tests that cover **The Core 3**:

1. **Happy Path**: Standard valid input produces the expected output.
2. **Boundary / Edge Case**: Handles empty input (`[]`, `""`), `None`/`nil`, or zero/negative values gracefully.
3. **Expected Failure**: Raises or returns the documented error when supplied invalid inputs.

> [!IMPORTANT]
> **No Mock Overkill**: Never mock standard library data structures or internal pure functions. Only mock or stub external network calls (HTTP/APIs), slow database connections, or external processes.
