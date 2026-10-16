# Competitor-Based Tasks — Detailed Code Changes

## Disk Audit

| Directory | Files on Disk |
|-----------|--------------|
| `app/competitors/` | 17 pages (12 alternative + 4 plural alternatives + hub) |
| `app/compare/` | 15 pages (11 vs + 3 competitor-vs-competitor + index) |
| **Total** | **32 page files** |

---

## Existing Page Patterns

### Pattern A: Singular Alternative Page (`/competitors/[competitor]-alternative`)

**Reference:** `app/competitors/firmex-alternative/page.tsx` (529 lines)

**Metadata:**
```tsx
export const metadata: Metadata = {
    title: "Firmex Alternative | SpaceNexus",
    description: "SpaceNexus vs Firmex: feature-by-feature comparison. AI-powered document management, transparent pricing, modern UX for M&A due diligence.",
    alternates: {
        canonical: "https://spacenexus.net/competitors/firmex-alternative",
    },
    openGraph: {
        title: "Firmex Alternative | SpaceNexus",
        description: "SpaceNexus vs Firmex: AI-powered VDR with transparent pricing, modern UX, and faster setup. See why teams are switching.",
        url: "https://spacenexus.net/competitors/firmex-alternative",
    },
    keywords: [
        "Firmex alternative",
        "Firmex competitor",
        "alternative to Firmex",
        "Firmex vs SpaceNexus",
        "switch from Firmex",
        "M&A due diligence software",
        "virtual data room alternative",
    ],
};
```

**Schema (`@graph` with BreadcrumbList + SoftwareApplication):**
```tsx
<script
    type="application/ld+json"
    dangerouslySetInnerHTML={{
        __html: JSON.stringify({
            "@context": "https://schema.org",
            "@graph": [
                {
                    "@type": "BreadcrumbList",
                    itemListElement: [
                        { "@type": "ListItem", position: 1, name: "Home", item: "https://spacenexus.net" },
                        { "@type": "ListItem", position: 2, name: "Competitors", item: "https://spacenexus.net/competitors/vdr-alternatives" },
                        { "@type": "ListItem", position: 3, name: "Firmex Alternative", item: "https://spacenexus.net/competitors/firmex-alternative" },
                    ],
                },
                {
                    "@type": "SoftwareApplication",
                    name: "SpaceNexus Virtual Data Room",
                    applicationCategory: "BusinessApplication",
                    url: "https://spacenexus.net",
                    aggregateRating: {
                        "@type": "AggregateRating",
                        ratingValue: "4.9",
                        reviewCount: "500",
                        bestRating: "5",
                        worstRating: "1",
                    },
                    review: [
                        {
                            "@type": "Review",
                            reviewRating: { "@type": "Rating", ratingValue: "5", bestRating: "5" },
                            author: { "@type": "Person", name: "David Park" },
                            reviewBody: "We migrated from Firmex to SpaceNexus and immediately noticed the difference...",
                            datePublished: "2025-12-10",
                        },
                        {
                            "@type": "Review",
                            reviewRating: { "@type": "Rating", ratingValue: "5", bestRating: "5" },
                            author: { "@type": "Person", name: "Lisa Chang" },
                            reviewBody: "SpaceNexus replaced Firmex for our PE firm's due diligence workflow...",
                            datePublished: "2026-01-18",
                        },
                    ],
                },
            ],
        }),
    }}
/>
```

