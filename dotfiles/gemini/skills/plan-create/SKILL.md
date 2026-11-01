---
name: plan-create
description: >-
  Use this skill when asked to create, draft, outline, or architect an implementation plan
  for a task, feature, or refactor. Supports North Stars, Guardrails/No-Gos, staged execution,
  and root/sub-plan hierarchies for multi-agent workflows.
---

# Plan Create Skill

This skill guides the creation of resilient implementation plans featuring clear North Stars, explicit Guardrails (No-Gos), staged progression, and multi-agent sub-plan delegation.

## Core Concepts

1. **North Star**: The single defining outcome that represents success.
2. **Guardrails & No-Gos**: Non-negotiable boundaries of what NOT to do (e.g., forbidden dependencies, breaking existing public APIs, out-of-scope refactoring).
3. **Hierarchy**:
   - **Simple Tasks**: Single self-contained `./ai/plan.md`.
   - **Complex Tasks**: **Root Plan** (`./ai/plan.md`) linking to modular **Sub-Plans** (`./ai/plans/PLAN-XXX_<title>.md`).
4. **Agent Decoupling**: For multi-agent workflows, each sub-plan is assigned to a designated agent/role with isolated target files to prevent overlapping edits.

---

## Plan Formats

### Format A: Root Plan (`./ai/plan.md`)
Used for multi-stage initiatives or projects with sub-plans:

```markdown
# Root Plan: <Initiative Title>

## 1. North Star & Success Metric
What single outcome proves complete success?

## 2. Guardrails & No-Gos (Non-Negotiable)
- 🚫 **No-Go 1**: <e.g., Do not change existing public API contracts>
- 🚫 **No-Go 2**: <e.g., Do not introduce new heavy dependencies>
- 🛡️ **Guardrail**: <e.g., Maintain 100% backward compatibility for storage schemas>

## 3. Stages & Sub-Plan Registry
| Stage | Sub-Plan | Description | Assignee / Agent | Status |
| :--- | :--- | :--- | :--- | :--- |
| **Stage 1** | [PLAN-001](./plans/PLAN-001_data_layer.md) | Data models & migrations | `agent-data` | `READY` |
| **Stage 1** | [PLAN-002](./plans/PLAN-002_api_service.md) | Core API endpoints | `agent-backend` | `READY` |
| **Stage 2** | [PLAN-003](./plans/PLAN-003_frontend.md) | UI implementation | `agent-ui` | `BLOCKED` (depends on Stage 1) |

## 4. Stage Gate Verification
- Criteria required before advancing from Stage N to Stage N+1.
```

### Format B: Sub-Plan (`./ai/plans/PLAN-XXX_<title>.md`)
Self-contained work package designed for an individual agent or focused phase:

```markdown
# Sub-Plan: PLAN-XXX - <Title>
- **Parent Plan**: [Root Plan](../plan.md)
- **Assignee**: `<Agent Role or Self>`
- **Status**: `READY` | `IN_PROGRESS` | `DONE`

## North Star & Guardrails
- **Goal**: <Specific outcome for this sub-plan>
- **No-Gos**: <Specific boundaries relevant to this sub-plan>
- **Target Files**: <Explicit list of files this sub-plan owns>

## Implementation Checklist
- [ ] **Step 1: <Short description>**
  - Target files: `path/to/file`
  - Action: <What to change or add>
  - Verification: `<exact command or test to verify this step>`
- [ ] **Step 2: <Short description>**
  - Target files: `path/to/file`
  - Action: <What to change or add>
  - Verification: `<exact command or test to verify this step>`

## Acceptance Criteria
- [ ] All step verification tests pass.
- [ ] No guardrails or no-gos violated.
```

---

## Next Steps
After writing the plan:
1. Audit guardrails and agent decoupling with `plan-review`.
2. Execute target sub-plans or root stages with `plan-execute`.
