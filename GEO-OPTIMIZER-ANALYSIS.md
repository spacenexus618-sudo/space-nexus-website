# TASK 10 — GEO Optimizer Skill Analysis + SpaceNexus Audit

Repository: https://github.com/Auriti-Labs/geo-optimizer-skill (v4.18.3, MIT, installed via `pip install geo-optimizer-skill`)
Skill system used: local `.claude/skills` + `.agents/skills` (geo-*, seo-audit, schema, ai-seo) + GEO Optimizer engine as CLI/Python/MCP.
Audit target (safe, public): https://spacenexus.net
Date: 2026-10-06 | Command: `geo audit --url https://spacenexus.net --format json`

## 1. Skill / Repo Architecture

- **Audit engine** (`core/audit*.py`, `core/scoring.py`, `models/config.py`): 8 scored categories totalling 100 pts — robots /18, llms /18, schema /16, meta /14, content /12, brand-entity /10, signals /6, AI-discovery /6. Bands: 86–100 Excellent, 68–85 Good, 36–67 Foundation, 0–35 Critical. Score breakdown is fully auditable in `SCORING_RUBRIC.md`.
- **GEO score** = weighted sum minus negative-signal penalty (max −5). Deterministic, no LLM call — safe to run in CI (`--threshold 70`, `--format sarif/junit/html/json`).
- **AI crawler access**: checks 27 bots across training/search/user tiers + `geo access` (browser vs bot UA simulation) + `geo logs` (server-log bot analysis) + CDN-block detection (Cloudflare/Akamai/Vercel challenge detection).
- **llms.txt** (`core/audit_llms.py`, `cli/llms_cmd.py`): presence, H1+blockquote, sections, links, word depth, `llms-full.txt` companion, `--check-drift` for stale URLs.
- **Citation checking** (`geo citations/snapshots/track/monitor`): live probes to Perplexity/OpenAI/Anthropic/Groq/Gemini/DeepSeek/SerpBase. Only Perplexity returns real source URLs; others measure brand mention from model knowledge. `--runs 5` gives confidence interval because answers are non-deterministic.
- **Schema** (`geo schema`, `schema_validator.py`, `schema_injector.py`): detects WebSite/Organization/FAQPage/Article richness (5+ attrs), generates JSON-LD.
- **MCP** (`mcp/server.py`, `.mcp.json`): 12 tools — `geo_audit, geo_fix, geo_llms_generate, geo_citability, geo_schema_validate, geo_compare, geo_gap_analysis, geo_ai_discovery, geo_check_bots, geo_trust_score, geo_negative_signals, geo_factual_accuracy`. Usable from Claude/Cursor via `claude mcp add geo-optimizer -- geo-mcp`.
- **Skill architecture**: composable sub-skills under `geo_optimizer/skills/catalog/` (`geo_audit_orchestrator, geo_foundation_repair, geo_citation_readiness, geo_schema_readiness, geo_trust_signal_review, geo_ai_discovery_readiness, geo_competitor_comparison`) with `skill.yaml + prompt.md`, plugin entry point `geo_optimizer.checks`, plus Astro integration (`integrations/astro-geoready/`) generating `llms.txt`, `.well-known/ai.txt`, `/ai/summary.json` at build time.
- **Beyond-score checks (informational)**: JS-rendering, prompt-injection (8 patterns), trust-stack (A–F), RAG-chunk readiness, content-decay, platform citation profiles (ChatGPT/Perplexity/Google-AI), multimodal, WebMCP readiness, citability (47 checks, 9 from KDD-2024 GEO paper).

## 2. Security Investigation (required)

File: `geo_optimizer/utils/validators.py` — `resolve_and_validate_url()` + `validate_safe_path()` + `url_belongs_to_domain()`.

Protections: allow-list schemes http/https only; block embedded credentials (`user:pass@host`); block hostnames `localhost, metadata, metadata.google.internal, 169.254.169.254`; resolve DNS **once** and validate **every** returned IP against blocked networks (DNS pinning → prevents TOCTOU/DNS-rebinding); blocked nets: `0.0.0.0/8, 127.0.0.0/8, 10/8, 172.16/12, 192.168/16, 100.64/10, 192.0.0.0/24, 198.18/15, 169.254/16` + IPv6 `::1/128, fc00::/7, fe80::/10, ::ffff:0:0/96` (+ explicit mapped sub-ranges); stdlib fallback `is_private/is_loopback/is_link_local/is_reserved/is_multicast`; unresolvable DNS rejected; generic user error (no IP leak, detail at DEBUG only); path traversal via `Path.resolve()` + `base_dir` containment + extension allow-list.

**Why this matters for an SEO tool that fetches URLs:** an auditor fetches arbitrary user-supplied URLs (page, robots.txt, llms.txt, schema, sitemap). Without SSRF protection an attacker can make the *server/CI runner* request internal resources: `http://169.254.169.254/latest/meta-data/` (cloud credential theft on AWS/GCP/Azure), `http://localhost:6379/admin`, intranet dashboards, or use DNS rebinding (first resolve public, second resolve private). Impact: credential exfiltration, internal port scanning, cloud-metadata hijack. DNS pinning (resolve once, reuse pinned IPs) + full IP-family (IPv4+IPv6-mapped) blocking + hostname blocklist is the correct defence, and this repo implements all three.

