# Multi-language Support in Astro

This project uses a **hybrid approach** for handling multiple languages:

## Approach: Separate Files + Shared Content

### Structure

```
src/
├── content/
│   └── pages.ts              # Shared content in EN/ES
├── pages/
│   ├── index.astro           # English version
│   ├── index-es.astro        # Spanish version
│   ├── page-name.astro       # English page
│   └── page-name-es.astro    # Spanish page
```

### How it Works

1. **Content is centralized** in [src/content/pages.ts](src/content/pages.ts)
2. **Each language has its own file** (e.g., `index.astro` vs `index-es.astro`)
3. **Both files use the same layout and components**
4. **Content is pulled from the shared file based on language**

### Example

**English page** (`index.astro`):
```astro
---
import { pages } from '../content/pages';
const content = pages.en.home;  // Pull English content
---

<h1>{content.title}</h1>
```

**Spanish page** (`index-es.astro`):
```astro
---
import { pages } from '../content/pages';
const content = pages.es.home;  // Pull Spanish content
---

<h1>{content.title}</h1>
```

## Adding New Translated Content

### 1. Add content to `src/content/pages.ts`

```typescript
export const pages = {
  en: {
    myPage: {
      title: "My Page Title",
      description: "Page description..."
    }
  },
  es: {
    myPage: {
      title: "Título de Mi Página",
      description: "Descripción de la página..."
    }
  }
};
```

### 2. Create page files

**English**: `src/pages/my-page.astro`
```astro
---
import BaseLayout from '../layouts/BaseLayout.astro';
import { pages } from '../content/pages';
const content = pages.en.myPage;
---

<BaseLayout title={content.title} lang="en">
  <h1>{content.title}</h1>
  <p>{content.description}</p>
</BaseLayout>
```

**Spanish**: `src/pages/my-page-es.astro`
```astro
---
import BaseLayout from '../layouts/BaseLayout.astro';
import { pages } from '../content/pages';
const content = pages.es.myPage;
---

<BaseLayout title={content.title} lang="es">
  <h1>{content.title}</h1>
  <p>{content.description}</p>
</BaseLayout>
```

### 3. Add language selector

```astro
<LanguageSelector
  currentLang="en"
  enUrl="/my-page"
  esUrl="/my-page-es"
/>
```

## Benefits of This Approach

✅ **Simple URL structure**: `/page-name` (EN), `/page-name-es` (ES)
✅ **SEO-friendly**: Each language has its own URL
✅ **Easy to maintain**: Content changes happen in one place
✅ **No duplication**: Layouts and components are reused
✅ **Type-safe**: TypeScript ensures content structure is consistent
✅ **Flexible**: Each language can have different pages/structure if needed

## Alternative Approaches (Not Used)

### Option 1: Dynamic Routes with i18n
Use Astro's i18n routing with a single file:
```
src/pages/[lang]/index.astro
```
**Pros:** Single file per page
**Cons:** More complex setup, harder to customize per language

### Option 2: Astro i18n Integration
Use `astro-i18next` or similar library.
**Pros:** Full i18n features (date/number formatting, pluralization)
**Cons:** Overkill for simple content translation

### Option 3: JSON Files
Store translations in separate JSON files.
**Pros:** Easy to give to translators
**Cons:** No TypeScript safety, harder to maintain

## URL Mapping (Old vs New)

| Old HTML | New Astro URL |
|----------|---------------|
| `index.html` | `/` |
| `index-es.html` | `/index-es` |
| `mermaid-arquitecture-platform-ai.html` | `/mermaid-arquitecture-platform-ai` |
| `mermaid-arquitectura-plataforma-ai.html` | `/mermaid-arquitectura-plataforma-ai` |
| `ai-conceptual-platform.html` | `/ai-conceptual-platform` |
| `plataforma-conceptual-ai.html` | `/plataforma-conceptual-ai` |

## Current Implementation

- ✅ Index pages (EN/ES) with shared content
- ✅ Language selector component
- ✅ Mermaid diagram page (Spanish)
- ⏳ Remaining pages need to be migrated

## Next Steps

1. Add remaining page content to `src/content/pages.ts`
2. Create corresponding `.astro` files for each page
3. Test language switching between all pages
4. Build and deploy to replace old HTML files
