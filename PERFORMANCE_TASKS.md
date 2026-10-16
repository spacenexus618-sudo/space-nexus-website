# Performance Optimization Tasks

Based on sitespeed.io audit results

---

## 1. Google Tag Manager (0/100)

- [ ] Task1: Find where GTM script is added in your code
- [ ] Task2: Remove GTM script from HTML/templates
- [ ] Task3: Replace GTM with direct Google Analytics (gtag.js)
- [ ] Task4: Test site works without GTM

---

## 2. Modern Image Formats (0/100)

- [ ] Task1: Identify all 8 images using JPEG/PNG/GIF formats
- [ ] Task2: Convert images to WebP format
- [ ] Task3: Add picture element with AVIF primary and WebP fallback
- [ ] Task4: Update image pipeline to auto-generate modern formats

---

## 3. Cache Headers (0/100)

- [ ] Task1: Identify the 39 requests missing cache headers
- [ ] Task2: Add Cache-Control headers for static assets
- [ ] Task3: Configure web server to set proper cache headers
- [ ] Task4: Add ETag or Last-Modified headers for validation

---

## Expected Results

- Image loading will be faster
- Repeat visits will be faster (cached)
- Less JavaScript bloat
- Better Core Web Vitals scores
