# lionup.github.io

Personal academic website for Ran Gu — Associate Professor in Economics at City St George's, University of London. Built with Jekyll + minima theme, hosted on GitHub Pages at rangu.org.

## Deploy

```
make push   # git add -A && git commit -m 'd' && git push origin master
make pull   # git pull origin master
```

GitHub Pages rebuilds automatically on every push to master. The workflow (`.github/workflows/pages.yml`) is pinned to `runs-on: ubuntu-24.04` (not `ubuntu-latest`) because `commonmarker 0.23.11` fails to compile under cmake 4.x on ubuntu-26.04. Do not change it back unless the `github-pages` gem is replaced. To preview locally:

```
bundle exec jekyll serve
```

## Site structure

| File | Purpose |
|------|---------|
| `index.md` | Homepage — bio, research interests, contact |
| `research/research.md` | Publications and working papers (styles in `_sass/_research.scss`) |
| `teaching.md` | Teaching history |
| `computing.md` | Computing resources |
| `_config.yml` | Site settings, SEO, social links, announcement banner |
| `cv/RanCV.pdf` | CV (replace the PDF directly) |
| `_includes/` | header, footer, head, image partials |
| `_sass/` | Custom styles |

## Common edits

**Add a publication** — edit `research/research.md`. Copy an existing `<div class="paper">` block: title (linked to the PDF if one exists, else the published version), `paper-authors`, `paper-venue` (journal, year), optional `paper-media` line, `paper-links` pills (`paper` = published version, earlier-version pill such as NBER/IFS WP, `abstract` button), and a hidden `paper-abstract` div. Newest first; entries are not numbered.

**Add a working paper or current project** — add a `<div class="paper">` block under the `Working Papers` heading in `research/research.md` (there is no separate Current Projects section). If there's no abstract or PDF yet, omit the pills and abstract div.

**Update the homepage announcement banner** — edit the `announcement:` line in `_config.yml`. Comment out the old line and add a new one. Leave commented-out old announcements in place for reference.

**Update the CV** — replace `cv/RanCV.pdf` with the new file (keep the same filename).

**Update title/affiliation** — `_config.yml` (`job.title`, `job.institution`) and `index.md` (the prose line under `## About Me`).

## Conventions

- All external links use `{:target="_blank"}` to open in a new tab.
- Abstracts live in a hidden `<div class="paper-abstract">` toggled by the `abstract` pill (small script at the bottom of `research.md`).
- Commented-out content (old papers, draft sections) stays in place behind `<!-- … -->` rather than being deleted — it serves as a reference.
- The `announcement` div on the homepage is driven by `site.announcement` in `_config.yml`. Comment out the value to hide the banner.

## Jekyll stack

- Jekyll 3.10.0 via `github-pages` gem
- Theme: minima
- Plugins: jekyll-feed, jekyll-target-blank, jekyll-seo-tag

There are Dependabot vulnerability alerts on the repo (nokogiri etc.). These are build-tooling issues only and do not affect visitors to the static site. No action needed unless moving off the github-pages gem.
