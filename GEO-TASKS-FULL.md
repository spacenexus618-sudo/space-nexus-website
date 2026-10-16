# SpaceNexus GEO Task List — Full (from geo-optimizer audit 74/100)

Source: GEO-OPTIMIZER-ANALYSIS.md | Audit: `geo audit --url https://spacenexus.net --format json` | Repo: Auriti-Labs/geo-optimizer-skill v4.18.3
Goal: 74 → 90+ (Excellent). Each task maps to a scored category in `models/config.py` / `SCORING_RUBRIC.md`.

## P0 — Point-bearing fixes (score impact)

✓ 1. Add FAQPage JSON-LD schema with real site FAQs → schema 10/16 up; ChatGPT Q&A extraction (DONE 2026-10-06)
✓ 2. Add Article/SoftwareApplication rich attrs (5+ attrs: author, datePublished, dateModified, aggregateRating) → schema richness (DONE 2026-10-06)
✓ 3. Create `/.well-known/ai.txt` with crawler permissions → ai_discovery 0/6 (DONE 2026-10-06)
✓ 4. Create `/ai/summary.json` (name + description) → ai_discovery (DONE 2026-10-06)
✓ 5. Create `/ai/faq.json` (structured FAQ) → ai_discovery (DONE 2026-10-06)
✓ 6. Create `/ai/service.json` (capabilities) → ai_discovery (DONE 2026-10-06)
✓ 7. Add RSS/Atom feed + `<link rel="alternate" type="application/rss+xml">` in `<head>` → signals 3/6 (DONE 2026-10-06)
✓ 8. Add `dateModified`/`datePublished` to all schema + `lastmod` in sitemap.xml → signals + Perplexity freshness (DONE 2026-10-06; sitemap `lastModified` already present, dates added to WebSite/SoftwareApplication/Article schemas)
✓ 9. Explicit per-bot Allow rules for all 27 AI bots in `app/robots.ts` (GPTBot, OAI-SearchBot, ChatGPT-User, ClaudeBot, Claude-SearchBot, PerplexityBot, Google-Extended, CCBot, Bytespider, etc.) → robots 15/18 → 18/18 (DONE 2026-10-06)
✓ 10. Add `llms.txt` Optional section + companion-files hint → llms 16/18 → 18/18 (DONE 2026-10-06)
✓ 11. Reduce `data` keyword density 3.2% → <2% (synonyms: deal room, repository) → removes stuffing penalty (DONE 2026-10-06; 6 swaps in app/page.tsx, density now ~1.9%)
✓ 12. Add author/byline signal (Person schema + visible author) → removes −3 negative penalty (Identity 4/5 → 5/5) (DONE 2026-10-06; nested author in Article/SoftwareApplication schema — footer byline removed per owner request, schema signal suffices)
✓ 13. Align Organization/WebSite schema description with meta description → Consistency 3/5 → 5/5 (DONE 2026-10-06)
✓ 14. Consolidate brand to single "SpaceNexus" in title/H1/schema (fix VeritasGraph primary-name leak) → brand 7/10 (DONE 2026-10-06; reordered JSON-LD so WebSite "SpaceNexus" is first primary schema — engine takes first SoftwareApplication/WebSite name)
15. Add Wikipedia + Wikidata sameAs links (KG pillars 2/4 → 4/4) → brand/entity + Trust Social (BLOCKED 2026-10-06: no SpaceNexus Wikipedia/Wikidata pages exist — adding fake links would create broken-link negative signals. Options: (a) create a Wikidata entity for the company (fast, legitimate), (b) earn a Wikipedia article long-term, (c) leave at 2/4. Do NOT link the generic "Virtual data room" article as sameAs — it describes the category, not the company.)
✓ 16. Fix hreflang detection (layout.tsx has languages alternates but audit found 0 — verify rendered `<link rel="alternate" hreflang>`) → brand (DONE 2026-10-06; live HTML confirmed 0 hreflang tags — added 7 explicit hreflang links in head, invisible)

## P1 — Citation/readiness quality (informational checks → real citations)

✓ 17. Restructure thin sections: merge 25-word fragments → 150–300-word RAG chunks with definition-first openings → RAG 45 → 70+ (DONE 2026-10-06)
✓ 18. Add anchor sentences + heading-boundary discipline (one idea per H2/H3) → chunk readiness (DONE 2026-10-06)
✓ 19. Date-only refresh (per owner request 2026-10-07; pricing-as-of wording removed): LastUpdated keeps date + relative label; June-2026 disclaimers → October 2026; no extra pricing-as-of sentences
- [ ] 20. Add front-loaded key facts in first 100 words of each page (context efficiency 63, truncation medium) → key_info_tokens
✓ 21. Add authoritative outbound links (docs/standards bodies) → Trust Academic 4/5 → 5/5 (DONE 2026-10-07; homepage SEO section gained "Security standards & references" box: AICPA SOC 2, ISO/IEC 27001, NIST CSF, RFC 8446 TLS 1.3, EU GDPR full text, SEC EDGAR — all target=_blank rel=noopener)
✓ 22. Add captions/transcripts; keep 100% alt coverage → multimodal good → excellent (DONE 2026-10-07; gallery screenshots wrapped in semantic figure+figcaption (sr-only, no visual change); verified 100% alt coverage site-wide on homepage components; no videos on homepage so no transcript track needed)
✓ 23. Label all forms (label/aria-label), add aria-live + error roles → WebMCP basic → ready; Instruction readiness 75 → 90+ (DONE 2026-10-07; DemoRequest — the only SpaceNexus-side form — already had htmlFor labels on all 7 fields; added aria-label on form, role=alert on error, role=status+aria-live on success panel, aria-busy on submit; Kindora forms out of audit scope, untouched)
✓ 24. Add WebMCP `toolname`/`tooldescription` attrs + `potentialAction` schema + OpenAPI endpoint → agent action readiness (DONE 2026-10-07; toolname/tooldescription on demo form + hero demo CTA; CommunicateAction→/demo on Organization schema; new /openapi.json with 8 real GET resources + discovery line in .well-known/ai.txt)
✓ 25. Add references/sources section per long page (supports KDD-2024 citation/quotation/statistics methods) → citability (DONE 2026-10-07; scoped to homepage + 12 competitor pages per owner approval; each competitor disclaimer gained vendor-official-site source link; roundup page lists all 5 vendor sources; homepage standards box gained internal-data attribution line for cited stats)

