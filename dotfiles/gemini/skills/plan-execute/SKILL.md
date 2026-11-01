---
name: plan-execute
description: >-
  Use this skill to execute an approved plan (root plan or specific sub-plan), enforcing
  North Star alignment, respecting Guardrails/No-Gos, recording decision changes, and handling multi-agent coordination.
---

# Plan Execute Skill

This skill handles the sequential, test-verified execution of an approved plan.

## Execution Protocol

1. **Target Identification**:
   - For single-file plans: Load `./ai/plan.md`.
   - For sub-plans: Load the assigned `./ai/plans/PLAN-XXX_<title>.md` and edit only its target files.

2. **Pre-Step Guardrail Verification**:
   - Before writing or editing any code, verify the change does NOT violate any stated **No-Gos**.
   - If a step cannot be completed without violating a No-Go, **STOP immediately** and alert the user.

3. **Step Implementation Loop**:
   - **Implement**: Make only the minimal code changes needed for the current step.
   - **Verify**: Immediately run the step's designated verification test command.
   - **Check Off**: Mark completed (`- [x]`) in the plan file only when the test passes.
   - **Diagnose**: If a test fails, troubleshoot and fix within the step. Never skip ahead.

4. **Recording Mid-Course Decisions & Changes**:
   - If an unexpected technical tradeoff, API pivot, or scope change occurs during execution, **record it immediately** in the plan under `## Decision Log & Changes`:
     ```markdown
     - **[YYYY-MM-DD]**: <What was decided, why, and how the checklist was adjusted>
     ```

5. **Completion & Acceptance**:
   - Run the full acceptance tests.
   - If working on a sub-plan, update its status to `DONE` and mark it in the parent `./ai/plan.md` registry.
