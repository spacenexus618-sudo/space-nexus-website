# SpaceNexus Web Quality Audit — Code Changes

Generated from web-quality-audit skill — 30 tasks with before/after code changes.

---

## Critical — 5 Tasks

### Task 1: CSP header in next.config.ts

**File:** `next.config.ts`

**BEFORE:**
```typescript
// No CSP headers configured
```

**AFTER:**
```typescript
const csp = [
  "default-src 'self'",
  "script-src 'self' 'unsafe-eval' 'unsafe-inline' https://www.googletagmanager.com https://www.google-analytics.com https://www.google.com https://www.gstatic.com",
  "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com",
  "img-src 'self' data: blob: https://flagcdn.com https://www.google.com https://www.google-analytics.com https://www.googletagmanager.com https://maps.googleapis.com",
  "font-src 'self' https://fonts.gstatic.com",
  "connect-src 'self' https://spaceaiapp.com https://www.google-analytics.com https://www.googletagmanager.com https://analytics.google.com",
  "frame-src 'self' https://www.google.com https://www.youtube.com https://www.googletagmanager.com",
  "object-src 'none'",
  "base-uri 'self'",
  "form-action 'self' https://wa.me",
  "frame-ancestors 'self'",
].join("; ");
```

---

### Task 2: Skip-to-content link in layout.tsx

**File:** `app/layout.tsx`

