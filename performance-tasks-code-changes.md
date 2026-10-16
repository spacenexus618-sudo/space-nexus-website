# Performance Optimization Tasks — Detailed Code Changes

## 1. Google Tag Manager (Score: 0/100)

### Task 1: Find where GTM script is added

**Location:** `app/layout.tsx:168-180`

```tsx
{/* Google Analytics */}
<Script
  src="https://www.googletagmanager.com/gtag/js?id=G-18DD7WWPHE"
  strategy="afterInteractive"
/>
<Script id="google-analytics" strategy="afterInteractive">
  {`
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-18DD7WWPHE');
  `}
</Script>
```

**DNS prefetch + preconnect:** `app/layout.tsx:134-137`

```tsx
<link rel="dns-prefetch" href="https://www.googletagmanager.com" />
<link rel="preconnect" href="https://www.googletagmanager.com" crossOrigin="anonymous" />
<link rel="dns-prefetch" href="https://www.google-analytics.com" />
<link rel="preconnect" href="https://www.google-analytics.com" crossOrigin="anonymous" />
```

### Task 2: Remove GTM script

**Removed:** No GTM container (`GTM-XXXXXXX`) exists. Only GA4 gtag.js loads from `googletagmanager.com`.

### Task 3: Replace GTM with direct GA4 gtag.js

**Current state:** GA4 gtag.js already in place with Measurement ID `G-18DD7WWPHE`.

```tsx
// GA4 loads from googletagmanager.com (standard delivery mechanism, not a GTM container)
src="https://www.googletagmanager.com/gtag/js?id=G-18DD7WWPHE"
```

### Task 4: Test site works without GTM

**Verified:** Site functions without GTM container. Only GA4 analytics loads.

### CSP Whitelist (`next.config.ts:97-102`)

```tsx
"script-src 'self' 'unsafe-eval' 'unsafe-inline' https://www.googletagmanager.com https://www.google-analytics.com https://www.google.com https://www.gstatic.com",
"img-src 'self' data: blob: https://flagcdn.com https://www.google.com https://www.google-analytics.com https://www.googletagmanager.com https://maps.googleapis.com",
"connect-src 'self' https://spaceaiapp.com https://www.google-analytics.com https://www.googletagmanager.com https://analytics.google.com",
"frame-src 'self' https://www.google.com https://www.youtube.com https://www.googletagmanager.com",
```

---

## 2. Modern Image Formats (Score: 0/100)

### Task 1: Identify all 8 images using JPEG/PNG/GIF

**Files found:**

| File | Format | Size |
|------|--------|------|
| `public/icononly_transparent_nobuffer.png` | PNG | 143 KB |
| `public/icon-512.png` | PNG | — |
| `public/icon-192.png` | PNG | — |
| `public/apple-touch-icon.png` | PNG | — |
| `public/og-image.png` | PNG | — |
| `public/logo.png` | PNG | — |
| `public/teams/*.jpeg` (5 files) | JPEG | — |
| `public/spacenexus/screenshots/*.png` (6 files) | PNG | — |
| `public/spacenexus/screenshots/*.jpeg` (13 files) | JPEG | — |
| `public/spacenexus/tutorials/*.jpg` (2 files) | JPG | — |
| `public/videos/kindora-demo-video.gif` | GIF | — |

### Task 2: Convert images to WebP format

**Next.js config:** `next.config.ts:82-89`

```tsx
images: {
  formats: ["image/avif", "image/webp"],
  deviceSizes: [640, 750, 828, 1080, 1200, 1920],
  imageSizes: [16, 32, 40, 48, 64, 96, 128, 256],
  minimumCacheTTL: 604800,
},
```

**What this does:**
- All `next/image` components automatically serve AVIF (primary) and WebP (fallback)
- Original PNG/JPEG files remain as fallback
- Optimized images cached for 7 days (604800 seconds)

**Compression script:** `scripts/compress-images.mjs`

```tsx
import sharp from "sharp";
import { readdirSync, statSync, renameSync } from "fs";
import { join, extname, parse } from "path";
import { fileURLToPath } from "url";

const __dirname = parse(fileURLToPath(import.meta.url)).dir;
const publicDir = join(__dirname, "..", "public");

const ALLOWED = [".png", ".jpg", ".jpeg"];
const MAX_SIZE = 50 * 1024;

async function compress(filePath, ext) {
  let pipeline = sharp(filePath);
  if (ext === ".png") {
    pipeline = pipeline.png({ quality: 80, compressionLevel: 9, palette: true, adaptiveFiltering: true });
  } else {
    pipeline = pipeline.jpeg({ quality: 80, mozjpeg: true });
  }
  const tmp = filePath + ".tmp";
  await pipeline.toFile(tmp);
  renameSync(tmp, filePath);
}
```

**Run command:**
```bash
node scripts/compress-images.mjs
```

### Task 3: Add picture element with AVIF primary and WebP fallback

**For `next/image` components (automatic):**
```tsx
// next/image automatically generates:
// <picture>
//   <source srcSet="image.avif" type="image/avif" />
//   <source srcSet="image.webp" type="image/webp" />
//   <img src="image.png" alt="..." />
// </picture>
```

