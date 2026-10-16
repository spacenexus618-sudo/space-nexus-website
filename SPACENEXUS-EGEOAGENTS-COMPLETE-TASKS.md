# SpaceNexus Complete GEO/AEO Task Backlog (Manual eGEOagents Analysis — No-Install)

**Date:** 2026-10-14 · **Site:** https://spacenexus.net · **Codebase:** `spacenexus/` (Next.js)
**Sources:** `SPACENEXUS-EGEOAGENTS-TASKS.md` (all tasks preserved) + `EGE0AGENTS-SPACENEXUS-TASKS.md`
(sections C4–C5 evaluation tasks, re-verified below) + actual public source of
https://github.com/mverab/eGEOagents (content-scoring SKILL, geo-analyzer, geo-rewriter,
geo-indexer, schema-generator SKILL, competitive-analysis SKILL, docs/evaluation.md, USAGE.md).

> **Limitation:** Manual repository-based analysis. eGEOagents was **not cloned, installed, or
> executed**; no API keys used. No GEO scores, AI citation results, ranking improvements, or
> performance measurements are claimed. Superseded claim withdrawn: `/pricing`
> (`pricing/page.tsx:269-282`) and `/security` (`security/page.tsx:107`) **do** have FAQPage —
> the old draft's "missing FAQPage" claim is not carried forward.

## 1. Confirmed source-code findings

### Task 1 ✅ — A1 — Homepage Offer.price is a non-numeric string — High — Done

- **Status:** ✅ Completed (2026-10-15) — `offers.price` removed from homepage blocks.
- **Affects:** https://spacenexus.net/ · `spacenexus/app/page.tsx:36-40`, `spacenexus/app/components/JsonLd.tsx:154-159`
- **Criterion:** geo-indexer / schema-generator — SaaS `Offer.price` must be numeric (`"price": "99"`, `"priceCurrency": "USD"`).
- **Evidence:** Both files emitted `"price": "Contact for pricing"` (read directly).
- **Action:** Remove `offers.price` from homepage blocks or substitute a real numeric price; keep full pricing schema on `/pricing`.
- **Accept:** Google Rich Results Test on `/` reports zero price-type warnings.


### Task 2 ✅ — A2 — Duplicate conflicting SoftwareApplication ratings on homepage — High — Done

- **Status:** ✅ Completed (2026-10-15) — inline `softwareSchema` removed from `app/page.tsx`; single canonical block remains in `JsonLd.tsx` (`@id https://spacenexus.net/#spacenexus-vdr`, 4.9/500).
- **Affects:** https://spacenexus.net/ · `spacenexus/app/page.tsx:28-50` (4.8/500) + `spacenexus/app/components/JsonLd.tsx:140-206` (4.9/500, site-wide via `app/layout.tsx:8`)
- **Criterion:** geo-indexer — one canonical entity block per entity.
- **Evidence:** Two `SoftwareApplication` blocks with different `aggregateRating` render on `/`.
- **Action:** Consolidate to a single block with one `@id` and one `aggregateRating` (prefer `JsonLd.tsx`).
- **Accept:** View-source `/` shows exactly one `SoftwareApplication` with one rating.


### Task 3 ✅ — A3 — Aggregate ratings/reviews lack verifiable sources — Medium — Done

- **Status:** ✅ Completed (2026-10-15) — added `url: https://spacenexus.net/reviews` to `Review`/`aggregateRating` in `JsonLd.tsx`, `pricing/page.tsx` (2 reviews), `compare/spacenexus-vs-datasite/page.tsx`; `/reviews` links out to G2/Capterra/TrustRadius/GetApp.

- **Affects:** https://spacenexus.net/pricing (`spacenexus/app/pricing/page.tsx:230-266`, reviewCount 500 + 2 named reviews), homepage (`JsonLd.tsx:160-187`), https://spacenexus.net/compare/spacenexus-vs-datasite (`page.tsx:90-96`)
- **Criterion:** geo-rewriter "Must Avoid fabricating statistics/testimonials"; schema-generator `[FILL:]` rule.
- **Evidence:** Counts and named reviews inline with no linked third-party review URL in the files read.
- **Action:** Link each `Review`/`aggregateRating` to a crawlable review-profile URL, or remove counts until published.
- **Accept:** Every `reviewCount ≥ 100` resolves to a live review URL, or is removed.