**BEFORE:**
```tsx
<body className={`${inter.variable} antialiased bg-[#f8f9fa]`}>
  <Header />
  <main role="main">
    {children}
  </main>
  <Footer />
</body>
```

**AFTER:**
```tsx
<body className={`${inter.variable} antialiased bg-[#f8f9fa]`}>
  <a href="#main-content" className="sr-only focus:not-sr-only min-h-[44px] min-w-[44px] sm:min-h-auto sm:min-w-auto">
    Skip to content
  </a>
  <Header />
  <main id="main-content" role="main">
    {children}
  </main>
  <Footer />
</body>
```

---

### Task 3: Color contrast on muted text

**File:** `app/globals.css`

**BEFORE:**
```css
:root {
  --muted: #6b7280;
}
```

**AFTER:**
```css
:root {
  --muted: #6b7280;
}

.text-accessible-muted {
  color: #4b5563;
}
```

**File:** `app/components/Footer.tsx`

**BEFORE:**
```tsx
<p className="text-sm leading-6 text-gray-600">
```

**AFTER:**
```tsx
<p className="text-sm leading-6 text-gray-700">
```

**BEFORE:**
```tsx
<a className="text-sm text-gray-600 transition-colors hover:text-[#2563eb]">
```

**AFTER:**
```tsx
<a className="text-sm text-gray-700 transition-colors hover:text-[#2563eb]">
```

**File:** `app/components/Header.tsx`

**BEFORE:**
```tsx
<p className="text-xs text-gray-600">
```

**AFTER:**
```tsx
<p className="text-xs text-gray-700">
```

---

### Task 4: Source maps in next.config.ts

**File:** `next.config.ts`

**BEFORE:**
```typescript
// Source maps potentially exposed
```

**AFTER:**
```typescript
productionBrowserSourceMaps: false,
```

---

### Task 5: Console errors audit

**Steps:**
1. Run `npm run dev`
2. Open browser DevTools Console
3. Navigate to `/`, `/pricing`, `/demo`, `/get-started`, `/blog`, `/features`
4. Check for CORS errors, failed GraphQL queries, hydration mismatches, missing images

---

## High Priority — 8 Tasks

### Task 6: LCP optimization on homepage

**File:** `app/layout.tsx`

**BEFORE:**
```tsx
<head>
  <link rel="dns-prefetch" href="https://fonts.gstatic.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
</head>
```

**AFTER:**
```tsx
<head>
  <link rel="dns-prefetch" href="https://fonts.gstatic.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
  <link rel="preload" href="/icononly_transparent_nobuffer.png" as="image" />
</head>
```

**File:** `app/components/HeroSection.tsx`

**BEFORE:**
```tsx
<div className="inline-flex items-center px-3 sm:px-4 py-1.5 sm:py-2 rounded-full bg-white border border-gray-200 shadow-sm mb-8 animate-fade-in">
```

**AFTER:**
```tsx
<div className="inline-flex items-center px-3 sm:px-4 py-1.5 sm:py-2 rounded-full bg-white border border-gray-200 shadow-sm mb-8">
```

---

### Task 7: WhatsApp widget deferred loading

**File:** `app/components/LazyWhatsAppButton.tsx`

**BEFORE:**
```tsx
import WhatsAppButton from "./WhatsAppButton";

export default function LazyWhatsAppButton() {
  return <WhatsAppButton />;
}
```

**AFTER:**
```tsx
import dynamic from "next/dynamic";

const WhatsAppButton = dynamic(() => import("./WhatsAppButton"), {
  ssr: false,
});

export default function LazyWhatsAppButton() {
  return <WhatsAppButton />;
}
```

---

### Task 8: Aria-labels on icon-only buttons

**File:** `app/components/Header.tsx`

**BEFORE:**
```tsx
<button className="...">
  <PhoneIcon />
</button>
```

**AFTER:**
```tsx
<button className="..." aria-label="Contact Us">
  <PhoneIcon />
</button>
```

**BEFORE:**
```tsx
<button className="...">
  <EcosystemIcon />
</button>
```

**AFTER:**
```tsx
<button className="..." aria-label="Ecosystem">
  <EcosystemIcon />
</button>
```

**BEFORE:**
```tsx
<button className="..." aria-expanded={mobileMenuOpen}>
  <MenuIcon />
</button>
```

**AFTER:**
```tsx
<button className="..." aria-label="Toggle mobile menu" aria-expanded={mobileMenuOpen}>
  <MenuIcon />
</button>
```

**File:** `app/components/WhatsAppButton.tsx`

**BEFORE:**
```tsx
<a href={`https://wa.me/${whatsappNumber}?text=${encodeURIComponent(message)}`} target="_blank" rel="noopener noreferrer" className="...">
```

**AFTER:**
```tsx
<a href={`https://wa.me/${whatsappNumber}?text=${encodeURIComponent(message)}`} target="_blank" rel="noopener noreferrer" className="..." aria-label="Chat on WhatsApp">
```

**File:** `app/components/Footer.tsx`

**BEFORE:**
```tsx
<a href="https://x.com/spacenexus111" ...>
<a href="https://www.instagram.com/spacenexus618/" ...>
<a href="https://www.youtube.com/@spacenexus-b5p" ...>
<a href="https://www.linkedin.com/company/space-nexus" ...>
<Link href="/social-media-platforms" ...>
```

**AFTER:**
```tsx
<a href="https://x.com/spacenexus111" ... aria-label="X/Twitter">
<a href="https://www.instagram.com/spacenexus618/" ... aria-label="Instagram">
<a href="https://www.youtube.com/@spacenexus-b5p" ... aria-label="YouTube">
<a href="https://www.linkedin.com/company/space-nexus" ... aria-label="LinkedIn">
<Link href="/social-media-platforms" ... aria-label="Social Media Platforms">
```

---

### Task 9: Explicit dimensions on screenshots

**File:** `app/components/VDRScreenshotGallery.tsx`

**BEFORE:**
```tsx
<Image
  src="/spacenexus/screenshots/dashboard.png"
  alt="SpaceNexus Dashboard"
/>
```

**AFTER:**
```tsx
<Image
  src="/spacenexus/screenshots/dashboard.png"
  alt="SpaceNexus Dashboard"
  width={800}
  height={600}
  style={{ width: '100%', height: 'auto' }}
/>
```

Or with fill prop:
```tsx
<div style={{ position: 'relative', aspectRatio: '16/9' }}>
  <Image
    src="/spacenexus/screenshots/dashboard.png"
    alt="SpaceNexus Dashboard"
    fill
    sizes="(max-width: 768px) 100vw, 50vw"
  />
</div>
```

---

### Task 10: Preconnect for Apollo GraphQL endpoint

**File:** `app/layout.tsx`

**BEFORE:**
```tsx
<head>
  <link rel="dns-prefetch" href="https://fonts.gstatic.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
</head>
```

**AFTER:**
```tsx
<head>
  <link rel="dns-prefetch" href="https://fonts.gstatic.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
  <link rel="dns-prefetch" href="https://spaceaiapp.com" />
  <link rel="preconnect" href="https://spaceaiapp.com" crossOrigin="anonymous" />
</head>
```

---

### Task 11: Article schema for blog posts

**File:** `app/blog/[slug]/page.tsx`

**BEFORE:**
```tsx
import type { Metadata } from "next";

export default async function BlogPost({ params }: { params: { slug: string } }) {
  const post = await getPost(params.slug);

  return (
    <>
      {/* No structured data */}
      <article>...</article>
    </>
  );
}
```

**AFTER:**
```tsx
import type { Metadata } from "next";

function generateArticleSchema(post: {
  title: string;
  excerpt: string;
  publishedAt: string;
  updatedAt: string;
  coverImage: string;
  author?: string;
}) {
  return {
    "@context": "https://schema.org",
    "@type": "Article",
    headline: post.title,
    description: post.excerpt,
    author: {
      "@type": "Organization",
      name: post.author || "SpaceNexus",
    },
    publisher: {
      "@type": "Organization",
      name: "SpaceNexus",
      logo: {
        "@type": "ImageObject",
        url: "https://spacenexus.net/logo.png",
      },
    },
    datePublished: post.publishedAt,
    dateModified: post.updatedAt,
    image: post.coverImage,
    mainEntityOfPage: {
      "@type": "WebPage",
      "@id": "https://spacenexus.net",
    },
  };
}

export default async function BlogPost({ params }: { params: { slug: string } }) {
  const post = await getPost(params.slug);
  const articleSchema = generateArticleSchema(post);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(articleSchema) }}
      />
      <article>...</article>
    </>
  );
}
```

---

### Task 12: Keyboard trap in Header dropdowns

**File:** `app/components/Header.tsx`

**BEFORE:**
```tsx
export default function Header() {
  const [productsOpen, setProductsOpen] = useState(false);
  const [industriesOpen, setIndustriesOpen] = useState(false);
  const [contactOpen, setContactOpen] = useState(false);
  const [ecosystemOpen, setEcosystemOpen] = useState(false);

  // No Escape key handler
}
```

**AFTER:**
```tsx
export default function Header() {
  const [productsOpen, setProductsOpen] = useState(false);
  const [industriesOpen, setIndustriesOpen] = useState(false);
  const [contactOpen, setContactOpen] = useState(false);
  const [ecosystemOpen, setEcosystemOpen] = useState(false);

  const handleEscapeKey = (e: KeyboardEvent) => {
    if (e.key === 'Escape') {
      setProductsOpen(false);
      setIndustriesOpen(false);
      setContactOpen(false);
      setEcosystemOpen(false);
    }
  };

  useEffect(() => {
    document.addEventListener('keydown', handleEscapeKey);
    return () => document.removeEventListener('keydown', handleEscapeKey);
  }, []);
}
```

**BEFORE:**
```tsx
<button className="...">
```

**AFTER:**
```tsx
<button className="..." aria-expanded={productsOpen} aria-haspopup="true">
```

---

### Task 13: Focus-visible styles globally

**File:** `app/globals.css`

**BEFORE:**
```css
/* No focus-visible styles */
```

**AFTER:**
```css
button:focus-visible,
a:focus-visible {
  outline: 2px solid var(--primary);
  outline-offset: 2px;
}
```

---

## Medium Priority — 10 Tasks

### Task 14: Lazy load solution and industry pages

**File:** `app/solutions/[slug]/page.tsx`

**BEFORE:**
```tsx
export default async function SolutionPage({ params }: { params: { slug: string } }) {
  const solution = await getSolution(params.slug);
  return <SolutionContent solution={solution} />;
}
```

**AFTER:**
```tsx
import dynamic from "next/dynamic";