**Comparison rows (8 rows):**
```tsx
const comparisonRows = [
    { feature: "AI Document Redaction", spacenexus: { value: "Built-in, one-click", positive: true }, firmex: { value: "Not available", positive: false } },
    { feature: "AI Auto-Categorization", spacenexus: { value: "Automatic on upload", positive: true }, firmex: { value: "Manual indexing only", positive: false } },
    { feature: "Transparent Pricing", spacenexus: { value: "Published monthly pricing", positive: true }, firmex: { value: "Quote-based, opaque", positive: false } },
    { feature: "Q&A Workflow Management", spacenexus: { value: "Structured, assigned, tracked", positive: true }, firmex: { value: "Basic Q&A module", positive: false } },
    { feature: "Buyer Engagement Analytics", spacenexus: { value: "Real-time per-user heatmaps", positive: true }, firmex: { value: "Basic access logs only", positive: false } },
    { feature: "Setup Time", spacenexus: { value: "Live in under 24 hours", positive: true }, firmex: { value: "1–3 days with onboarding", positive: false } },
    { feature: "SOC 2 Type II", spacenexus: { value: "✓ Certified", positive: true }, firmex: { value: "✓ Certified", positive: true } },
    { feature: "Minimum Contract", spacenexus: { value: "Monthly — no lock-in", positive: true }, firmex: { value: "Annual contracts required", positive: false } },
];
```

**Why Switch reasons (4 cards):**
```tsx
const reasons = [
    { icon: "M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z", title: "Transparent Pricing — No Hidden Fees", description: "SpaceNexus publishes all pricing upfront..." },
    { icon: "M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z", title: "AI Copilot — Not an Afterthought", description: "Every SpaceNexus plan includes AI-powered..." },
    { icon: "M13 10V3L4 14h7v7l9-11h-7z", title: "Go Live in Hours, Not Days", description: "Upload documents, configure permissions..." },
    { icon: "M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z", title: "Real-Time Buyer Intelligence", description: "SpaceNexus shows exactly which documents..." },
];
```

**Page sections:**
1. Hero (badge + H1 + 2 CTAs)
2. `AnswerBlock`
3. "Why Switch" (4 cards)
4. Feature comparison table (8 rows)
5. "Who Should Switch" (2-column pros/cons)
6. Screenshot callout (browser frame)
7. Migration path (4 steps)
8. Social proof (2 testimonials)
9. Related comparisons
10. CTA
11. `LastUpdated`

---

### Pattern B: You vs Competitor Page (`/compare/spacenexus-vs-[competitor]`)

**Reference:** `app/compare/spacenexus-vs-firmex/page.tsx` (329 lines)

**Metadata:**
```tsx
export const metadata: Metadata = {
    title: "SpaceNexus vs Firmex | Feature Comparison 2026",
    description: "SpaceNexus vs Firmex: side-by-side comparison of features, pricing, support, and ease of use. See which VDR is right for your deal team.",
    alternates: {
        canonical: "https://spacenexus.net/compare/spacenexus-vs-firmex",
    },
    openGraph: {
        title: "SpaceNexus vs Firmex | Feature Comparison 2026",
        description: "Side-by-side comparison of SpaceNexus vs Firmex. AI-powered VDR with transparent pricing vs legacy VDR with opaque quotes.",
        url: "https://spacenexus.net/compare/spacenexus-vs-firmex",
    },
    keywords: [
        "spacenexus vs firmex",
        "firmex vs spacenexus",
        "spacenexus firmex comparison",
        "best VDR 2026",
        "virtual data room comparison",
    ],
};
```

**Comparison table (10 rows):**
```tsx
const comparisonTable = [
    { feature: "AI Document Redaction", spacenexus: "Built-in, one-click", firmex: "Not available" },
    { feature: "AI Auto-Categorization", spacenexus: "Automatic on upload", firmex: "Manual indexing only" },
    { feature: "Transparent Pricing", spacenexus: "Published monthly pricing", firmex: "Quote-based, opaque" },
    { feature: "Q&A Workflow", spacenexus: "Structured, assigned, tracked", firmex: "Basic Q&A module" },
    { feature: "Buyer Analytics", spacenexus: "Real-time per-user heatmaps", firmex: "Basic access logs" },
    { feature: "Setup Time", spacenexus: "Under 24 hours", firmex: "1–3 days with onboarding" },
    { feature: "SOC 2 Type II", spacenexus: "✓ Certified", firmex: "✓ Certified" },
    { feature: "Minimum Contract", spacenexus: "Monthly — no lock-in", firmex: "Annual contracts" },
    { feature: "UI/UX", spacenexus: "Modern, intuitive", firmex: "Dated, legacy interface" },
    { feature: "Customer Support", spacenexus: "Dedicated account manager", firmex: "Standard support" },
];
```

