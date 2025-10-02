# Patagonian Public Pages - Astro Version

This is the dynamic Astro version of the Patagonian public pages. It compiles to static HTML while allowing you to use reusable components, layouts, and manage content more efficiently..

## 🚀 Quick Start

### Development Server

```bash
npm run dev
```

Opens http://localhost:4321

### Build Static HTML

```bash
npm run build
```

Output goes to `dist/` directory - ready for deployment.

### Preview Build

```bash
npm run preview
```

Preview the built site locally before deploying.

## 📁 Project Structure

```
astro/
├── src/
│   ├── layouts/
│   │   └── BaseLayout.astro          # Main layout with header/footer
│   ├── components/
│   │   ├── LanguageSelector.astro    # EN/ES language toggle
│   │   └── MermaidDiagram.astro      # Mermaid diagram with zoom/pan
│   └── pages/
│       ├── index.astro               # Home page (English)
│       └── mermaid-arquitectura-plataforma-ai.astro  # Example diagram page
├── public/
│   └── patagonian_logo_RGB_color-300x58.png
└── dist/                             # Built static files (after npm run build)
```

## 🎨 Reusable Components

### BaseLayout

The main layout that wraps all pages. Includes:

- Patagonian branding (logo, colors, fonts)
- Header with brand tagline
- Footer with copyright
- Responsive design
- Bilingual support (en/es)

**Usage:**

```astro
---
import BaseLayout from '../layouts/BaseLayout.astro';
---

<BaseLayout title="Page Title" lang="es" showControls={true}>
  <h1>Your content here</h1>
</BaseLayout>
```

### LanguageSelector

Dropdown to switch between English and Spanish versions.

**Usage:**

```astro
---
import LanguageSelector from '../components/LanguageSelector.astro';
---

<LanguageSelector currentLang="en" enUrl="/" esUrl="/es" />
```

### MermaidDiagram

Interactive Mermaid diagram with zoom and pan functionality.

**Usage:**

```astro
---
import MermaidDiagram from '../components/MermaidDiagram.astro';

const diagram = `
flowchart TB
    A[Start] --> B[End]
`;
---

<MermaidDiagram
  diagram={diagram}
  loadingText="Loading..."
  hintText="💡 Use mouse wheel to zoom"
/>
```

## ➕ Adding New Pages

1. Create a new `.astro` file in `src/pages/`
2. Import and use `BaseLayout`
3. Add your content
4. The filename becomes the URL (e.g., `my-page.astro` → `/my-page`)

**Example:**

```astro
---
import BaseLayout from '../layouts/BaseLayout.astro';
---

<BaseLayout title="My New Page" lang="en">
  <h1>Hello World</h1>
  <p>This is my new page!</p>
</BaseLayout>
```

## 🌐 Bilingual Pages

For bilingual support, create page pairs:

- `page-name.astro` (English)
- `page-name-es.astro` (Spanish)

Or use dynamic routing - see [Astro docs](https://docs.astro.build/en/guides/routing/).

## 🎨 Design System

**Colors:**

- Primary Blue: `#046cfc`
- Dark Blue: `#15294b`
- Orange Accent: `#f1870d`

**Fonts:**

- Headings: Montserrat
- Body: Lato

## 📦 Deployment

The built files in `dist/` are pure static HTML/CSS/JS - deploy anywhere:

### GitHub Pages

```bash
npm run build
# Copy dist/ contents to your GitHub Pages directory
```

### Netlify / Vercel

Connect your repo and set build command to `npm run build`, output directory to `dist/`.

## 🔄 Migrating from Old HTML Files

To migrate an existing HTML page:

1. Create new `.astro` file in `src/pages/`
2. Move content between `<body>` tags into the Astro file
3. Extract head content to layout or page frontmatter
4. Replace duplicated header/footer with `BaseLayout`
5. Extract reusable parts into components

## 👀 Want to learn more?

Feel free to check [Astro documentation](https://docs.astro.build) or jump into the [Discord server](https://astro.build/chat).
