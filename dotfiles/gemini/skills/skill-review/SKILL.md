---
name: skill-review
description: >-
  Use this skill to review, audit, critique, or optimize an existing Antigravity skill.
  Checks frontmatter triggers, progressive disclosure, token efficiency, and script safety.
---

# Skill Review Skill

This skill systematically audits Antigravity skills to ensure high trigger accuracy, context efficiency, and actionable procedures.

---

## The 4-Dimension Skill Audit

### 1. Trigger & Frontmatter Precision
- **Third-Person Phrasing**: Is `description` phrased in third-person (*"Use this skill when..."*)?
- **Trigger Boundaries**: Does it clearly define the scenario when the skill should activate?
- **False-Positive Risk**: Is the description specific enough that it won't activate inappropriately on generic prompts?

### 2. Progressive Disclosure & Token Efficiency
- **File Length**: Is `SKILL.md` under **150 lines**?
- **Subdirectory Separation**: Are lengthy API docs, tables, or guides factored out into `references/`?
- **Lean Context**: Does loading the skill introduce only the essential runbook without token bloat?

### 3. Actionability & Verification Rigor
- **Concrete Steps**: Are instructions explicit, numbered, and actionable?
- **Verification Commands**: Does each milestone or procedure include how the agent should verify success?
- **No Fluff**: Does the skill avoid lecturing the model on general coding habits or things it already knows?

### 4. Helper Script Quality (`scripts/`)
- **Language Choice**: Are scripts written in Python or Go instead of fragile multi-pipe bash scripts?
- **Executable & Self-Contained**: Are scripts executable (`chmod +x`) with clear arguments and error exits?

---

## Output Review Report

Deliver reviews using this structured format:

```markdown
# Skill Review: <skill-name>

## 1. Verdict
- `APPROVED`: Ready to use with optimal discovery and structure.
- `APPROVED WITH MINOR EDITS`: Small adjustments suggested; functional.
- `REVISION NEEDED`: Trigger too broad/vague, file bloat, or missing verification steps.

## 2. Findings & Dimension Analysis
- 🎯 **Trigger Precision**: <Assessment of frontmatter name and description>
- 📦 **Progressive Disclosure**: <Check for file size and use of references/>
- 🧪 **Actionability & Verification**: <Assessment of concrete commands and verification checks>
- ⚙️ **Script Safety**: <Review of scripts/ directory tools, if present>

## 3. Concrete Recommendations & Diffs
<Exact line-by-line or diff suggestions to refine the skill>
```
