# SpaceNexus — Required Tasks (VDR only)

**Site:** https://spacenexus.net | **Total: 7 tasks** (4 required + 3 follow-up)
**Generated:** 2026-10-08

## Required (4)

### ⬜ 1. Remove PII console.log — NOT DONE (3 console.log still present) — HIGH
**File:** `spacenexus/app/tools/ma-readiness/page.tsx:254,256,261`
**What:** Delete 3 `console.log` calls logging email/token/OTP flow.
**Why:** Leaks user PII to browser console, noisy, unprofessional in prod.
**Done when:** No `console.log` in `app/tools/ma-readiness/`.

### ⬜ 2. Fix empty catch — NOT DONE (2 empty catch {} still present) in auth-context — HIGH
**File:** `spacenexus/lib/auth-context.tsx:42,59`
**What:** Replace `catch {}` with clear-corrupt-key + log:
`catch { localStorage.removeItem(STORAGE_KEY); }`
**Why:** Corrupt storage silently leaves users logged-out with no signal; hides bugs.
**Done when:** Both catches handle + logout path clears key (already does).

### ⬜ 3. Canonicalize duplicate — NOT DONE (both routes still exist) M&A route — HIGH
**Files:** `spacenexus/app/m-a-data-room-providers/page.tsx` (~71.8KB) vs `spacenexus/app/ma-data-room-providers/page.tsx` (~71.8KB)
**What:** Keep `ma-data-room-providers`, delete the other, add 301 redirect in `next.config.ts`.
**Why:** Near-identical pages split Google ranking + AI citations between two URLs.
**Done when:** One URL live, other 301s, sitemap lists only canonical.

### ⬜ 4. TTFB + Core Web Vitals — NOT DONE check — HIGH
**Source:** `SEO-AUDIT-PENDING-TASKS.md` Task 8/9 (TTFB 2488ms, needs <600ms)
**What:** Run PageSpeed Insights on /, /pricing, /features; record LCP/INP/CLS + TTFB; enable edge cache, trim blocking JS.
**Why:** Slow first byte kills rank and demo conversions.
**Done when:** TTFB <600ms, LCP/INP/CLS green on mobile.

## Follow-up (3)

### ⬜ 5. Upgrade xlsx — NOT DONE + lint + stale build — MEDIUM
**Files:** `spacenexus/package.json:21`, `eslint.config.mjs`, `.next/`, `dev-error.log`
**What:** Upgrade `xlsx@^0.18.5` (known CVEs), confirm `lint` script actually runs, delete `.next` and rebuild to clear stale `Invalid OpenGraph type: guide` error (no `guide` type in current source).
**Why:** Security + clean build logs.
**Done when:** `npm run build` + `npm run lint` pass with no errors.

### ⬜ 6. Answer-first TL;DR — NOT DONE + dates on money pages — HIGH (GEO)
**Pages:** /solutions/mergers-and-acquisitions-vdr, /solutions/investor-data-room, /solutions/secure-document-sharing-for-legal, /pricing, /security
**What:** Add 40–60-word direct-answer intro ("SpaceNexus is… costs… certified… setup in 24h") + visible `dateModified`.
**Why:** This is what ChatGPT/Perplexity quote. Long vague pages lose citations to competitors.
**Done when:** Each page has quotable TL;DR + current date.

### ⬜ 7. Title/description + images — NOT DONE + orphans — MEDIUM
**What:** Shorten 2 long titles (50–60 chars) + 2 meta descriptions (150–160 chars); convert source PNG/JPEG → WebP; add internal links to 5 orphan pages.
**Why:** CTR + load speed + crawl coverage.
**Done when:** Titles/descriptions in limits, images WebP, orphans have 3+ inbound links.

---

## Appendix: geo-skills checklist (per TheSmokeDev/geo-skills repo)

Source: https://github.com/TheSmokeDev/geo-skills — 29 Agent Skills + `geoskills` CLI.
Run: `geoskills inspect https://spacenexus.net --mode full --json` or `/geo audit https://spacenexus.net`.

### ✅ G1. geo-crawlers — DONE (verified 2026-10-09: no blocking headers/meta) — header audit
**What:** Confirm response headers have no `nosnippet`/`noai`/`noimageindex` bleed; per-bot fetch as GPTBot, ClaudeBot, PerplexityBot.
**Why:** robots.txt already allows all AI bots; headers can still block previews/citations.
**Done when:** `geoskills inspect` shows all AI crawlers allowed, preview controls clean.

### 🔶 G2. geo-ai-index-access — FIXED IN CODE, NEEDS DEPLOY (sitemap shadow removed + IndexNow key added, register key in Bing Webmaster + redeploy) — Bing + IndexNow + SSR
**What:** Verify Bing Webmaster indexation, submit IndexNow on publish, confirm key facts present in raw SSR HTML (not JS-only).
**Why:** ChatGPT retrieval leans on Bing's index; JS-hidden facts are invisible to dumb fetchers.
**Done when:** URL indexed in Bing, IndexNow key deployed, SSR contains TL;DR + pricing + certs.

