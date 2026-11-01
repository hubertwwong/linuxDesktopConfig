---
name: plan-review
description: >-
  Use this skill to review, audit, critique, stress-test, or find edge cases and testing gaps
  in an existing implementation plan (root plan or sub-plans). Audits North Stars, guardrail/no-go
  violations, stage gates, and multi-agent file decoupling.
---

# Plan Review Skill

This skill systematically inspects implementation plans (root plans or modular sub-plans) to identify oversights, boundary violations, and verification gaps before writing code.

## Review Dimensions

1. **North Star & Guardrails Audit**:
   - Is the North Star measurable and unambiguous?
   - Are the "No-Gos" realistic, explicitly stated, and enforceable?
   - Do any planned steps violate the stated No-Gos or scope boundaries?

2. **Stage Progression & Dependency Logic**:
   - Are stages logically gated? (Can Stage 1 truly be finished independently?)
   - Are prerequisites clearly defined before dependent sub-plans start?

3. **Multi-Agent Decoupling & Collision Risk**:
   - For sub-plans assigned to different agents: Do their target files overlap?
   - Is each sub-plan self-contained with its own independent verification commands?

4. **Verification Rigor**:
   - Does every checklist step contain an explicit, concrete, executable test command?

---

## Output Verdict Format

Deliver a structured review report:

- **Verdict**:
  - `APPROVED`: Ready for execution with no blockers.
  - `APPROVED WITH MINOR EDITS`: Small adjustments suggested; safe to proceed.
  - `REVISION NEEDED`: Critical gaps, guardrail violations, or file collision risks.
- **Guardrail Compliance**: Confirmation that all No-Gos are respected.
- **Agent Decoupling & Stage Gate Analysis**: Evaluation of concurrency and file isolation.
- **Recommended Updates**: Specific edits to apply to `./ai/plan.md` or `./ai/plans/PLAN-XXX.md`.
