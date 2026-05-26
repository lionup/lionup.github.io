# lionup.github.io

Personal academic website for Ran Gu — Associate Professor in Economics at City St George's, University of London. Built with Jekyll + minima theme, hosted on GitHub Pages at rangu.org.

## Deploy

```
make push   # git add -A && git commit -m 'd' && git push origin master
make pull   # git pull origin master
```

GitHub Pages rebuilds automatically on every push to master. To preview locally:

```
bundle exec jekyll serve
```

## Site structure

| File | Purpose |
|------|---------|
| `index.md` | Homepage — bio, research interests, contact |
| `research/research.md` | Publications and current projects |
| `teaching.md` | Teaching history |
| `computing.md` | Computing resources |
| `_config.yml` | Site settings, SEO, social links, announcement banner |
| `cv/RanCV.pdf` | CV (replace the PDF directly) |
| `_includes/` | header, footer, head, image partials |
| `_sass/` | Custom styles |

## Common edits

**Add a publication** — edit `research/research.md`. Follow the existing pattern: `### N. [Title](url)` with a `> Journal, year` line, optional media coverage, and a `<details>` block for the abstract.

**Add a current project** — add a `### N.` entry under `## <ins>Current Projects:</ins>` in `research/research.md`. If there's no abstract yet, omit the `<details>` block.

**Update the homepage announcement banner** — edit the `announcement:` line in `_config.yml`. Comment out the old line and add a new one. Leave commented-out old announcements in place for reference.

**Update the CV** — replace `cv/RanCV.pdf` with the new file (keep the same filename).

**Update title/affiliation** — `_config.yml` (`job.title`, `job.institution`) and `index.md` (the prose line under `## About Me`).

## Conventions

- All external links use `{:target="_blank"}` to open in a new tab.
- Abstracts are wrapped in `<details><summary><font color="grey">Abstract</font></summary>…</details>`.
- Commented-out content (old papers, draft sections) stays in place behind `<!-- … -->` rather than being deleted — it serves as a reference.
- The `announcement` div on the homepage is driven by `site.announcement` in `_config.yml`. Comment out the value to hide the banner.
- Publications are numbered sequentially; do not renumber when adding — append at the end and renumber the whole list.

## Jekyll stack

- Jekyll 3.10.0 via `github-pages` gem
- Theme: minima
- Plugins: jekyll-feed, jekyll-target-blank, jekyll-seo-tag

There are Dependabot vulnerability alerts on the repo (nokogiri etc.). These are build-tooling issues only and do not affect visitors to the static site. No action needed unless moving off the github-pages gem.
