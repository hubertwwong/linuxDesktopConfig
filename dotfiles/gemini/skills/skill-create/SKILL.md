---
name: skill-create
description: >-
  Use this skill when asked to create, author, scaffold, or design a new Antigravity skill or workflow.
  Enforces proper YAML frontmatter, progressive disclosure, and structured helper scripts.
---

# Skill Create Skill

This skill guides the authoring and scaffolding of clean, token-efficient Antigravity (AGY) skills.

---

## Skill Architecture

Every Antigravity skill must be a self-contained directory:

```text
skills/<skill-name>/
├── SKILL.md              # Required: Frontmatter + high-level runbook (<150 lines)
├── references/           # Optional: Bulky documentation, matrices, schemas
├── scripts/              # Optional: Executable Python/Go helper scripts
└── examples/             # Optional: Reference input/output templates
```

---

## Authoring Workflow

### 1. Identify Scope & Triggering Criteria
- What specific problem or workflow does this skill solve?
- Under what exact user prompts or scenarios should the agent activate it?

### 2. Author the Frontmatter (`SKILL.md`)
The frontmatter description is the **most critical field**—it drives progressive discovery:
- Use **third-person** (e.g., *"Use this skill when..."*).
- Clearly define **WHAT** it does and **WHEN** to activate it.
- Avoid vague keywords that could cause false positive activations on unrelated tasks.

```markdown
---
name: <lowercase-hyphenated-name>
description: >-
  Use this skill when <concrete trigger scenario>. Provides <specific outcome/deliverable>.
---
```

### 3. Apply Progressive Disclosure
- **Keep `SKILL.md` concise (< 100–150 lines)**: Focus on the high-level decision flow, required CLI commands, and step sequence.
- **Move Heavy Reference Material**: Put large tables, API schemas, or reference manuals into `references/<topic>.md` and link to them using relative markdown links.
- **Move Complex Logic**: Never write 30-line shell pipes in the skill. Put complex logic in `scripts/<helper>.py` or `scripts/<helper>.go`.

### 4. Provide Verifiable Steps
Every step in `SKILL.md` must include:
- The exact action or command.
- An explicit **Verification** check (e.g. log output, test assertion, exit code).

### 5. Deployment Location
- **Global (Machine-Wide)**: `~/.gemini/config/skills/<skill-name>/`
- **Workspace-Local (Project-Specific)**: `.agents/skills/<skill-name>/` inside the repository root.

---

## Next Steps
After writing the skill, audit it using **`skill-audit`** to verify trigger precision and token efficiency.
