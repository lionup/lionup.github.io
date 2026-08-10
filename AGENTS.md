# AGENTS.md

This file is the Codex-facing adapter for this repository. It translates the project knowledge in [CLAUDE.md](/Users/ran.gu/git/lionup.github.io/CLAUDE.md) into a compact set of instructions for Codex without duplicating long narrative sections unnecessarily.

## Primary Sources

- Start with [CLAUDE.md](/Users/ran.gu/git/lionup.github.io/CLAUDE.md). It is the main maintained source of project knowledge: deploy workflow, file purposes, editing conventions, and Jekyll stack details.
- Use this `AGENTS.md` as the Codex operating layer: what to read first, where to edit, and how to treat project memory.
- Treat [PROGRESS_LOG.md](/Users/ran.gu/git/lionup.github.io/PROGRESS_LOG.md) as the historical progress and calibration log. Do not inline it here.

## When To Read PROGRESS_LOG.md

Read [PROGRESS_LOG.md](/Users/ran.gu/git/lionup.github.io/PROGRESS_LOG.md) when any of the following apply:

- You need context from older sessions that is not obvious from the current files.
- You need prior manuscript or site-history context, including why a section was merged, removed, or intentionally left as-is.
- You need calibration lessons from earlier maintenance work.
- You need provenance for an unresolved or ambiguous action, decision, or follow-up.

If the task is straightforward and fully covered by current files, you do not need to read `PROGRESS_LOG.md`.

## Project Map

- [index.md](/Users/ran.gu/git/lionup.github.io/index.md): homepage, bio, research interests, contact, quick links.
- [research/research.md](/Users/ran.gu/git/lionup.github.io/research/research.md): publications and current projects.
- [teaching.md](/Users/ran.gu/git/lionup.github.io/teaching.md): teaching history.
- [computing.md](/Users/ran.gu/git/lionup.github.io/computing.md): computing profile and links.
- [cv/cv.md](/Users/ran.gu/git/lionup.github.io/cv/cv.md): CV landing page.
- [cv/RanCV.pdf](/Users/ran.gu/git/lionup.github.io/cv/RanCV.pdf): current CV artifact to replace directly when needed.
- [_config.yml](/Users/ran.gu/git/lionup.github.io/_config.yml): site metadata, SEO description, announcement banner, social links, job title/institution.
- [_includes/](/Users/ran.gu/git/lionup.github.io/_includes): shared partials such as head, header, footer, nav, image.
- [_layouts/](/Users/ran.gu/git/lionup.github.io/_layouts): Jekyll page/layout templates.
- [_sass/](/Users/ran.gu/git/lionup.github.io/_sass): custom styles.
- [css/main.scss](/Users/ran.gu/git/lionup.github.io/css/main.scss): Sass entrypoint.
- [Gemfile](/Users/ran.gu/git/lionup.github.io/Gemfile) and [Gemfile.lock](/Users/ran.gu/git/lionup.github.io/Gemfile.lock): GitHub Pages/Jekyll dependency stack.
- [CLAUDE.md](/Users/ran.gu/git/lionup.github.io/CLAUDE.md): source project guidance.
- [PROGRESS_LOG.md](/Users/ran.gu/git/lionup.github.io/PROGRESS_LOG.md): historical session log and calibration record.

## Working Rules For Codex

- Preserve the existing site structure and tone; this is a small academic Jekyll site, not a redesign-heavy web app.
- Prefer minimal edits that fit the current conventions already documented in [CLAUDE.md](/Users/ran.gu/git/lionup.github.io/CLAUDE.md).
- Keep commented-out historical content unless the user explicitly asks to remove it.
- For content changes, edit the page directly rather than introducing unnecessary abstractions.
- For styling or template issues, check `_includes`, `_layouts`, and `_sass` before making broader changes.
- Preview/build locally with `bundle exec jekyll build` or `bundle exec jekyll serve` when verification is needed.

## Memory Handling

- Do not assume Claude local memory transfers to Codex automatically.
- Durable, must-follow project knowledge should live in [CLAUDE.md](/Users/ran.gu/git/lionup.github.io/CLAUDE.md), this [AGENTS.md](/Users/ran.gu/git/lionup.github.io/AGENTS.md), or skill reference files if project-specific skills are later added.
- Keep transient session history, decision trails, and calibration notes in [PROGRESS_LOG.md](/Users/ran.gu/git/lionup.github.io/PROGRESS_LOG.md), not in Codex memory.
- In this repository, no project-local Claude skills, Claude agents, or Claude memory stores were found beyond `CLAUDE.md` and `.claude/settings.local.json`.

## Claude Compatibility Notes

- `.claude/settings.local.json` is a local Claude configuration file and should remain local-only.
- No `.claude/skills/` directory exists in this repository at present.
- No `.claude/agents/` directory exists in this repository at present.
- If those are added later, migrate reusable project knowledge into `.agents/skills/` and `.codex/agents/` rather than `.codex/skills/`.
