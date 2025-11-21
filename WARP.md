# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is a personal digital garden/knols collection built with Quarto. It's a static website published to GitHub Pages that contains notes from books, articles, tutorials, and personal writings. The content is written in Quarto Markdown (.qmd files).

## Essential Commands

### Build and Preview
```bash
# Live preview with hot reload (recommended for local development)
quarto preview

# Or use Makefile shortcut
make preview
```

### Publishing
```bash
# Publish to GitHub Pages
quarto publish gh-pages

# Or use Makefile shortcut
make publish
```

### Quality Checks
```bash
# Run spell check on all .qmd files
make spell

# Or directly
bash ./spellcheck.sh
```

The spell checker uses `aspell` with British English (`en_GB`) and a custom dictionary (`_ignore.pws`) for technical terms and names.

## Content Architecture

### Directory Structure

- **Root level**: Main pages (`index.qmd`, `about.qmd`, `now.qmd`)
- **`writings/`**: Personal essays and opinion pieces
- **`notes/`**: Notes organized by source type:
  - `notes/books/` - Book summaries and notes
  - `notes/bots/` - LLM-generated content
  - `notes/web/` - Web articles and tutorials
  - `notes/teaching/` - Teaching-related notes
- **`tech/`**: Technical content:
  - `tech/ops/` - DevOps, tools, setup guides
  - `tech/practices/` - Software engineering practices
  - `tech/mgmt/` - Engineering management
- **`talks/`**: Talk notes and references
- **`assets/`**: Images, PDFs, and other static files
- **`_inbox.qmd`**: Temporary storage for new learnings
- **`_site/`**: Generated static site (gitignored)

### Content Workflow

1. New content often starts in `_inbox.qmd` before being organized
2. Each .qmd file should have YAML frontmatter with at minimum a `title`
3. Quarto automatically generates navigation from directory structure
4. The site uses floating sidebar with auto-generated contents

## Quarto Configuration

Configuration is in `_quarto.yml`:
- **Theme**: yeti
- **Search**: enabled
- **Sidebar**: floating style, auto-generated from directory structure
- **Analytics**: GoatCounter tracking
- **Format**: HTML with table of contents

## Custom Dictionary

When adding new technical terms, names, or specialized vocabulary that triggers spell check errors, add them to `_ignore.pws` (one word per line).

## Publishing Flow

The site is published to GitHub Pages. The `quarto publish gh-pages` command:
1. Renders the site to `_site/`
2. Pushes content to the `gh-pages` branch
3. GitHub Pages serves from that branch

## File Naming Conventions

- Use lowercase with hyphens for multi-word filenames: `black-and-white-thinking.qmd`
- Book notes follow pattern: `author-title_year.qmd`
- Keep filenames descriptive but concise

## Writing Style

Based on existing content:
- Casual, personal tone
- Mix of bullet points and paragraphs
- Callout blocks for emphasis: `:::{.callout}` 
- Links to external sources and cross-references
- Date stamps on time-sensitive content (like `now.qmd`)
