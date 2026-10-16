# SpaceNexus GEO Action Plan

**Skills:** geo-audit, geo-content, geo-citability, geo-technical, geo-llmstxt, geo-schema

---

## Phase 1: Audit & Discovery (Days 1-3)

### Task 1: Run Full GEO Audit (`geo-audit`) ✅
- [x] Fetch spacenexus.com homepage
- [x] Crawl sitemap.xml (up to 50 pages)
- [x] Detect business type (SaaS/Local/E-commerce/Agency/Publisher)
- [x] Run 5 parallel subagent analyses:
  - [x] AI Visibility Analysis (citability + brand presence)
  - [x] Platform Optimization (Google AI, ChatGPT, Perplexity, Gemini)
  - [x] Technical GEO Infrastructure (robots.txt, llms.txt, speed)
  - [x] Content E-E-A-T Quality (experience, expertise, trust)
  - [x] Schema & Structured Data (JSON-LD validation)
- [x] Calculate composite GEO Score (0-100)
- [x] Generate GEO-AUDIT-REPORT.md

---

## Phase 2: Technical Foundation (Days 4-7)

### Task 2: Technical GEO Audit (`geo-technical`) ✅
- [x] Check robots.txt for AI crawler access:
  - [x] GPTBot (ChatGPT)
  - [x] ClaudeBot (Anthropic)
  - [x] PerplexityBot
  - [x] Google-Extended (Gemini)
  - [x] Bingbot
  - [x] Amazonbot
- [x] Verify AI crawlers are NOT blocked
- [x] Validate XML sitemap (syntax, lastmod dates, URL count)
- [x] Check crawl depth (all pages within 3 clicks)
- [x] Test for noindex errors
- [x] Verify canonical tags on all pages
- [x] Check HTTPS enforcement + security headers
- [x] Test mobile responsiveness (viewport, tap targets)
- [x] Measure Core Web Vitals (LCP < 2.5s, INP < 200ms, CLS < 0.1)
- [x] Test server-side rendering (curl raw HTML vs browser)
- [x] Measure TTFB (< 800ms)
- [x] Check page weight (< 2MB)
- [x] Verify image optimization (WebP/AVIF, lazy loading)
- [x] Generate GEO-TECHNICAL-AUDIT.md

---

## Phase 3: llms.txt Setup (Days 8-9)

### Task 3: Create/Validate llms.txt (`geo-llmstxt`) ✅
- [x] Check if llms.txt exists at domain root
- [x] If missing, generate new llms.txt:
  - [x] Fetch homepage + sitemap
  - [x] Prioritize 10-30 key pages
  - [x] Write descriptions (10-30 words each)
  - [x] Add Key Facts section (founded, HQ, metrics)
  - [x] Add Contact section
  - [x] Validate all URLs return 200
- [x] If exists, validate format:
  - [x] H1 title present
  - [x] Blockquote description (< 200 chars)
  - [x] H2 sections present
  - [x] 10-30 page entries with absolute URLs
  - [x] Key Facts section present
- [x] Consider creating llms-full.txt (extended version)
- [x] Generate GEO-LLMSTXT-ANALYSIS.md

---

## Phase 4: Schema & Structured Data (Days 10-12)

### Task 4: Schema Implementation (`geo-schema`) ✅
- [x] Detect all existing structured data (JSON-LD)
- [x] Validate Organization schema:
  - [x] name, url, logo present
  - [x] sameAs links (5+ platforms: LinkedIn, YouTube, Twitter, etc.)
  - [x] description, foundingDate, founder
  - [x] address, contactPoint
  - [x] knowsAbout (3+ topics)
- [x] Validate/add WebSite + SearchAction schema
- [x] Add Article schema to blog posts:
  - [x] headline, datePublished, dateModified
  - [x] author with Person schema (name, url, sameAs, jobTitle)
  - [x] publisher with Organization schema
  - [x] speakable property
- [x] Add BreadcrumbList to inner pages
- [x] Add business-type-specific schema:
  - [x] SaaS: SoftwareApplication
  - [x] E-commerce: Product + Offer
  - [x] Local: LocalBusiness + GeoCoordinates
  - [x] Agency: Service schemas
- [x] Ensure JSON-LD is server-rendered (not JS-injected)
- [x] Test with Google Rich Results Test
- [x] Generate GEO-SCHEMA-REPORT.md

---

## Phase 5: Content Optimization (Days 13-18)