## 3. Live Audit — spacenexus.net

**Score: 74/100 — GOOD band** (median public benchmark per repo README ≈ 57, so above median).

| Category | Score | Finding |
|---|---|---|
| robots.txt | 15/18 | Found; 27/27 bots allowed, 0 blocked. −3 because citation bots not *explicitly* listed with Allow rules (covered by wildcard/explicit groups but scorer wants explicit `Allow: /` per citation bot) |
| llms.txt | 16/18 | Found, H1+blockquote+14 sections+56 links, 1132 words, `llms-full.txt` present. Missing optional section / companion hint |
| Meta | 14/14 | PASS — title 85ch, desc 180ch, canonical + OG complete, no noindex/noai |
| Content | 12/12 | PASS — H1 present, 47 headings, hierarchy OK, lists/tables, front-loading, 2365 words, 49 numbers, 25 external links |
| Schema | 10/16 | WebSite ✓, Organization ✓, SoftwareApplication, BreadcrumbList, SiteNavigationElement — **no FAQPage, no Article/WebApp** |
| Brand/Entity | 7/10 | Consistent but primary-name detected as "VeritasGraph" (footer/product leak); KG pillars 2/4 (LinkedIn + Crunchbase, **no Wikipedia/Wikidata**); schema desc ≠ meta desc |
| Signals | 3/6 | `lang="en-US"` ✓; **no RSS/Atom feed, no dateModified/datePublished freshness** |
| AI Discovery | 0/6 | **FAIL — no `/.well-known/ai.txt`, no `/ai/summary.json`, `/ai/faq.json`, `/ai/service.json`** |
| Negative penalty | −3 | 2 signals: keyword stuffing `data` 3.2% density + missing author signal (boilerplate 0.29 OK, thin/popup CTAs OK) |

**AI crawler findings**: CDN check PASS — Netlify, HTTP 200 for browser + GPTBot/OAI-SearchBot/PerplexityBot/Claude-SearchBot/Googlebot/Applebot, `any_blocked: false`. JS rendering PASS — Next.js SSR, 2352 words in raw HTML, not JS-dependent. Prompt injection: clean (0/8 patterns). Trust stack: **B (21/25, high)** — Technical 5/5, Social 5/5, Identity 4/5 (no author), Academic 4/5 (no DOI/Scholar links), Consistency 3/5 (desc mismatch, no dateModified). Multimodal: good (11/11 alt). Platform readiness: Google-AI 79, Perplexity 62, ChatGPT 58. RAG chunk readiness 45/100 (47 sections, avg 25.6 words — too fragmented, no definition openings). Evergreen 73/100, decay risk high (year-stamped "2026" strings + price snippet without as-of date). Context efficiency 63/100, truncation risk medium. WebMCP: basic (SearchAction only, no registerTool, forms unlabeled for agents).

**Citation findings** (static, no API key used): citability levers present — statistics (49 numbers), quotations/external citations (25 links), structured lists/tables. Gaps: no FAQPage (Q&A extraction), shallow RAG chunks (25-word sections split across 47 headings), no dateModified (Perplexity freshness demotion), brand-entity split (VeritasGraph vs SpaceNexus confuses entity resolution), 2/4 KG pillars (weaker E-E-A-T grounding for citation).

## 4. Recommendations (maps 1:1 to engine output, prioritised)

1. **FAQPage schema** (+schema, +ChatGPT 58→): add FAQ JSON-LD from real site FAQs.
2. **`/ai/*.json` + `/.well-known/ai.txt`** (+6 AI-discovery): `summary.json`, `faq.json`, `service.json` — cheapest +6 pts.
3. **RSS/Atom + `dateModified`** (+signals, +Perplexity/Google): `<link rel=alternate type=application/rss+xml>`, `dateModified` in schema + `lastmod` in sitemap.
4. **Explicit citation-bot Allow rules** (+3 robots): list GPTBot/OAI-SearchBot/PerplexityBot/ClaudeBot individually in `app/robots.ts` (current file allows them but scorer wants per-bot explicit blocks — also add `CCBot`, `Bytespider`, etc.).
5. **Entity consolidation**: single brand "SpaceNexus" in title/H1/schema `name`; add Wikipedia/Wikidata sameAs (or remove VeritasGraph leak from footer crawl).
6. **De-stuff `data`**: 3.2% → <2% via synonyms (deal room, repository, content); add author/byline + align schema description with meta description (fixes Consistency 3/5).
7. **RAG structure**: merge 25-word fragments into 150–300-word sections with definition-first sentences; add pricing "as of" dates.

## 5. Local Codebase Mapping (spacenexus/ Next.js)

- `app/robots.ts` — good base (GPT/Claude/Perplexity/Google-Extended/Bing explicit) but missing ~20 of the 27 bots the engine scores; extend.
- `public/llms.txt` + `llms-full.txt` — already strong (why llms scored 16/18).
- `app/layout.tsx` + `JsonLd`/`SiteNavigationSchema` components — meta 14/14; add FAQPage + dateModified/author here.
- Missing: `public/.well-known/ai.txt`, `public/ai/{summary,faq,service}.json`, RSS route — scaffold these.
- `geo fix --url https://spacenexus.net` (preview) generates the robots/llms/schema/meta diffs; re-run `geo audit --threshold 70` in CI to gate regressions; `geo track --report` for trend HTML.
