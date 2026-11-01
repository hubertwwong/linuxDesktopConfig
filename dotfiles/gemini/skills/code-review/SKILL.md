---
name: code-review
description: >-
  Use this skill to review, audit, critique, or inspect written code, git diffs, or PRs.
  Checks for file/function bloat, over-mocked tests, fragile bash usage, edge case gaps, and over-engineering.
---

# Code Review Skill

This skill performs a fast, pragmatic code review focused on real-world maintainability, avoiding over-engineering while enforcing quality standards.

---

## The 5-Point Smell Test

Audit code against these 5 checks:

### 1. Language & Tooling Audit (Bash Misuse)
- Is bash being used for tasks requiring data parsing (JSON/YAML), string manipulation, or complex loops?
- *Flag*: Shell scripts > 15 lines or scripts using `sed`/`awk`/regex pipes that should be clean Python or Go scripts.

### 2. Bloat & File Sizing Check
- Are any files exceeding **250–300 lines**?
- Does a single file violate Single Responsibility (e.g. mixing I/O, business rules, and UI/CLI)?
- Are functions exceeding **30 lines** or deeply nested (>3 levels of indentation)?

### 3. Testing Pragmatism ("The Core 3")
- Are tests testing **observable behavior**, or are they testing internal implementation details?
- Does test coverage verify:
  1. The **happy path**?
  2. The **obvious boundary** (empty collections, zero, null)?
  3. The **expected failure** mode?
- *Flag*: Mock overkill (excessive mocking of internal classes/stdlib instead of testing actual input/output).

### 4. KISS & Over-Engineering
- Are there unnecessary abstraction layers (factories, unused interfaces, speculative generic types)?
- Could this module be simplified into fewer lines without losing clarity?

### 5. Error Handling & Resource Safety
- Are exceptions silently caught or ignored?
- Are resources (file descriptors, sockets, database handles) properly cleaned up with context managers (`with` / `defer`)?

---

## Output Review Report

Deliver reviews using this structured markdown format:

```markdown
# Code Review Summary

## 1. Verdict
- `CLEAN`: Ready to merge/proceed.
- `APPROVED WITH SUGGESTIONS`: Small improvements recommended; safe to proceed.
- `CHANGES REQUESTED`: Blocker bugs, file bloat, fragile bash, or broken tests.

## 2. Findings & Smell Test
- 🗂️ **File Sizing & Structure**: <Assessment of file/function lengths>
- ⚙️ **Language & Tooling**: <Check for proper use of Python/Go vs Bash>
- 🧪 **Testing Pragmatism**: <Assessment of Core 3 coverage and mock cleanliness>
- 🛡️ **Reliability & Errors**: <Assessment of error handling and resource safety>

## 3. Concrete Recommendations & Diffs
<Exact line-by-line or diff suggestions to simplify and fix issues>
```
