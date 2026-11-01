---
name: plan-create
description: >-
  Use this skill when asked to create, draft, outline, or architect an implementation plan
  for a coding task, new feature, bug fix, or refactor.
---

# Plan Create Skill

This skill guides the creation of minimal, practical, and test-driven implementation plans.

## Guidelines
- Keep plans focused and actionable (typically 3–6 discrete steps).
- Every step MUST include an explicit **Verification Step** (e.g., unit test command, curl, CLI run).
- Save the plan in the project's internal directory at `./ai/plan.md` (or present as an artifact).

## Standard Plan Format (`./ai/plan.md`)

When authoring a plan, use this markdown structure:

```markdown
# Plan: <Feature / Task Title>

## 1. Objective
Clear 1-2 sentence statement of what this plan delivers.

## 2. Approach & Architecture
Brief summary of the technical strategy, affected files, and dependencies.

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
- [ ] All new and existing tests pass.
- [ ] Edge cases handled.
- [ ] User documentation or summary provided.
```

## Next Steps
After writing the plan, invite the user to either:
1. Audit and stress-test the plan with `plan-review`.
2. Directly approve and execute the plan with `plan-execute`.