const SolutionContent = dynamic(() => import("./SolutionContent"), {
  loading: () => (
    <div className="animate-pulse">
      <div className="h-8 bg-gray-200 rounded w-1/3 mb-4"></div>
      <div className="h-4 bg-gray-200 rounded w-full mb-2"></div>
      <div className="h-4 bg-gray-200 rounded w-5/6 mb-2"></div>
    </div>
  ),
  ssr: false,
});

export default async function SolutionPage({ params }: { params: { slug: string } }) {
  return <SolutionContent slug={params.slug} />;
}
```

**File:** `app/industries/[slug]/page.tsx`

**BEFORE:**
```tsx
export default async function IndustryPage({ params }: { params: { slug: string } }) {
  const industry = await getIndustry(params.slug);
  return <IndustryContent industry={industry} />;
}
```

**AFTER:**
```tsx
import dynamic from "next/dynamic";

const IndustryContent = dynamic(() => import("./IndustryContent"), {
  loading: () => (
    <div className="animate-pulse">
      <div className="h-8 bg-gray-200 rounded w-1/3 mb-4"></div>
      <div className="h-4 bg-gray-200 rounded w-full mb-2"></div>
    </div>
  ),
  ssr: false,
});

export default async function IndustryPage({ params }: { params: { slug: string } }) {
  return <IndustryContent slug={params.slug} />;
}
```

---

### Task 15: Replace Framer Motion with CSS animations

**File:** `app/components/TestimonialsSection.tsx`

**BEFORE:**
```tsx
import { motion } from "framer-motion";

