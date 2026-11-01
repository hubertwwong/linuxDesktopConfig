---
name: plan-review
description: >-
  Use this skill to review, audit, critique, stress-test, or find edge cases and testing gaps
  in an existing implementation plan (such as ./ai/plan.md) before execution.
---

# Plan Review Skill

This skill systematically inspects an existing implementation plan to identify oversights, risks, and verification gaps before writing code.

## Review Procedure

1. **Read Active Plan**:
   Read `./ai/plan.md` (or the specified plan file / artifact).

2. **Evaluate Against 5 Quality Criteria**:
   - **Completeness**: Are all requirements covered? Are there unstated assumptions?
   - **Feasibility & Simplicity**: Is the architecture minimal and KISS? Can it be simplified?
   - **Order of Execution**: Are file dependencies and setup steps sequenced correctly?
   - **Verification Rigor**: Does every single step have a concrete, executable verification test?
   - **Edge Cases & Failure Modes**: How does it behave on errors, missing configs, or invalid inputs?

3. **Output Review Verdict**:
   Deliver a crisp review with:
   - **Verdict**:
     - `APPROVED`: Ready for execution with no blockers.
     - `APPROVED WITH MINOR EDITS`: Small adjustments suggested; can proceed.
     - `REVISION NEEDED`: Critical gaps or missing verification steps must be resolved first.
   - **Identified Gaps / Risks**: Bullet points of specific issues or edge cases found.
   - **Suggested Improvements**: Exact adjustments to update in `./ai/plan.md`.

4. **Update Plan**:
   If the user agrees with the recommendations, update `./ai/plan.md` so it is primed for `plan-execute`.
