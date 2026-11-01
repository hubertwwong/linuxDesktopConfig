---
name: plan-execute
description: >-
  Use this skill to execute, implement, and verify an approved plan step-by-step
  (such as ./ai/plan.md), running verification tests after each checklist item.
---

# Plan Execute Skill

This skill handles the sequential, test-verified execution of an approved implementation plan.

## Execution Rules

1. **Load Active Plan**:
   Read `./ai/plan.md` to identify remaining unchecked items (`- [ ]`).

2. **Step-by-Step Implementation Loop**:
   Work through the checklist sequentially:
   - **Implement**: Make only the minimal code changes required for the current step.
   - **Verify**: Immediately run the step's designated verification command (test suite, linter, CLI run).
   - **Check Off**: Only when verification succeeds, mark the step as completed (`- [x]`) in `./ai/plan.md`.
   - **Diagnose on Failure**: If verification fails, troubleshoot and fix immediately before proceeding. Never advance past a failing step.

3. **Check-Ins**:
   Briefly update the user as significant steps or milestones are completed.

4. **Final Acceptance**:
   - Run the complete project test suite and verify all acceptance criteria.
   - Provide a concise summary of the implemented changes and file links.
