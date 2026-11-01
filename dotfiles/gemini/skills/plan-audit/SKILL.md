---
name: plan-audit
description: >-
  Use this skill to audit, review, critique, stress-test, or find edge cases and testing gaps
  in an existing implementation plan (root plan or sub-plans). Audits North Stars, guardrail/no-go
  violations, decision logs, stage gates, and multi-agent file decoupling.
---

# Plan Audit Skill

This skill systematically audits implementation plans to catch flaws, unneeded complexity, and boundary violations before code is written.

## Audit Dimensions

1. **Complexity & Proportionality Check**:
   - Is the plan over-engineered? 
   - Could this be a simple single `./ai/plan.md` instead of multiple sub-plans?
   - Are there unnecessary abstraction layers?

2. **North Star & Guardrails Audit**:
   - Is the North Star measurable and unambiguous?
   - Are the "No-Gos" realistic, explicitly stated, and enforceable?
   - Do any planned steps violate the stated No-Gos?

3. **Verification Rigor & Edge Cases**:
   - Does every single checklist step contain a concrete, executable verification test?
   - How are failure modes, error returns, or invalid inputs handled?

4. **Multi-Agent Decoupling (If Multi-Plan)**:
   - Do target files overlap between concurrent agents?
   - Are stage gates logical before advancing to dependent work?

5. **Decision Log Completeness**:
   - Are initial architectural choices and user preferences documented in `## Decision Log & Changes`?

---

## Output Audit Report Format

Deliver a structured audit report:

- **Verdict**: `APPROVED` | `APPROVED WITH MINOR EDITS` | `REVISION NEEDED`
- **Complexity Assessment**: Confirmation that plan is minimal and proportionate.
- **Guardrail Compliance**: Confirmation that all No-Gos are respected.
- **Recommended Updates**: Specific edits to apply to the plan.
- **Decision Entry**: Log the audit outcome and approved modifications into the plan's `## Decision Log & Changes`.
