---
name: mece
description: >
  Decompose problems, analyses, product features, and requirements into
  mutually exclusive and collectively exhaustive (MECE) structures.
  Use when the user asks to break down a problem, structure an analysis,
  create an issue tree or logic tree, translate a feature into user
  stories, build a backlog, perform root-cause analysis, validate that
  categories do not overlap and cover the full scope, or create a
  prioritised product roadmap.
---

# MECE Decomposition

Apply the **Mutually Exclusive, Collectively Exhaustive** principle to
structure any problem, analysis, or set of requirements.

## Core rules

- **Mutually exclusive:** each item, case, or requirement belongs to
  exactly one category within the same decomposition level.
- **Collectively exhaustive:** the categories cover the agreed scope;
  explicit exceptions and assumptions make missing coverage visible.
- **One splitting logic per level.**  Do not mix dimensions (for
  example, user roles + process steps + technical components) in the
  same tier.
- **Depth only where needed.**  Stop decomposing a branch as soon as it
  is small enough to be acted on.  MECE does not mean every branch is
  equally large.

## Five splitting lenses (pick one per level)

Each lens is designed so that its branches are MECE by construction.

| Lens | When to use | Example |
|------|-------------|---------|
| **Formula / equation** | The problem has a mathematical, logical, or identity-based structure | Revenue = Price × Volume; Profit = Revenue − Costs |
| **Process / workflow** | The problem follows a sequence, lifecycle, or stage-gate | Discovery → Onboarding → Active Use → Retention → Churn |
| **Components / layers** | The problem can be split by structural or functional parts | Frontend / Backend / Database; Presentation / Business Logic / Data |
| **Stakeholders / personas** | The problem behaves differently for distinct user groups | New users vs. Existing users; Admin vs. Regular user |
| **Opposites / dichotomy** | A binary (or small finite) split captures the core tension | Fixed vs. Variable; Build vs. Buy vs. Borrow; Involuntary vs. Voluntary |

Choose the lens that maps most naturally to the domain.  State the
choice explicitly at the top of the output.

> **Tip:** If no single lens covers the problem at the top level,
> decompose the problem into two top-level branches (for example,
> "what" and "how", or "internal" and "external") and use different
> lenses within each branch.

## Workflow

1. **Clarify the question.**  Restate the problem as a concrete,
   answerable question.  Record scope, target audience, time frame,
   and constraints.  Mark missing information as assumptions.

2. **Select the splitting lens.**  Pick one of the five lenses and
   justify why it fits the domain.  State the first-level categories
   (maximum 5).

3. **Build the tree.**  Decompose each first-level category only if it
   is large enough or uncertain enough to require further splitting.
   Give each node a short label and a one-sentence description.

4. **MECE check.**  For every node:
   - Could it belong to a sibling node?  (overlap → ME violation)
   - Is there a plausible case that fits in no sibling node?
     (gap → CE violation)
   - Are there edge cases, exceptions, negative flows, or
     dependencies that do not belong to any branch?
   Add missing nodes or narrow the scope; do not invent "Other" or
   "Miscellaneous" buckets to cover gaps.

5. **Make it actionable.**  Attach to every leaf node an action: a
   research question, decision, experiment, requirement, or task.
   List priorities and dependencies only when they follow from the
   domain context.

6. **Surface uncertainty.**  Separate facts, assumptions, open
   questions, and recommendations.  Ask at most the clarifications
   that would change the decomposition.

## Feature → user stories

When the input is a product feature, follow these additional steps
inside the relevant branches:

1. Frame the desired user outcome, target persona, and measurable
   result.
2. Split by user goals or capabilities — not by screens, endpoints,
   or technical tasks.
3. For each capability, verify scenario coverage: happy path,
   alternative inputs, validation / empty state, error / recovery
   paths, permissions, and relevant non-functional requirements.
4. Create one independent user story per scenario that delivers
   user value.  Add technical subtasks beneath the story.
5. Remove overlap by constraining each story to one unique user
   goal.  Add missing scenarios until the agreed scope is covered.
6. Write acceptance criteria as observable behaviour, preferably
   Given / When / Then format.  Link each criterion to exactly one
   story.

Use this output format for user stories:

```text
## [Capability name]
Goal: <what the user achieves>
Scope: <boundaries of this capability>

### US-01 — <unique user outcome>
As a <persona>, I want <action/goal>, so that <value>.

Acceptance criteria:
- Given ..., when ..., then ...
- Given ..., when ..., then ...

Dependencies: <list or none>
Open questions / assumptions: <list or none>
```

## Expected output

Adapt the format to the problem, but always include:

1. **Goal and scope** — restated question, boundaries, constraints.
2. **Chosen splitting lens** — name of the lens used and why.
3. **MECE structure** — numbered hierarchy with short labels and
   descriptions.  For large structures, use a table with columns:
   `ID`, `Node`, `Splitting criterion`, `Scope coverage`,
   `Priority`, `Next action`.  Present the structure before the
   commentary; never hide uncertainty behind confident language.
4. **MECE check** — identified overlaps, gaps, edge cases, and
   out-of-scope items.
5. **Actionable next step** — research, decision, experiment, or
   user-story / backlog entry.
6. **Assumptions and open questions.**

## Quality checklist (run before delivering)

- [ ] Can every item be assigned to exactly one category without
      interpretation?
- [ ] Is there a category for every item within the agreed scope?
- [ ] Is the splitting logic consistent at every level?
- [ ] Are overlaps, assumptions, exceptions, and out-of-scope items
      explicit?
- [ ] Are the smallest nodes concrete enough to research, decide,
      or build?
- [ ] Are user stories small enough to test and large enough to
      deliver user value?