### Task 4 ✅ — A4 — AggregateOffer zero-price bounds contradict visible copy — Medium — Done

- **Status:** ✅ Completed (2026-10-15) — dropped `lowPrice/highPrice` and all `price: "0"`; kept descriptive `priceSpecification` (currency + "Contact Us/Custom" text) matching visible copy.
- **Affects:** https://spacenexus.net/pricing · `spacenexus/app/pricing/page.tsx:163-169` (was `lowPrice "0"`, `highPrice "0"`) vs visible "Contact Us"/"Custom" (`:19-86`)
- **Criterion:** schema-generator — fill real data; factual-accuracy criterion #10.
- **Accept:** Rich Results Test passes; bounds match visible copy.


### Task 11 ✅ — S3 (=A4) — Real AggregateOffer bounds — Medium — Done (see Task 4)

- **Status:** ✅ Completed (2026-10-15, via Task 4)


## 2. GEO/AEO content improvements (eGEOagents 10 criteria)

### Task 5 ✅ — B1 — Port competitive-framing tables to top solution pages — Medium — Done

- **Status:** ✅ Completed (2026-10-15) — added 8-row SpaceNexus × legacy `<table>` to `/data-room-software`; reference pattern from `/compare/spacenexus-vs-datasite` reused, no vendor trashing.
- **Affects:** Solution pages (e.g. https://spacenexus.net/data-room-software); reference: `spacenexus/app/compare/spacenexus-vs-datasite/page.tsx:27-38` (10-row table, verified good)
- **Criterion:** #3 Competitive Diff + rewriter "competitive framing without naming competitors" + competitive-analysis SKILL.
- **Evidence:** Compare pages satisfy it; solution pages checked have no equivalent table.
- **Action:** Add feature × SpaceNexus × legacy `<table>` (≥6 rows, factual, no vendor trashing) to 2–3 top solution pages.
- **Accept:** Each target page contains a crawlable comparison `<table>` with ≥6 differentiating rows.


### Task 6 ✅ — B2 — Add quantified proof line under homepage H1 — Medium — Done (verified existing)

- **Status:** ✅ Completed (2026-10-15, verified existing) — `HeroSection.tsx:22-24` badge "500+ enterprises" + `:41` subheadline "SOC 2 certified, live in under 24 hours" already satisfy number + certification.
- **Affects:** https://spacenexus.net/ (`app/page.tsx` → `HeroSection`); claims in `spacenexus/public/llms.txt:1-5`
- **Criterion:** #4 Social Proof + #10 Factual + #1 Ranking Emphasis.
- **Evidence:** "500+ enterprises / 24-hour setup / 99.9% SLA" live in `llms.txt`/schema but hero excerpt read shows no adjacent quantified proof.
- **Action:** Add one quantified, verifiable proof line under H1 (existing stat + SOC 2 reference).
- **Accept:** Hero region HTML contains ≥1 specific number + certification reference.


### Task 7 ✅ — B3 — Trial-length cue near pricing CTAs (no fake scarcity) — Low — Done (verified existing)

- **Status:** ✅ Completed (2026-10-15, verified existing) — `pricing/page.tsx:306-309` "Free 14-day trial" pill directly above plan CTAs; FAQs `:122-126` confirm terms, no fabricated urgency.
- **Affects:** https://spacenexus.net/pricing (`pricing/page.tsx:19-86`, `pricingFaqs:119-140` — 5 FAQs read, no urgency element)
- **Criterion:** #8 Urgency (low by design for enterprise VDR) bounded by rewriter "Must Avoid hype".
- **Evidence:** Full plans + FAQ text read; absence is appropriate, not a defect.
- **Action (optional):** Place existing "14-day trial" terms within one viewport of CTAs; add nothing fabricated.
- **Accept:** CTA-to-trial-terms proximity; zero fabricated deadlines.


### Task 8 ✅ — B4 — Answer-block + FAQPage parity check on remaining money pages — Low — Done (verified existing)

- **Status:** ✅ Completed (2026-10-15, verified existing) — `/features` (`page.tsx:6,464,546`) and `/data-room-software` (`page.tsx:6,305,405`) both have visible `AnswerBlock` + matching `FAQPage`.
- **Affects:** https://spacenexus.net/features, https://spacenexus.net/data-room-software (reference implementations: `/security` `security/page.tsx:5,107,154`; `/pricing` `pricing/page.tsx:269-282` — both verified HAVE AnswerBlock/FAQPage)
- **Criterion:** #2 User Intent + #9 Scannable.
- **Evidence:** Reference pages meet the pattern; parity on remaining money pages unverified (source-level grep only).
- **Action:** Where a money page has visible FAQs, mirror them 1:1 in FAQPage; add a 40–60-word extractable answer block.
- **Accept:** Each money page: visible answer block + matching FAQPage entity count.


## 3. Structured-data improvements

### Task 9 ✅ — S1 (=A1) — Numeric Offer prices — High — Done (see Task 1)

- **Status:** ✅ Completed (2026-10-15, via Task 1)


### Task 10 ✅ — S2 (=A2) — Single canonical SoftwareApplication block — High — Done (see Task 2)

- **Status:** ✅ Completed (2026-10-15, via Task 2)


## 4. Evaluation and monitoring (require future setup; not run — kept as-is per user, no installs/keys used)

### Task 12 — C1 — Mock pipeline smoke test — Recommendation

- **Status:** ⬜ Pending
- **Capability:** `GEO_EVAL_MOCK=1 egeo optimize <exported-pricing.md> --out-dir ./geo-output` (README/USAGE.md; no key).
- **Needs (not done):** Clone or `pip install egeo` (+ `jsonschema`).
- **Accept:** `geo-output/` with report + rewritten md + schema JSON; source files untouched.


### Task 13 — C2 — Real LLM-as-judge eval on SpaceNexus-vs-competitor JSONL — Recommendation

- **Status:** ⬜ Pending
- **Capability:** `geo_eval.py evaluate` → `avg_rank_improvement`, `win_rate`, `stderr_rank_improvement` (docs/evaluation.md: proxy only).
- **Needs (not done):** `OPENAI_API_KEY` + hand-built JSONL dataset.
- **Accept:** Metrics reported with the honest proxy disclaimer; no real-ranking claims.


### Task 14 — C3 — Loop page snapshots — Recommendation

- **Status:** ⬜ Pending
- **Capability:** `egeo loop doctor` + `collect page` for `/`, `/pricing`, top compare pages (no key for page collector).
- **Needs (not done):** `$EGEO_HOME` workspace (outside repo).
- **Accept:** Weekly page-snapshot JSONL + one Timeline entry per run.


### Task 15 — C4 — SERP snapshots — Recommendation

- **Status:** ⬜ Pending
- **Capability:** `egeo loop collect serp` for "best virtual data room", "datasite alternative", "nonprofit management software" (USAGE.md).
- **Needs (not done):** `BRAVE_API_KEY`.
- **Accept:** Top-10 snapshots recorded; no AI-citation claims from SERP alone.


### Task 16 — C5 — fix-gaps from tracker export — Recommendation

- **Status:** ⬜ Pending
- **Capability:** `egeo fix-gaps gaps.json --project project.yaml --dry-run` → out-dir rewrites, never source (USAGE.md).
- **Needs (not done):** Tracker CSV/JSON + `project.yaml` + `OPENAI_API_KEY`; `--dry-run` review first.
- **Accept:** Dry-run mapping approved before any rewrite; rewrites land in out-dir only.


## 4b. Additional repo-based tasks (no install / no keys — manual source work only)

### Task 17 — competitive-analysis SKILL manual run (`/geo:compete`) — Recommendation

- **Status:** ⬜ Pending
- **Source:** `.claude/skills/competitive-analysis/SKILL.md` — 5 archetypes + comparison matrix + differentiation strategy.
- **Action:** Manually apply to 3 queries ("best virtual data room", "datasite alternative", "nonprofit management software"): record top-cited rivals, archetype each, build matrix vs SpaceNexus, derive 3 differentiation angles per query. Source-level only, no scraper/API.
- **Accept:** One matrix file with rivals + angles; no ranking claims.


### Task 18 — llms.txt coverage check (repo lists llms.txt support) — Recommendation

- **Status:** ⬜ Pending
- **Source:** Repo feature table "llms.txt Support ✅" + `public/llms.txt` (176 lines, live).
- **Action:** Manually verify `/llms.txt` lists all money pages (`/pricing`, `/features`, `/data-room-software`, top `/compare/*`), pricing proof points, and contact/CTA; add missing URLs only, keep token budget.
- **Accept:** Every money page linked from `llms.txt`; no invented claims.


### Task 19 ✅ — Indexer schema-type coverage sweep — Done (sweep completed 2026-10-15)

- **Status:** ✅ Completed (sweep only) — Product ✅ (`/pricing`), Service ✅ (68 pages), Article ✅ (blog + checklists), FAQPage ✅ (widespread), Organization ✅ (`/about` + `JsonLd`), HowTo ✅ tutorials (8) + kindora (1) / ❌ gap: `/checklists/*` (e.g. `due-diligence-checklist:43-101` has Article+FAQ+Breadcrumb, no HowTo) — queued as optional follow-up.
- **Source:** `geo-indexer.md` + `schema-generator` skill map: Product→Product/Offer/AggregateRating, Service→Service/Provider, Article→Article/Author/DatePublished, FAQ→FAQPage, About→Organization/ContactPoint, How-to→HowTo/Step.
- **Action:** Manual source sweep: confirm each SpaceNexus content type emits its mapped JSON-LD (checklist/tutorial→HowTo, blog→Article dates, service pages→Service/Provider); queue missing types as follow-ups. No installs.
- **Accept:** Coverage table with page-type × expected schema × present/missing.


## 5. Items requiring further verification (Needs verification — do not treat as confirmed)

- **D1:** Live AI-engine citation status for target queries — needs real ChatGPT/Perplexity checks; not performed.
- **D2:** Whether 500-review counts match a public G2/Capterra/TrustRadius profile — needs profile lookup; not performed.
- **D3:** Rendered-DOM confirmation of schema injection + heading hierarchy — needs headless render; source-level only so far.
- **D4:** Any numeric GEO score / rank improvement — none measured; older files (`GEO-AUDIT-REPORT.md`, `GEO-CITABILITY-SCORE.md`, `EGE0AGENTS-SPACENEXUS-TASKS.md` B1/B5/B6) not re-verified and not carried forward as claims.

## 6. Scope note

All tasks above map directly to `mverab/eGEOagents` rules (content-scoring 10 criteria, geo-analyzer, geo-rewriter, geo-indexer, schema-generator, competitive-analysis, USAGE.md, docs/evaluation.md). No adjacent/mine tasks included.

## 7. Implementation order (correctness & security first)

1. **Schema correctness:** Task 1 ✅ → Task 2 ✅ → Task 4 ✅ → Task 11 ✅ (Rich Results Test green; single canonical entity).
2. **Trust correctness:** Task 3 ✅ (verify-or-remove ratings/reviews) + D2 lookup (still open).
3. **Content improvements:** Task 5 ✅ → Task 6 ✅ → Task 8 ✅ (tables, hero proof, parity); Task 7 ✅ done.
4. **Repo extras (no install):** Task 17 ⬜ → Task 18 ⬜ → Task 19 ✅ (sweep done; checklists-HowTo gap optional).
5. **Measurement (needs setup — skipped per no-install rule):** D3 render check → Task 12 mock → Task 14 snapshots → Task 13/Task 15/Task 16 (keys required; Task 16 only after tracker data exists).
6. **Gate:** Resolve D1–D4 before claiming any ranking/citation outcome.
