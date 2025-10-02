// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  outDir: '../docs',
  build: {
    format: 'file' // Generates index.html instead of index/index.html
  },
  site: 'https://rodrigofalco.github.io',
  base: '/publicPages'
});
