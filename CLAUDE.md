# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static HTML site repository for Patagonian's public pages, hosted via GitHub Pages. The project contains interactive AI platform architecture visualizations and dashboards in both English and Spanish.

**Live URL:** https://rodrigofalco.github.io/publicPages/

## Repository Structure

### Key Directories
- **[docs/](docs/)** - Contains all HTML pages served by GitHub Pages. This is the publishing directory configured for GitHub Pages.
- **[diagram/](diagram/)** - Source Mermaid diagram files (`.mermaid` format) used in the architecture visualizations.

### Publishing
All pages are served from the [docs/](docs/) directory. Any new HTML pages must be placed here to be accessible via GitHub Pages.

## Page Architecture

The site follows a bilingual structure with matching English/Spanish page pairs:

### Index Pages
- [index.html](docs/index.html) - English landing page with card-based navigation
- [index-es.html](docs/index-es.html) - Spanish landing page

### Mermaid Architecture Diagrams
- [mermaid-arquitecture-platform-ai.html](docs/mermaid-arquitecture-platform-ai.html) - English version
- [mermaid-arquitectura-plataforma-ai.html](docs/mermaid-arquitectura-plataforma-ai.html) - Spanish version

Features: Interactive zoom (mouse wheel), pan/drag, embedded Mermaid.js rendering

### Conceptual Architecture Diagrams
- [ai-conceptual-platform.html](docs/ai-conceptual-platform.html) - English version
- [plataforma-conceptual-ai.html](docs/plataforma-conceptual-ai.html) - Spanish version

### D3.js Interactive Dashboards
- [d3js-architecture-ai-dashboard.html](docs/d3js-architecture-ai-dashboard.html) - English version
- [d3js-arquitectura-ia-dashboard.html](docs/d3js-arquitectura-ia-dashboard.html) - Spanish version

Features: D3.js-powered interactive data exploration and architecture analysis

## Design System

### Branding
- **Primary Blue:** `#046cfc`
- **Dark Blue:** `#15294b`
- **Orange Accent:** `#f1870d`
- **Fonts:**
  - Headings: Montserrat (Google Fonts)
  - Body: Lato (Google Fonts)
- **Logo:** [patagonian_logo_RGB_color-300x58.png](docs/patagonian_logo_RGB_color-300x58.png)

### Common Patterns
All pages include:
- Gradient backgrounds using Patagonian colors
- White container cards with rounded corners
- Language selector (English/Spanish toggle)
- Patagonian logo linking to https://patagonian.com
- Responsive design for mobile/tablet/desktop

## Development Workflows

### Static HTML Development
The `docs/` directory contains pure static HTML files that can be edited directly. No build process is required - changes are immediately reflected when served locally.

**Local testing:** Open HTML files directly in a browser or use a simple HTTP server:
```bash
# Using Python
python -m http.server 8000 --directory docs/

# Using Node.js
npx serve docs/
```

### Astro Development (Modern Version)
The `astro/` directory contains a modern Astro-based version with reusable components and better maintainability.

**Common commands:**
```bash
cd astro
npm run dev          # Start development server (http://localhost:4321)
npm run build        # Build static site to `dist/` directory
npm run preview      # Preview built site locally
```

**Astro project structure:**
- `src/layouts/BaseLayout.astro` - Main layout with Patagonian branding
- `src/components/` - Reusable components (LanguageSelector, MermaidDiagram)
- `src/pages/` - Page files (.astro) that compile to static HTML
- `public/` - Static assets (logo, images)
- `dist/` - Built output (after `npm run build`)

## Deployment

The site uses dual deployment workflows:

### 1. Static HTML Deployment
**Workflow:** [.github/workflows/static.yml](.github/workflows/static.yml)
- Triggers on changes to `docs/**` files
- Deploys static content directly to GitHub Pages
- No build process required

### 2. Astro Build Deployment
**Workflow:** [.github/workflows/astro-deploy.yml](.github/workflows/astro-deploy.yml)
- Triggers on changes to `astro/**` files
- Builds Astro site with `npm run build`
- Commits built files to `docs/` directory
- Then triggers static deployment workflow

**To manually trigger deployment:**
1. Go to Actions tab in GitHub
2. Select "Deploy static content to Pages" (for static files) or "Deploy Astro to GitHub Pages" (for Astro builds)
3. Click "Run workflow"

## Testing

This project does not have automated tests due to its static nature. Testing is done manually:

