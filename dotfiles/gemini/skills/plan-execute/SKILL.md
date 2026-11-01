---
name: plan-execute
description: >-
  Use this skill to execute an approved plan (root plan or specific sub-plan), enforcing
  North Star alignment, respecting Guardrails/No-Gos, and handling multi-agent coordination.
---

# Plan Execute Skill

This skill handles the sequential, test-verified execution of an approved plan (root plan or assigned sub-plan).

## Execution Protocol

1. **Target Identification**:
   - **Executing a Sub-Plan** (e.g., `./ai/plans/PLAN-001_xxx.md`): Execute only that sub-plan's checklist. Confine edits strictly to its designated target files.
   - **Executing a Root Plan** (`./ai/plan.md`): Work through stages sequentially, completing or delegating the registered sub-plans.

2. **Pre-Step Guardrail Verification**:
   - Before writing or editing any code, verify the action does NOT violate any stated **No-Gos**.
   - If a step cannot be completed without violating a No-Go, **STOP immediately** and alert the user.

3. **Step Implementation Loop**:
   - **Implement**: Make only the minimal code changes needed for the step.
   - **Verify**: Immediately run the step's designated verification test command.
   - **Check Off**: Mark completed (`- [x]`) in the plan file only when the test passes.
   - **Diagnose**: If a test fails, troubleshoot and fix within the step. Never skip ahead.

4. **Multi-Agent Coordination & Status Updates**:
   - Update sub-plan status: `IN_PROGRESS` ➔ `DONE`.
   - Update parent registry table in `./ai/plan.md` as stages/sub-plans complete.
   - Keep commit units aligned with completed sub-plans.