### 🔶 G3. geo-citability — FIXED IN CODE, NEEDS DEPLOY (AnswerBlock TL;DR added to 3 solution pages; pricing+security already had it) — passage scoring + rewrites
**What:** Score every H2-section 0–100 for extractability; rewrite to ≤50-word answers, definitions, stats, lists, Q&A.
**Why:** Directly decides whether ChatGPT quotes you or a competitor.
**Done when:** Top 20 pages each have ≥1 passage scoring 80+.

### 🔶 G4. geo-llmstxt — FIXED IN CODE, NEEDS DEPLOY (footer llms.txt link + ai/*.json dates refreshed to 2026-10-09) — facts hedge
**What:** Validate `llms.txt` + `/ai/*.json` linked from footer + sitemap, fresh dates, correct pricing/certs/phones.
**Why:** Stops hallucinations about your price, trial, compliance.
**Done when:** `geo-llmstxt` validator passes; files updated on every pricing/feature change.

### 🔶 G5. geo-schema — FIXED IN CODE, NEEDS DEPLOY (phone/address/founding fixed + author/review added) — entity clarity
**What:** Validate Organization + SoftwareApplication + FAQPage + Breadcrumb JSON-LD; add Author/Person + Review markup.
**Why:** Lets LLMs resolve "SpaceNexus = VDR by Space Nexus, SOC 2, Sacramento" as one entity.
**Done when:** Rich-results + schema validators pass with zero errors.

### ⬜ G6. geo-fanout — NOT DONE — query fan-out titles
**What:** Publish/retitle pages to verbatim prompts: "Best VDR for Series C fundraising", "Datasite vs SpaceNexus pricing 2026", "SecureDocs alternative".
**Why:** Engines retrieve the sub-query space, not your brand page.
**Done when:** Each money query has a query-matched H1 + intro sentence.

### ⬜ G7. geo-youtube — NOT DONE — transcript-first video lane
**What:** Publish demo walkthrough with full transcript, chapters, verbatim-query title.
**Why:** Rank-free citation source Perplexity/Gemini quote heavily.
**Done when:** 1 video live with transcript indexed.

### ⬜ G8. geo-measurement — NOT DONE — share-of-citation panel
**What:** Track weekly: 10 money prompts × ChatGPT/Perplexity/Gemini/GAI Overviews — cited? position? sentiment? No reacting to single runs.
**Why:** Only way to prove GEO work converts to mentions.
**Done when:** Dashboard/sheet running 4+ weeks with volatility notes.

### ⬜ G9. geo-brand-mentions — NOT DONE — 3rd-party mention + entity map
**What:** Run `geo-brand-mentions` skill: web mention map (LinkedIn/X/Crunchbase/G2/Capterra already in sameAs — verify live links resolve), add missing high-authority profiles (ProductHunt, TrustRadius, SourceForge), ensure consistent NAP + sameAs on every page.
**Why:** Repo weights Brand Authority 20% of GEO Score; thin mention graph = AI hedges ("a VDR provider") instead of citing SpaceNexus by name.
**Done when:** sameAs list verified live (no 404s), 3+ new authoritative mentions live, Organization schema updated.

### ⬜ G10. geo-platform-optimizer + geo-ai-index-access (Bing) — NOT DONE — platform presence
**What:** Claim/complete profiles where models retrieve: Bing Places/Webmaster, Google Business, G2/Capterra/TrustRadius listings with identical description + pricing + certs; confirm Bing indexation (ChatGPT retrieval path).
**Why:** Repo weights Platform Optimization 10%; models prefer retrieved snippets from these hubs over crawling your site.
**Done when:** G2/Capterra listings live + consistent, Bing Webmaster shows indexed URLs.

### ⬜ G11. geo-report / geo-compare — NOT DONE — baseline + delta proof
**What:** Run full `/geo audit https://spacenexus.net` (or `geoskills inspect --mode full --json`) now = baseline; save JSON to `data_sources/`; re-run post-deploy of G2–G5 and diff with `geo-compare`. Export PDF via `geo-report-pdf` for stakeholders.
**Why:** Repo's moat is composite score + deltas + fail-closed evidence rules; without a frozen baseline you can't prove G2–G8 moved the score.
**Done when:** Baseline JSON committed, post-deploy re-run shows GEO Score delta, PDF saved.

### ⬜ G12. geoskills CLI as CI check — NOT DONE — content-PR guard
**What:** Per repo verdict: adopt `geo-citability` + `geo-crawlers` + `geo-llmstxt` as CI checks on every content PR (`pip install geoskills==0.1.1; geoskills validate; geoskills citability <URL> --json`). Fail PR if new H2-section scores <80 or llms.txt drifts from sitemap.
**Why:** Stops regressions (stale llms.txt/pricing, JS-only facts, blocked bots) before deploy — the exact failure mode keeping G2–G5 "fixed in code, needs deploy".
**Done when:** CI job runs on content PRs with pass/fail gate documented.
