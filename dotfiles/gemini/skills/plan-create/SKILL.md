---
name: plan-create
description: >-
  Use this skill when asked to create, draft, outline, or architect an implementation plan
  for a task, feature, or refactor. Supports North Stars, Guardrails/No-Gos, decision logging,
  and scalable complexity (single minimal plan by default, staged sub-plans for complex work).
---

# Plan Create Skill

This skill creates practical, test-driven implementation plans. It scales to the task: minimal by default, expanding to staged sub-plans only when complexity demands it.

## Guiding Principles

1. **Default to Simplicity (KISS)**:
   - **90% of tasks need only a single `./ai/plan.md`**.
   - Do NOT create sub-plans or extra files unless the task has multiple independent phases or different agents need to work in parallel.
2. **North Star & Guardrails (No-Gos)**:
   - **North Star**: The single defining outcome that represents success.
   - **No-Gos**: Hard boundaries of what NOT to do (e.g., forbidden dependencies, breaking changes, scope bloat).
3. **Living Decision Log**:
   - Record design choices, tradeoffs, and user pivots directly in the plan under `## Decision Log & Changes`.

---

## Plan Formats

### Format 1: Standard Plan (Default for Most Tasks)
Single file at `./ai/plan.md`:

```markdown
# Plan: <Task / Feature Title>

## 1. North Star & Objective
Clear statement of what this delivers and the primary success metric.

## 2. Guardrails & No-Gos (Non-Negotiable)
- 🚫 **No-Go 1**: <e.g., Do not alter existing database schemas>
- 🚫 **No-Go 2**: <e.g., Do not introduce external dependencies>
- 🛡️ **Guardrail**: <e.g., All existing unit tests must remain green>

## 3. Implementation Checklist
- [ ] **Step 1: <Short description>**
  - Target files: `path/to/file`
  - Action: <What to change or add>
  - Verification: `<exact command or test to verify this step>`
- [ ] **Step 2: <Short description>**
  - Target files: `path/to/file`
  - Action: <What to change or add>
  - Verification: `<exact command or test to verify this step>`

## 4. Acceptance Criteria
- [ ] All step verification tests pass.
- [ ] No guardrails or no-gos violated.

## 5. Decision Log & Changes
- **[YYYY-MM-DD]**: Initial plan created.
<!-- Append future decisions, adjustments, or pivots here -->
```

---

### Format 2: Staged Multi-Plan (Only for Large / Multi-Agent Initiatives)
Use only when multiple independent agents or discrete sequential stages are required:

- **Root Plan (`./ai/plan.md`)**:
  Defines overall North Star, No-Gos, Stage Gates, and a registry table pointing to sub-plans (`./ai/plans/PLAN-XXX_<title>.md`).
- **Sub-Plans (`./ai/plans/PLAN-XXX_<title>.md`)**:
  Self-contained work packages with isolated target files, assigned to specific agents (`agent-backend`, `agent-ui`, etc.).
- **Decision Log**:
  Maintained in the root plan for global decisions, and in the sub-plan for local architectural choices.

---

## Next Steps
- Audit guardrails and simplicity with `plan-audit`.
- Execute sequentially with `plan-execute`.
