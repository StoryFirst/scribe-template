# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Scribe Template is a Jekyll-based static site generator for worldbuilding, designed to work with Story First's Scribe. It creates navigable websites and LLM-friendly HTML exports from worldbuilding content. The template uses Tailwind CSS for styling and can integrate with Tina CMS for content management.

## Development Commands

### Initial Setup
```bash
bundle install
npm install
```

### Development Server
```bash
./start.sh
# Or manually:
bundle exec jekyll serve --watch --drafts --host 0.0.0.0 -P 4321
```
The site will be available at `http://localhost:4321`

### CSS Processing
- Tailwind CSS is processed via PostCSS through the `jekyll-postcss` plugin
- In production (`JEKYLL_ENV=production`), CSS is minified with cssnano
- Tailwind configuration: `tailwind.config.js`
- PostCSS configuration: `postcss.config.js`

### Building for Production
```bash
JEKYLL_ENV=production bundle exec jekyll build
```

## Architecture

### Jekyll Collections System

The worldbuilding content is organized into Jekyll collections defined in `_config.yml`:

- `_characters/` - Character profiles with relationships, personality types, appearance details (output: true, link: true)
- `_books/` - Book/story containers (output: true, link: true)
- `_chapters/` - Individual chapters within books (output: true)
- `_scenes/` - Scene files (output: false, link: false)
- `_locations/` - Geographic locations in the world (output: true)

**Important:** Scenes do not generate individual pages (`output: false`) but are included in chapter pages.

### Content Structure

Content files use extensive front matter with structured data. Example character fields:
- Basic: `id`, `name`, `description`, `caption`, `image_url`
- Metadata: `scribe_id`, `inserted_at`, `updated_at`
- Appearance: `apperance_*` fields (height, weight, hair_color, eye_color, build, fashion)
- Personality: `personality_*` fields (type, energy, mind, nature, tactics, motivation, strength, fear, conflict)
- Relationships: `character_relationships` array with id references to other characters

Scenes include front matter for:
- `number` - Scene number within chapter
- `chapter.id` and `chapter.number` - Parent chapter reference

### Layout Hierarchy

```
_layouts/default.html (base template with header/footer)
├── _layouts/home.html
├── _layouts/world.html
├── _layouts/character.html
├── _layouts/book.html
├── _layouts/chapter.html
├── _layouts/location.html
├── _layouts/scene.html
└── _layouts/page.html
```

Most layouts extend `default.html` and simply render `{{ content }}`. The default layout:
- Applies theme-based background colors via `page.theme` or defaults to 'brand'
- Adds page layout as a body class
- Includes header, content container, and footer

### Includes

- `_includes/head.html` - HTML head with meta tags
- `_includes/header.html` - Site header/navigation
- `_includes/footer.html` - Site footer
- `_includes/menu.html` - Menu component

### Theming

Tailwind theme customization in `tailwind.config.js` defines:
- `brand` color scheme: primary (#0a0a0a), secondary (#0a0a0a), background (#f5f5f5)
- `default` color scheme (currently identical to brand)
- Custom list style types

Theme is applied via `bg-{{ page.theme | default: 'brand' }}-background` in layouts.

## File Naming

Content uses scribe-generated ULID identifiers in filenames:
- Format: `{type}_{ulid}.md`
- Example: `character_01k208673bs1djh8v6n011.md`
- IDs are also stored in front matter as both `id` and `scribe_id`

## Important Notes

- The Gemfile includes `jekyll-postcss` for PostCSS integration with Jekyll
- Content is managed externally (likely via Scribe/Tina CMS) and synced into collection directories
- The `_site/` directory contains built static files (excluded from git)
- Pagination is configured for 25 items per page
- Site uses kramdown for Markdown processing with GFM input
