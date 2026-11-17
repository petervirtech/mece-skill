# MECE Decomposition Skill

A reusable OpenCode skill to decompose problems, analyses, product
features, and requirements into **mutually exclusive** and **collectively
exhaustive** (MECE) structures, including actionable user stories.

MECE is a structured problem-solving principle widely used in strategy
consulting (McKinsey, Barbara Minto) and product management.  It ensures
that categories do not overlap (mutually exclusive) and that the
categories together cover the full scope (collectively exhaustive).

## Installation

### Global installation (available in every project)

```bash
# Clone or symlink this repository into your global skills directory
ln -s /path/to/mece-skill ~/.config/opencode/skills/mece
```

### Project installation (available in this project only)

```bash
# Copy or symlink into the project
cp -r .opencode/skills/mece ./.opencode/skills/mece
```

The skill will be auto-discovered by OpenCode on next restart.

### Cross-platform compatibility

This skill follows the [Agent Skills](https://agentskills.io) open
standard, so it also works in:

- Claude Code
- Cursor
- VS Code (with appropriate extensions)
- Gemini CLI
- OpenAI Codex

## Usage

Ask the agent to apply MECE decomposition:

> Break down the problem "user onboarding takes too long" using MECE.
> Name assumptions, check for overlaps, and make the result actionable.

> Translate this feature into a MECE set of user stories with
> Given/When/Then acceptance criteria, covering happy paths, error
> paths, and edge cases.

> I need to structure the root-cause analysis for rising churn.  Use
> MECE.

## Example triggers

| Prompt snippet | What the skill does |
|----------------|---------------------|
| "Break down X using MECE" | Creates a problem tree with the five splitting lenses |
| "Translate this feature to user stories" | Creates MECE user stories with Given/When/Then criteria |
| "Structure the backlog for X" | Creates a prioritized, non-overlapping backlog |
| "Root-cause analysis for X" | Builds an issue tree with MECE-checked branches |
| "Validate this structure for gaps or overlaps" | Runs the MECE quality checklist |

## License

Apache License 2.0 — see [LICENSE](../../LICENSE).