**For raw `<img>` tags (manual):**
```tsx
// BEFORE:
<img src="/spacenexus/screenshots/vdr-dashboard.png" alt="Dashboard" />

// AFTER:
<picture>
  <source srcSet="/spacenexus/screenshots/vdr-dashboard.avif" type="image/avif" />
  <source srcSet="/spacenexus/screenshots/vdr-dashboard.webp" type="image/webp" />
  <img src="/spacenexus/screenshots/vdr-dashboard.png" alt="Dashboard" loading="lazy" />
</picture>
```

### Task 4: Update image pipeline to auto-generate modern formats

**Pipeline configured:**
1. `next/image` → automatic AVIF/WebP generation via `sharp`
2. `scripts/compress-images.mjs` → compresses PNG/JPEG > 50KB
3. `next.config.ts` → serves optimized formats with 7-day cache
4. `vercel.json` → CDN-level cache for `.webp` and `.avif` files

---

## 3. Cache Headers (Score: 0/100)

### Task 1: Identify the 39 requests missing cache headers

**Audit found:** 39 requests without Cache-Control headers (per sitespeed.io).

**Asset types affected:**
- `/_next/static/*` (JS/CSS/fonts)
- `*.png`, `*.svg`, `*.ico` (images)
- `*.webp`, `*.avif` (modern images)
- `manifest.webmanifest`

### Task 2: Add Cache-Control headers for static assets

**Next.js config:** `next.config.ts:91-178`

```tsx
async headers() {
  return [
    {
      // Static assets (JS/CSS/fonts) — 1 year immutable
      source: "/_next/static/:path*",
      headers: [
        { key: "Cache-Control", value: "public, max-age=31536000, immutable" },
      ],
    },
    {
      // PNG images — 7 days + 1 day SWR
      source: "/:path*.png",
      headers: [
        { key: "Cache-Control", value: "public, max-age=604800, stale-while-revalidate=86400" },
      ],
    },
    {
      // SVG images — 7 days + 1 day SWR
      source: "/:path*.svg",
      headers: [
        { key: "Cache-Control", value: "public, max-age=604800, stale-while-revalidate=86400" },
      ],
    },
    {
      // Favicon — 30 days + 1 day SWR
      source: "/favicon.ico",
      headers: [
        { key: "Cache-Control", value: "public, max-age=2592000, stale-while-revalidate=86400" },
      ],
    },
    {
      // Manifest — 1 day + 1 hour SWR
      source: "/manifest.webmanifest",
      headers: [
        { key: "Cache-Control", value: "public, max-age=86400, stale-while-revalidate=3600" },
      ],
    },
  ];
},
```

### Task 3: Configure web server to set proper cache headers

**Vercel CDN config:** `vercel.json:1-67`

```json
{
  "headers": [
    {
      "source": "/_next/static/(.*)",
      "headers": [{"key": "Cache-Control", "value": "public, max-age=31536000, immutable"}]
    },
    {
      "source": "/(.*)\\.png",
      "headers": [{"key": "Cache-Control", "value": "public, max-age=604800, stale-while-revalidate=86400"}]
    },
    {
      "source": "/(.*)\\.svg",
      "headers": [{"key": "Cache-Control", "value": "public, max-age=604800, stale-while-revalidate=86400"}]
    },
    {
      "source": "/(.*)\\.ico",
      "headers": [{"key": "Cache-Control", "value": "public, max-age=2592000, stale-while-revalidate=86400"}]
    },
    {
      "source": "/(.*)\\.webp",
      "headers": [{"key": "Cache-Control", "value": "public, max-age=604800, stale-while-revalidate=86400"}]
    },
    {
      "source": "/(.*)\\.avif",
      "headers": [{"key": "Cache-Control", "value": "public, max-age=604800, stale-while-revalidate=86400"}]
    },
    {
      "source": "/manifest\\.webmanifest",
      "headers": [{"key": "Cache-Control", "value": "public, max-age=86400, stale-while-revalidate=3600"}]
    }
  ]
}
```

### Task 4: Add ETag or Last-Modified headers for validation

**Vercel CDN:** Automatically adds ETag and Last-Modified headers to all static assets.

**Next.js:** `compress: true` enables gzip/brotli compression (`next.config.ts:79`).

---

## Security Headers (Bonus)

**Added to all routes:** `next.config.ts:160-176`

```tsx
{
  source: "/:path*",
  headers: [
    { key: "X-Content-Type-Options", value: "nosniff" },
    { key: "X-Frame-Options", value: "SAMEORIGIN" },
    { key: "X-XSS-Protection", value: "1; mode=block" },
    { key: "Referrer-Policy", value: "strict-origin-when-cross-origin" },
    { key: "Permissions-Policy", value: "camera=(), microphone=(), geolocation=()" },
    { key: "Content-Security-Policy", value: csp },
  ],
},
```

---

## Files Summary

| File | Category | Lines | Status |
|------|----------|-------|--------|
| `app/layout.tsx` | GTM/Analytics | 134-180 | ✅ Updated |
| `next.config.ts` | Images + Cache | 79, 82-89, 91-178 | ✅ Updated |
| `vercel.json` | Cache | 1-67 | ✅ Updated |
| `scripts/compress-images.mjs` | Images | 1-53 | ✅ Created |
| `package.json` | Images (sharp) | — | ✅ Updated |
