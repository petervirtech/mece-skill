# MECE Decomposition Skill

A reusable Agent Skills-compliant skill to decompose problems,
analyses, product features, and requirements into **mutually
exclusive** and **collectively exhaustive** (MECE) structures,
including actionable user stories.

MECE is a structured problem-solving principle widely used in strategy
consulting (McKinsey, Barbara Minto) and product management.  It
ensures that categories do not overlap (mutually exclusive) and that
the categories together cover the full scope (collectively exhaustive).

## Features

- **Five splitting lenses** — formula, process, components,
  stakeholders, opposites — with examples.
- **End-to-end workflow** — clarify, decompose, check, act, surface
  uncertainty.
- **Feature → user stories** — full Given/When/Then acceptance
  criteria, covering happy paths, error paths, and edge cases.
- **MECE quality checklist** — runnable before every delivery.
- **Language-agnostic** — works in any language; the skill content is
  English but any language of interaction is supported.

## Installation

### Globally (available in every project)

```bash
# After cloning this repository:
ln -s /path/to/mece-skill ~/.config/opencode/skills/mece
```

### Per-project (only in one project)

```bash
cp -r /path/to/mece-skill/.opencode/skills/mece ./.opencode/skills/mece
```

### Via opencode.jsonc

Add this repository (local or remote) to your skills list:

```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "skills": [
    "/path/to/mece-skill"
  ]
}
```

Or as an HTTP catalog:

```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "skills": [
    "https://raw.githubusercontent.com/petervirtech/mece-skill/main/.opencode/skills/"
  ]
}
```

### Verify installation

Restart OpenCode (or your agent).  The skill should appear in the
available skills list with:

- **ID:** `mece`
- **Name:** MECE decomposition
- **Description:** "Decompose problems, analyses, product features,
  and requirements into mutually exclusive and collectively exhaustive
  (MECE) structures …"

## Usage

Ask the agent to apply MECE decomposition:

> Break down the problem "user onboarding takes too long" using MECE.
> Name assumptions, check for overlaps, and make the result actionable.

> Translate this feature into a MECE set of user stories with
> Given/When/Then acceptance criteria, covering happy paths, error
> paths, and edge cases.

> I need to structure the root-cause analysis for rising churn.  Use
> MECE.

> Validate this backlog structure for gaps or overlaps.

## Example triggers

| Prompt snippet | What the skill does |
|----------------|---------------------|
| "Break down X using MECE" | Creates a problem tree with the five splitting lenses |
| "Translate this feature to user stories" | Creates MECE user stories with Given/When/Then criteria |
| "Structure the backlog for X" | Creates a prioritised, non-overlapping backlog |
| "Root-cause analysis for X" | Builds an issue tree with MECE-checked branches |
| "Validate this structure for gaps or overlaps" | Runs the MECE quality checklist |
| "Create a product roadmap for X" | Decomposes features MECE-style with priorities |

## Cross-platform compatibility

This skill follows the [Agent Skills](https://agentskills.io) open
standard, so it works in:

- OpenCode
- Claude Code
- Cursor
- VS Code (with GitHub Copilot)
- Gemini CLI
- OpenAI Codex
- Goose (Block)
- Amp, Factory, Letta

## Directory structure

```
mece-skill/
├── .opencode/
│   └── skills/
│       └── mece/
│           └── SKILL.md          ← required: metadata + instructions
├── index.json                    ← optional: HTTP catalog manifest
├── install.sh                    ← optional: one-line installer
├── README.md
└── LICENSE
```

## License

Apache License 2.0 — see [LICENSE](LICENSE).