<motion.div
  initial={{ opacity: 0, y: 20 }}
  animate={{ opacity: 1, y: 0 }}
  transition={{ duration: 0.5 }}
>
  <TestimonialCard />
</motion.div>
```

**AFTER:**
```tsx
<div className="animate-fade-in" style={{ animationDelay: "0.2s" }}>
  <TestimonialCard />
</div>
```

**File:** `app/components/FAQSection.tsx`

**BEFORE:**
```tsx
import { motion } from "framer-motion";

<motion.div
  initial={{ opacity: 0 }}
  animate={{ opacity: 1 }}
  transition={{ duration: 0.3 }}
>
  <FAQItem />
</motion.div>
```

**AFTER:**
```tsx
<div className="animate-fade-in">
  <FAQItem />
</div>
```

**File:** `app/components/BenefitsSection.tsx`

**BEFORE:**
```tsx
import { motion } from "framer-motion";

<motion.div
  initial={{ opacity: 0, y: 10 }}
  whileInView={{ opacity: 1, y: 0 }}
  viewport={{ once: true }}
>
  <BenefitCard />
</motion.div>
```

**AFTER:**
```tsx
<div className="animate-fade-in">
  <BenefitCard />
</div>
```

---

### Task 16: Font preloading for non-Latin subsets

**File:** `app/layout.tsx`

**BEFORE:**
```tsx
<head>
  <link rel="dns-prefetch" href="https://fonts.gstatic.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
</head>
```

**AFTER:**
```tsx
<head>
  <link rel="dns-prefetch" href="https://fonts.gstatic.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
  <link
    rel="preload"
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;700&display=swap"
    as="style"
  />
  <link
    rel="preload"
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+Arabic:wght@400;500;700&display=swap"
    as="style"
  />
  <link
    rel="preload"
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
    as="style"
  />
</head>
```

---

### Task 17: Extract critical above-fold CSS

**File:** `app/layout.tsx`

**BEFORE:**
```tsx
<head>
  {/* No inline critical CSS */}
</head>
```

**AFTER:**
```tsx
<head>
  <style dangerouslySetInnerHTML={{ __html: `
    body {
      margin: 0;
      padding: 0;
      background: #f8f9fa;
      color: #1a1a1a;
      font-family: var(--font-inter), system-ui, -apple-system, sans-serif;
      line-height: 1.6;
      -webkit-font-smoothing: antialiased;
    }
    .sr-only {
      position: absolute;
      width: 1px;
      height: 1px;
      padding: 0;
      margin: -1px;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      white-space: nowrap;
      border-width: 0;
    }
  `}} />
</head>
```

---

### Task 18: Enable ISR for blog and solution pages

**File:** `app/blog/[slug]/page.tsx`

**BEFORE:**
```tsx
import type { Metadata } from "next";