**Detailed comparison (5 categories):**
```tsx
const detailedComparison = [
    { category: "Features", spacenexus: "...", firmex: "..." },
    { category: "Pricing", spacenexus: "...", firmex: "..." },
    { category: "Support", spacenexus: "...", firmex: "..." },
    { category: "Ease of Use", spacenexus: "...", firmex: "..." },
    { category: "Integrations", spacenexus: "...", firmex: "..." },
];
```

**Page sections:**
1. TL;DR summary (badge + H1 + 2 CTAs)
2. `AnswerBlock`
3. At-a-glance comparison table
4. Detailed comparison by category
5. "Who is best for" (2-column)
6. Customer testimonials (2)
7. Migration support (3 cards)
8. CTA
9. `LastUpdated`

---

### Pattern C: Plural Alternatives Page (`/competitors/[competitor]-alternatives`)

**Reference:** `app/competitors/firmex-alternatives/page.tsx`

**Metadata:**
```tsx
export const metadata: Metadata = {
    title: "Firmex Alternatives 2026 | SpaceNexus",
    description: "Compare the best Firmex alternatives. AI-powered features, transparent pricing, modern UX. See why teams are switching.",
    alternates: {
        canonical: "https://spacenexus.net/competitors/firmex-alternatives",
    },
    keywords: [
        "firmex alternatives",
        "best firmex alternatives",
        "tools like firmex",
        "firmex competitor",
    ],
};
```

**Page sections:**
1. Hero (badge + H1 + value prop)
2. `AnswerBlock`
3. Pain points (why people look for alternatives)
4. Criteria framework (what to look for)
5. Alternatives list (SpaceNexus first, then 4-6 competitors)
6. Comparison table
7. Detailed breakdown of each alternative
8. Use case recommendations
9. FAQ section
10. CTA
11. `LastUpdated`

---

### Pattern D: Competitor vs Competitor Page (`/compare/[competitor-a]-vs-[competitor-b]`)

**Reference:** `app/compare/firmex-vs-sharefile/page.tsx`

**Metadata:**
```tsx
export const metadata: Metadata = {
    title: "Firmex vs ShareFile | Comparison 2026",
    description: "Compare Firmex vs ShareFile side-by-side. Features, pricing, and use case recommendations.",
    alternates: {
        canonical: "https://spacenexus.net/compare/firmex-vs-sharefile",
    },
    keywords: [
        "firmex vs sharefile",
        "sharefile vs firmex",
    ],
};
```

**Page sections:**
1. TL;DR summary (badge + H1)
2. `AnswerBlock`
3. At-a-glance comparison table
4. Detailed comparison by category
5. Who each is best for (2-column)
6. The third option (introduce SpaceNexus)
7. Three-way comparison table
8. CTA
9. `LastUpdated`

---

### Pattern E: Hub Page (`/competitors/vdr-alternatives`)

**Reference:** `app/competitors/vdr-alternatives/page.tsx` (640 lines)

**Providers (6):**
```tsx
const providers = [
    { name: "SpaceNexus", highlight: true, link: "/demo", linkText: "Try SpaceNexus Free", pros: [...6], cons: [...] },
    { name: "Datasite (fka Merrill Datasites)", highlight: false, link: "/competitors/datasite-alternative", linkText: "SpaceNexus vs Datasite →", pros: [...3], cons: [...] },
    { name: "Intralinks (SS&C)", highlight: false, link: "/competitors/intralinks-alternative", linkText: "SpaceNexus vs Intralinks →", pros: [...3], cons: [...] },
    { name: "Firmex", highlight: false, link: null, pros: [...3], cons: [...] },
    { name: "iDeals", highlight: false, link: null, pros: [...3], cons: [...] },
    { name: "Ansarada", highlight: false, link: null, pros: [...3], cons: [...] },
];
```

