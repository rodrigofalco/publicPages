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

## Deployment

The site auto-deploys via GitHub Actions on every push to the `main` branch.

**Workflow:** [.github/workflows/static.yml](.github/workflows/static.yml)

To manually trigger deployment:
1. Go to Actions tab in GitHub
2. Select "Deploy static content to Pages"
3. Click "Run workflow"

No build process is required - all pages are static HTML with inline CSS and JavaScript.

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

## Technology Stack

- **Pure HTML/CSS/JavaScript** - No build tools or package managers
- **Mermaid.js** - Architecture diagram rendering (CDN: https://cdn.jsdelivr.net/npm/mermaid)
- **D3.js v7.8.5** - Interactive data visualizations (CDN: https://cdnjs.cloudflare.com/ajax/libs/d3/7.8.5/d3.min.js)
- **GitHub Pages** - Static hosting

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