export default async function BlogPost({ params }: { params: { slug: string } }) {
```

**AFTER:**
```tsx
import type { Metadata } from "next";

export const revalidate = 86400;

export default async function BlogPost({ params }: { params: { slug: string } }) {
```

**File:** `app/solutions/[slug]/page.tsx`

**BEFORE:**
```tsx
export default async function SolutionPage({ params }: { params: { slug: string } }) {
```

**AFTER:**
```tsx
export const revalidate = 86400;

export default async function SolutionPage({ params }: { params: { slug: string } }) {
```

**File:** `app/industries/[slug]/page.tsx`

**BEFORE:**
```tsx
export default async function IndustryPage({ params }: { params: { slug: string } }) {
```

**AFTER:**
```tsx
export const revalidate = 86400;

export default async function IndustryPage({ params }: { params: { slug: string } }) {
```

---

### Task 19: Optimize demo video delivery

**File:** `app/demo/page.tsx`

**BEFORE:**
```tsx
<video controls className="w-full rounded-lg shadow-lg">
  <source src="/demo-video.mp4" type="video/mp4" />
</video>
```

**AFTER:**
```tsx
<video
  poster="/demo-poster.jpg"
  controls
  preload="none"
  className="w-full rounded-lg shadow-lg"
>
  <source src="/demo-video.mp4" type="video/mp4" />
  Your browser does not support the video tag.
</video>
```

---

### Task 20: Internal linking depth with Breadcrumb component

**File:** Create `app/components/Breadcrumb.tsx`

**BEFORE:**
```tsx
// No breadcrumb component exists
```

**AFTER:**
```tsx
import Link from "next/link";

type BreadcrumbItem = {
  name: string;
  href?: string;
};

export default function Breadcrumb({ items }: { items: BreadcrumbItem[] }) {
  return (
    <nav aria-label="Breadcrumb" className="py-4">
      <ol className="flex items-center space-x-2 text-sm text-gray-600">
        <li>
          <Link href="/" className="hover:text-[#2563eb] transition-colors">
            Home
          </Link>
        </li>
        {items.map((item, index) => (
          <li key={index} className="flex items-center">
            <span className="mx-2">/</span>
            {item.href ? (
              <Link href={item.href} className="hover:text-[#2563eb] transition-colors">
                {item.name}
              </Link>
            ) : (
              <span className="text-gray-900 font-medium">{item.name}</span>
            )}
          </li>
        ))}
      </ol>
    </nav>
  );
}
```

---

### Task 21: FAQ schema for feature pages

**File:** `app/features/[feature]/page.tsx`

**BEFORE:**
```tsx
export default async function FeaturePage({ params }: { params: { feature: string } }) {
  const feature = await getFeature(params.feature);

  return (
    <>
      {/* No FAQPage schema */}
      <article>...</article>
    </>
  );
}
```

**AFTER:**
```tsx
function generateFAQSchema(faqs: Array<{ question: string; answer: string }>) {
  return {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: faqs.map((faq) => ({
      "@type": "Question",
      name: faq.question,
      acceptedAnswer: {
        "@type": "Answer",
        text: faq.answer,
      },
    })),
  };
}

export default async function FeaturePage({ params }: { params: { feature: string } }) {
  const feature = await getFeature(params.feature);
  const faqSchema = feature.faqs ? generateFAQSchema(feature.faqs) : null;

  return (
    <>
      {faqSchema && (
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(faqSchema) }}
        />
      )}
      <article>...</article>
    </>
  );
}
```

---

### Task 22: Fix duplicate/missing title tags on feature pages

**File:** `app/features/[feature]/page.tsx`

**BEFORE:**
```tsx
import type { Metadata } from "next";

// No generateMetadata function
// Generic or duplicate titles
```

**AFTER:**
```tsx
import type { Metadata } from "next";

export async function generateMetadata({ params }: { params: { feature: string } }): Promise<Metadata> {
  const featureName = params.feature
    .split('-')
    .map(w => w.charAt(0).toUpperCase() + w.slice(1))
    .join(' ');
  
  return {
    title: `${featureName} | SpaceNexus Virtual Data Room`,
    description: `Learn about SpaceNexus ${featureName} feature for secure document management and collaboration.`,
    openGraph: {
      title: `${featureName} | SpaceNexus`,
      description: `Learn about SpaceNexus ${featureName} feature for secure document management.`,
    },
  };
}
```

---

### Task 23: Crawl for broken links

**Steps:**

```bash
npm install -g broken-link-checker
npm run dev
blc http://localhost:3000 -ro
```

Or use:
- https://www.deadlinkchecker.com/
- https://ahrefs.com/broken-link-checker

---

## Low Priority — 7 Tasks

### Task 24: Remove default Next.js SVGs

**Files to delete:**

```bash
rm public/file.svg
rm public/globe.svg
rm public/next.svg
rm public/vercel.svg
rm public/window.svg
```

**Verify not referenced:**
```bash
grep -r "file.svg" app/ components/ pages/
grep -r "globe.svg" app/ components/ pages/
grep -r "next.svg" app/ components/ pages/
grep -r "vercel.svg" app/ components/ pages/
grep -r "window.svg" app/ components/ pages/
```

---

### Task 25: Audit will-change usage

**File:** `app/globals.css`

**BEFORE:**
```css
.animate-fade-in {
  animation: fadeIn 0.5s ease-out forwards;
  will-change: opacity, transform;
}

.animate-slide-in-right {
  animation: slideInRight 0.3s ease-out forwards;
  will-change: transform;
}

.card-hover:hover {
  transform: translateY(-2px);
  box-shadow: 0 20px 40px -15px rgba(59, 130, 246, 0.15);
  will-change: transform;
}
```

**AFTER:**
```css
.animate-fade-in {
  animation: fadeIn 0.5s ease-out forwards;
}

.animate-slide-in-right {
  animation: slideInRight 0.3s ease-out forwards;
}

.card-hover {
  transition: all 0.3s ease;
}

.card-hover:hover {
  transform: translateY(-2px);
  box-shadow: 0 20px 40px -15px rgba(59, 130, 246, 0.15);
  will-change: transform;
}
```

---

### Task 26: Add role="banner" and role="contentinfo"

**File:** `app/components/Header.tsx`

**BEFORE:**
```tsx
<header className={`...`}>
```

**AFTER:**
```tsx
<header className={`...`} role="banner">
```

**File:** `app/components/Footer.tsx`

**BEFORE:**
```tsx
<footer className="bg-white text-gray-900">
```

**AFTER:**
```tsx
<footer className="bg-white text-gray-900" role="contentinfo">
```

---

### Task 27: Subset Inter font

**File:** `app/layout.tsx`

**BEFORE:**
```tsx
const inter = Inter({
  variable: "--font-inter",
  subsets: ["latin"],
  display: "swap",
});
```

**AFTER:**
```tsx
const inter = Inter({
  variable: "--font-inter",
  subsets: ["latin"],
  display: "swap",
});
```

Note: Already correctly subsetted to Latin only.

---

### Task 28: prefers-reduced-motion coverage

**File:** `app/globals.css`

**BEFORE:**
```css
/* No reduced motion styles */
```

**AFTER:**
```css
@media (prefers-reduced-motion: reduce) {
  .animate-fade-in,
  .animate-pulse-subtle,
  .animate-shimmer {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
    will-change: auto !important;
  }

  .animate-ping,
  .animate-pulse {
    animation: none !important;
    opacity: 1 !important;
  }

  * {
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

---

### Task 29: Add lastmod to robots.txt sitemap references

**File:** `app/robots.ts`

**BEFORE:**
```typescript
import type { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: "*",
        allow: "/",
        disallow: ["/api/", "/admin/", "/private/"],
      },
    ],
    sitemap: ["https://spacenexus.net/sitemap.xml"],
    host: "https://spacenexus.net",
  };
}
```

**AFTER:**
```typescript
import type { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  const baseUrl = "https://spacenexus.net";
  const currentDate = new Date().toISOString();
  
  return {
    rules: [
      {
        userAgent: "*",
        allow: "/",
        disallow: ["/api/", "/admin/", "/private/"],
      },
    ],
    sitemap: [
      `${baseUrl}/sitemap.xml`,
      `${baseUrl}/kindora/sitemap.xml`,
    ],
    host: baseUrl,
    lastModified: currentDate,
  };
}
```

---

### Task 30: Clean up unused CSS utility classes

**Steps:**

```bash
npx tailwindcss -i app/globals.css -o /dev/null --minify
grep -r "text-gradient" app/ components/
grep -r "glass" app/ components/
grep -r "gradient-radial" app/ components/
```

Review `app/globals.css` for unused classes:
- `.text-gradient`
- `.glass`
- `.gradient-radial`

Remove any classes not referenced in the codebase.