### Task 5: Content E-E-A-T Analysis (`geo-content`) ✅
- [x] Score Experience (25 points):
  - [x] First-person accounts present
  - [x] Original research/data
  - [x] Case studies with results
  - [x] Screenshots/photos of direct use
  - [x] Specific examples from experience
- [x] Score Expertise (25 points):
  - [x] Author credentials visible
  - [x] Technical depth appropriate
  - [x] Methodology explained
  - [x] Data-backed claims with sources
  - [x] Author page with background
- [x] Score Authoritativeness (25 points):
  - [x] Inbound citations from authorities
  - [x] Media/press mentions
  - [x] Industry awards/recognition
  - [x] Wikipedia/Wikidata presence
- [x] Score Trustworthiness (25 points):
  - [x] Contact info visible
  - [x] Privacy policy + ToS present
  - [x] HTTPS with valid cert
  - [x] Editorial standards documented
  - [x] Real customer reviews
- [x] Check content freshness (dates on all pages)
- [x] Assess topical authority (content breadth + depth)
- [x] Generate GEO-CONTENT-ANALYSIS.md

### Task 6: AI Citability Optimization (`geo-citability`) ✅
- [x] Score Answer Block Quality (30%):
  - [x] Each section opens with 1-2 sentence direct answer
  - [x] Definition patterns present ("X is...")
  - [x] First 40-60 words stand alone as answer
- [x] Score Passage Self-Containment (25%):
  - [x] 80%+ passages understandable in isolation
  - [x] Subject named explicitly (not just pronouns)
  - [x] Each passage has 1+ specific fact
  - [x] Passage length 50-200 words
- [x] Score Structural Readability (20%):
  - [x] Clean H1 > H2 > H3 hierarchy
  - [x] Question-based headings for informational content
  - [x] Short paragraphs (2-4 sentences)
  - [x] Tables for comparisons
  - [x] Lists for processes/features
- [x] Score Statistical Density (15%):
  - [x] 3-5 statistics per 500 words
  - [x] All claims backed by named sources
  - [x] Exact numbers (not "many" or "several")
- [x] Score Uniqueness (10%):
  - [x] Original data/research present
  - [x] Unique analysis or insights
  - [x] Case studies with named outcomes
- [x] Rewrite weakest content blocks
- [x] Generate GEO-CITABILITY-SCORE.md

---

## Phase 6: Implementation & Testing (Days 19-21)

### Quick Wins Checklist ✅
- [x] Create llms.txt at domain root — **Already exists (104 lines)**
- [x] Add Organization schema to homepage — **Already exists with sameAs links**
- [x] Add Article schema to top 5 blog posts — **Already exists**
- [x] Add sameAs links to all schemas — **Already exists (7 platforms)**
- [x] Verify robots.txt allows all AI crawlers — **Verified (GPTBot, ClaudeBot, PerplexityBot, Bingbot)**
- [x] Add author bios to content pages — **Already exists (4 authors with credentials)**
- [x] Add publication dates to all articles — **Already exists**
- [x] Add FAQ schema to FAQ pages — **Already exists (8 questions)**

### Validation Checklist ✅
- [x] Test llms.txt at https://spacenexus.net/llms.txt — **200 OK**
- [x] Validate all schema at https://validator.schema.org/ — **Valid**
- [x] Test robots.txt with Google Search Console — **200 OK**
- [x] Run Lighthouse audit (target 90+) — **Completed**
- [x] Test AI crawler access with curl — **200 OK**

---

## Deliverables

| File | Skill | Purpose |
|---|---|---|
| GEO-AUDIT-REPORT.md | geo-audit | Overall GEO score + findings |
| GEO-TECHNICAL-AUDIT.md | geo-technical | Technical health + AI access |
| llms.txt | geo-llmstxt | AI-readable site guide |
| GEO-LLMSTXT-ANALYSIS.md | geo-llmstxt | llms.txt validation report |
| GEO-SCHEMA-REPORT.md | geo-structured data | Schema audit + generated code |
| GEO-CONTENT-ANALYSIS.md | geo-content | E-E-A-T scoring + improvements |
| GEO-CITABILITY-SCORE.md | geo-citability | AI citation optimization |

---

## Timeline

| Phase | Days | Focus |
|---|---|---|
| 1 | 1-3 | Audit & Discovery |
| 2 | 4-7 | Technical Foundation |
| 3 | 8-9 | llms.txt Setup |
| 4 | 10-12 | Schema Implementation |
| 5 | 13-18 | Content Optimization |
| 6 | 19-21 | Implementation & Testing |

---

*Generated: September 15, 2026*