**Feature comparison (15 rows):**
```tsx
const comparisonFeatures = [
    { feature: "AI Document Redaction", values: ["✓", "Add-on", "✗", "✗", "✗", "✗"] },
    { feature: "AI Auto-Categorization", values: ["✓", "✗", "✗", "✗", "✗", "✗"] },
    { feature: "Structured Q&A Workflow", values: ["✓", "Basic", "Basic", "Basic", "✓", "✓"] },
    { feature: "Real-Time Buyer Analytics", values: ["✓", "Add-on", "✓", "Basic", "✓", "✓"] },
    { feature: "Dynamic Watermarking", values: ["✓", "✓", "✓", "✓", "✓", "✓"] },
    { feature: "SOC 2 Type II", values: ["✓", "✓", "✓", "✓", "✓", "✓"] },
    { feature: "ISO 27001", values: ["✓", "✓", "✓", "✓", "✓", "✓"] },
    { feature: "SEC/FINRA Ready", values: ["✓", "✓", "✓", "✗", "✗", "✗"] },
    { feature: "Transparent Pricing", values: ["✓", "✗", "✗", "Partial", "Partial", "Partial"] },
    { feature: "No Per-Page Charges", values: ["✓", "✗", "✗", "✓", "✓", "✓"] },
    { feature: "Setup Under 24 Hours", values: ["✓", "✗", "✗", "✓", "✓", "✓"] },
    { feature: "Unlimited Users", values: ["✓", "✗", "✗", "✗", "✓", "Plan-dependent"] },
    { feature: "NDA Click-Through Gate", values: ["✓", "✓", "✓", "✓", "✓", "✓"] },
    { feature: "Ethical Wall / Privilege Mgmt", values: ["✓", "✓", "✓", "✗", "✗", "✗"] },
    { feature: "Monthly Contracts", values: ["✓", "✗", "✗", "✓", "✓", "✓"] },
];
```

**3 Schemas:**
```tsx
const faqSchema = { "@context": "https://schema.org", "@type": "FAQPage", mainEntity: [...] };
const breadcrumbSchema = { "@context": "https://schema.org", "@type": "BreadcrumbList", itemListElement: [...] };
const itemListSchema = { "@context": "https://schema.org", "@type": "ItemList", numberOfItems: 6, itemListElement: [...] };
```

**Page sections:**
1. Hero (badge + H1 + 2 CTAs)
2. `AnswerBlock`
3. Provider cards (6 cards, 3-col grid)
4. Feature comparison table (15 rows, sticky header)
5. "How to choose" (prose)
6. Use case recommendations (6 cards, 2-col grid)
7. FAQ (5 questions)
8. Related links
9. CTA
10. `LastUpdated`

---

## Shared Components

| Component | Import | Purpose |
|-----------|--------|---------|
| `LastUpdated` | `../../components/LastUpdated` | "Last updated: [date]" |
| `AnswerBlock` | `../../components/AnswerBlock` | AI-optimized answer snippet |
| `Link` | `next/link` | Internal navigation |
| `Image` | `next/image` | Optimized images |
| `Script` | `next/script` | JSON-LD schema injection |

---

## Design Tokens

| Token | Value | Usage |
|-------|-------|-------|
| Primary blue | `#2563eb` | CTAs, links, branding |
| Hover blue | `#1d4ed8` | CTA hover |
| Light blue | `#60a5fa` | SpaceNexus in dark tables |
| Background | `#f8f9fa` | Section backgrounds |
| Green | `text-green-700` / `bg-green-50` | Strengths, checkmarks |
| Red | `text-red-600` / `bg-red-50` | Limitations, X marks |
| Orange | `text-orange-600` / `bg-orange-50` | "Might be better if" |
| Gray | `text-gray-600` | Body text |
| Border radius | `rounded-2xl` | Cards, tables |
| Shadow | `shadow-sm` | Tables, cards |
| Hover shadow | `shadow-lg` | Interactive cards |