1. **Visual testing:** Open pages in browser and verify layout, responsiveness
2. **Interactive testing:** Test Mermaid diagram zoom/pan functionality
3. **Cross-browser testing:** Verify compatibility across Chrome, Firefox, Safari
4. **Mobile testing:** Test responsive design on various screen sizes

For the Astro version, development server provides hot reload for rapid iteration.

## Code Architecture Patterns

### Bilingual Structure
All pages follow a consistent bilingual pattern:
- English files: `page-name.html` or `page-name.astro`
- Spanish files: `nombre-pagina.html` or `nombre-pagina.astro`
- Language selector component provides navigation between versions

### Component Reuse (Astro Version)
- **BaseLayout.astro:** Central layout with branding, header, footer
- **MermaidDiagram.astro:** Interactive diagram with zoom/pan functionality
- **LanguageSelector.astro:** Bilingual navigation component

### Static vs Dynamic Approach
- **Static HTML (`docs/`):** Direct editing, no build step, simple deployment
- **Astro (`astro/`):** Component-based, build step, better maintainability
- Both approaches deploy to same `docs/` directory for GitHub Pages

### Mermaid Diagram Integration
Diagrams are stored as `.mermaid` files in `diagram/` directory and rendered with:
- Interactive zoom/pan via custom JavaScript
- Responsive sizing for different screen sizes
- Consistent styling with Patagonian branding

## Adding New Pages

When creating new visualization pages:

1. Place HTML files in [docs/](docs/) directory
2. Follow the existing bilingual naming convention:
   - English: `page-name.html`
   - Spanish: `nombre-pagina.html`
3. Include language selector in header
4. Use Patagonian branding (colors, fonts, logo)
5. Update both [index.html](docs/index.html) and [index-es.html](docs/index-es.html) with navigation links
6. For Mermaid diagrams, store source `.mermaid` files in [diagram/](diagram/) directory

## Working with Dual Codebase

This repository maintains two parallel implementations:

### Static HTML (`docs/` directory)
- **Purpose:** Production deployment, simple edits, quick fixes
- **Editing:** Direct file modifications
- **Deployment:** Changes to `docs/` trigger immediate GitHub Pages deployment
- **Use when:** Making small content changes, fixing typos, adding simple pages

### Astro Version (`astro/` directory)
- **Purpose:** Modern development, component reuse, better maintainability
- **Editing:** Component-based development with `npm run dev`
- **Deployment:** Changes to `astro/` trigger build and commit to `docs/`
- **Use when:** Creating new features, refactoring, improving architecture

### Migration Strategy
When migrating from static HTML to Astro:
1. Create corresponding `.astro` file in `astro/src/pages/`
2. Extract common elements to `BaseLayout.astro`
3. Move diagram logic to `MermaidDiagram.astro` component
4. Build with `npm run build` in `astro/` directory
5. Built files automatically deploy to `docs/` via GitHub Actions

## Technology Stack

### Static HTML Version
- **Pure HTML/CSS/JavaScript** - No build tools or package managers
- **Mermaid.js** - Architecture diagram rendering (CDN: https://cdn.jsdelivr.net/npm/mermaid)
- **D3.js v7.8.5** - Interactive data visualizations (CDN: https://cdnjs.cloudflare.com/ajax/libs/d3/7.8.5/d3.min.js)

### Astro Version
- **Astro 5.14.1** - Static site generator with component architecture
- **Mermaid.js 11.12.0** - Local npm package for diagram rendering
- **TypeScript** - Type safety in components
- **Node.js 20+** - Development environment

### Hosting
- **GitHub Pages** - Static hosting from `docs/` directory

## AI Platform Architecture

The visualizations depict a multi-layer AI platform:

**Layers:**
- User Layer (Usuario)
- Authentication & Authorization (Entra ID / OAuth 2.0)
- Interface Layer (Chat Interface - Web/Mobile/Desktop)
- Backend Layer (API + Scheduler)
- Document Repository (Google Drive / SharePoint / OneDrive)
- Language & AI Layer (LLMs: Claude Sonnet 4.5 / GPT-4)
- Automation Layer (Power Automate / n8n / Zapier)
- MCP Layer (Model Context Protocol with tool connectors)
- Integration Layer (Internal APIs, ERP/CRM systems)
- Data Layer (SQL/NoSQL databases, S3/Storage)
- Observability Layer (Langfuse / Grafana / Phoenix / Datadog)

Source diagram: [diagram/arquitectura-plataforma-ai.mermaid](diagram/arquitectura-plataforma-ai.mermaid)