## P2 — Verify + lock in (repo workflow)

✓ 26. Run `geo fix --url https://spacenexus.net` (preview) and apply robots/llms/schema diffs (DONE 2026-10-07; preview run: live score still 74/100 since local tasks 1–25 are undeployed; engine suggested only 1 fix — placeholder FAQPage snippet with wrong Italian text + nonexistent /contatti URL — correctly REJECTED since real FAQPage schema already shipped in task 1; robots + llms reported already-complete, nothing to apply)
✓ 27. Re-run `geo audit --threshold 70 --format json` + `geo schema --file` + `geo llms --check-drift`; confirm 90+ (DONE 2026-10-07; audit live = 74/100 GOOD — threshold 70 PASSED, 90+ NOT reachable until local tasks 1–25 deploy; schema analyze live = 6 schemas, FAQPage absent live as expected pre-deploy + duplicate SoftwareApplication flagged [page.tsx + JsonLd.tsx both emit one — cleanup candidate]; llms --check-drift = 36 URLs in llms.txt missing from live sitemap which lists only 27 URLs — live sitemap.xml looks stale/partial, regeneration candidate post-deploy)
- [ ] 28. Run `geo citations --brand "SpaceNexus" --domain spacenexus.net --runs 5` (needs API key) for real citation baseline (BLOCKED 2026-10-07: no PERPLEXITY_API_KEY or other provider key in env — command verified working, needs key. Recommended: set PERPLEXITY_API_KEY, then run with --topic "virtual data room" for a topical baseline, not just brand)
- [ ] 29. Add CI gate (`.github/workflows/geo.yml`: `min-score: 70`, `format: sarif`) + `geo track --report` for trend HTML (REMOVED 2026-10-07 per owner request — workflow file deleted, no repo changes remain)
- [ ] 30. Add GEO badge to README (`geoready.dev/badge?url=https://spacenexus.net`)

## P3 — TheSmokeDev/geo-skills (29 skills + geoskills CLI v0.1.1)

Source: https://github.com/TheSmokeDev/geo-skills | Analysis: GEO-SKILLS-ANALYSIS.md (2026-10-08) | Est. GEO Score 79-80/100
Reproduce: `pip install geoskills==0.1.1; geoskills inspect https://spacenexus.net --mode full --json; geoskills citability https://spacenexus.net --json`

✓ 31. G1 geo-crawlers — header audit (DONE 2026-10-09: no nosnippet/noai/noimageindex bleed; robots.txt allows all AI bots)
- [ ] 32. G2 geo-ai-index-access — NEEDS DEPLOY VERIFY: confirm Bing Webmaster indexation + IndexNow key live + key facts in raw SSR HTML (not JS-only). Done when: Bing indexed, IndexNow submits on publish, SSR contains TL;DR + pricing + certs.
- [ ] 33. G3 geo-citability — NEEDS DEPLOY VERIFY: AnswerBlock TL;DR on 3 solution pages in code; extend to top 20 pages each ≥1 passage scoring 80+ (≤50-word answers, definitions, stats, lists, Q&A). Done when: `geoskills citability --json` shows 80+ passages.
- [ ] 34. G4 geo-llmstxt — NEEDS DEPLOY VERIFY: footer llms.txt link + /ai/*.json dates refreshed; validate discovery via footer + sitemap. Done when: geo-llmstxt validator passes; update files on every pricing/feature change.
- [ ] 35. G5 geo-schema — NEEDS DEPLOY VERIFY: phone/address/founding + Author/Person + Review markup fixed in code; validate Organization + SoftwareApplication + FAQPage + Breadcrumb JSON-LD. Done when: rich-results + schema validators pass zero errors.
- [ ] 36. G6 geo-fanout — NOT STARTED: publish/retitle pages to verbatim prompts ("Best VDR for Series C fundraising", "Datasite vs SpaceNexus pricing 2026", "SecureDocs alternative") with query-matched H1 + intro sentence. Done when: each money query has matching H1 + intro.
- [ ] 37. G7 geo-youtube — NOT STARTED: publish demo walkthrough with full transcript, chapters, verbatim-query title. Done when: 1 video live with transcript indexed.
- [ ] 38. G8 geo-measurement — NOT STARTED: weekly share-of-citation panel (10 money prompts × ChatGPT/Perplexity/Gemini/AI Overviews — cited? position? sentiment?). Done when: sheet/dashboard running 4+ weeks with volatility notes.

## How each group helps (via the repo)

- P0 tasks earn deterministic points (robots/llms/schema/signals/ai-discovery/brand) — reachable + parseable = bots can crawl and understand; every weight is in the rubric.
- P1 tasks raise informational scores (RAG, trust, platform profiles, citability-47) — quotable = engines choose to cite you (statistics/citations/quotations per KDD-2024).
- P2 locks gains: CI fails the build on regression; citations/snapshots prove real engines (esp. Perplexity with source URLs) cite the domain, not just readiness theory.
