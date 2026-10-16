# SpaceNexus Web Quality Audit Tasks

Based on web-quality-audit skill — 30 tasks organized by priority

---

## Critical (Fix Immediately) — 5 Tasks
✅ Task 1: Add CSP header in next.config.ts
**Issue:** No Content Security Policy currently exists; XSS vulnerability risk
**Fix:** Whitelist GA, GTM, WhatsApp, Apollo GraphQL domains in next.config.ts headers

✅ Task 2: Add skip-to-content link in layout.tsx
**Issue:** Keyboard users cannot bypass the 23-component Header navigation
**Fix:** Add skip link before Header component

✅ Task 3: Fix color contrast on muted text
**Issue:** text-gray-500 and text-gray-400 on bg-[#f8f9fa] likely fail WCAG AA 4.5:1
**Fix:** Audit all instances in globals.css and components; increase contrast ratio

✅ Task 4: Verify no exposed source maps in production build
**Issue:** Source maps may expose source code in production
**Fix:** Run next build and check .next/static/chunks/ for .map files; remove if present

✅ Task 5: Audit console errors across all pages
**Issue:** Runtime errors may be silently failing
**Fix:** Check browser console on homepage, pricing, demo, get-started for CORS errors, failed GraphQL queries, or runtime exceptions

---

## High  — 8 Tasks

✅ Task 6: Optimize LCP on homepage
**Issue:** HeroSection.tsx has animated SVG + images that may delay largest paint
**Fix:** Ensure the largest paint element has priority preload and is within head in layout.tsx

✅ Task 7: Defer WhatsApp widget loading
**Issue:** WhatsAppButton.tsx loads immediately, blocking interactivity
**Fix:** Wrap in next/script strategy="lazyOnload" or dynamic import with ssr: false

✅ Task 8: Add aria-label to all icon-only buttons
**Issue:** WhatsApp button, mobile menu toggle, and social icons lack accessible names
**Fix:** Add aria-label="Contact us on WhatsApp" etc. to all icon buttons

✅ Task 9: Set explicit dimensions on all screenshots
**Issue:** Screenshots in public/spacenexus/screenshots/ may cause CLS
**Fix:** Add width/height to every Image component

✅ Task 10: Add link rel="preconnect" for Apollo GraphQL endpoint
**Issue:** spaceaiapp.com is fetched but not preconnected
**Fix:** Add link rel="preconnect" href="https://spaceaiapp.com" to layout.tsx head

✅ Task 11: Add Article schema to individual blog posts
**Issue:** Currently only CollectionPage schema exists; individual posts lack structured data
**Fix:** Add Article schema with datePublished, dateModified, author to each blog post

✅ Task 12: Audit keyboard trap in Header dropdowns
**Issue:** Product/Industries/Ecosystem mega-menus may trap keyboard focus
**Fix:** Test Tab/Escape behavior; ensure Escape closes dropdown and focus returns to trigger

✅ Task 13: Add focus-visible styles globally
**Issue:** No consistent focus indicator for keyboard navigation
**Fix:** Add focus-visible outline styles to globals.css

---

## Medium (Fix Within Sprint) — 10 Tasks

✅ Task 14: Lazy load solution and industry pages
**Issue:** 20 solution pages and 8 industry pages bloat initial bundle size
**Fix:** Use next/dynamic with loading skeleton for solution and industry page components

✅ Task 15: Replace Framer Motion with CSS animations where possible
**Issue:** Framer Motion 12.34.1 adds bundle weight for simple animations
**Fix:** Audit usage; replace simple fade-in/slide-up in TestimonialsSection, BenefitsSection, FAQSection with CSS keyframes + content-visibility: auto

✅ Task 16: Add font preloading for non-Latin subsets
**Issue:** hreflang targets zh-Hant-TW, ar-AE, de-DE but only Latin Inter font is loaded
**Fix:** Add link rel="preload" for CJK/Arabic/German font variants or use next/font with appropriate subsets

✅ Task 17: Extract critical above-fold CSS
**Issue:** Tailwind CSS may be render-blocking
**Fix:** Extract styles needed for hero + header into inline style in layout.tsx

✅ Task 18: Enable ISR for blog and solution pages
**Issue:** Blog and solution pages rebuild on every deploy
**Fix:** Add export const revalidate = 86400 to serve static with daily revalidation

✅ Task 19: Optimize demo video delivery
**Issue:** Demo video may be large and block page load
**Fix:** Add poster image, lazy load video, consider CDN delivery for video assets

Task 20: Audit internal linking depth
**Issue:** Some pages may require more than 3 clicks from homepage
**Fix:** Map all sitemap URLs to link graph; add breadcrumb/nav links where needed

✅ Task 21: Add FAQ schema to feature pages
**Issue:** 13 feature pages likely have Q&A content without structured data
**Fix:** Extract Q&A content and add FAQPage structured data

✅ Task 22: Fix duplicate/missing title tags on feature pages
**Issue:** 13 feature landing pages may have generic or duplicate titles
**Fix:** Audit with site:spacenexus.net search; ensure each has unique, keyword-rich title

✅ Task 23: Crawl for broken links
**Issue:** 300+ sitemap URLs may contain dead links
**Fix:** Run automated link checker; fix 404s with redirects or content updates

---

## Low (Fix When Convenient) — 7 Tasks

✅ Task 24: Remove default Next.js SVGs
**Issue:** public/file.svg, globe.svg, next.svg, vercel.svg, window.svg appear unused
**Fix:** Delete unused SVGs to reduce public folder bloat

✅ Task 25: Audit will-change usage
**Issue:** .card-hover uses will-change: transform permanently, consuming compositor memory
**Fix:** Move to will-change only on hover state

✅ Task 26: Add role="banner" and role="contentinfo"
**Issue:** No explicit ARIA landmarks for header and footer
**Fix:** Add role="banner" to Header and role="contentinfo" to Footer in layout.tsx

✅ Task 27: Subset Inter font
**Issue:** Full Latin character set may include unnecessary glyphs
**Fix:** Verify next/font subsets: ["latin"] is optimal; check no over-loading

✅ Task 28: Audit prefers-reduced-motion coverage
**Issue:** Some animations may not respect user motion preferences
**Fix:** Verify all Framer Motion and CSS keyframes honor prefers-reduced-motion: reduce

✅ Task 29: Add lastmod to robots.txt sitemap references
**Issue:** robots.ts lists sitemaps without lastmod
**Fix:** Add lastmod timestamp for better crawl budget efficiency

✅ Task 30: Clean up unused CSS utility classes
**Issue:** Custom classes in globals.css may be unused
**Fix:** Run Tailwind purge audit; remove unreferenced classes

