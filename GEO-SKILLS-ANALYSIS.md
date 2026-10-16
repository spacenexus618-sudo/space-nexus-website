# GEO-SKILLS Analysis — TheSmokeDev/geo-skills

**Repo:** https://github.com/TheSmokeDev/geo-skills
**Analyzed:** 2026-10-08 | Version: 0.1.1 (PyPI `geoskills`) | License: MIT
**Test site:** https://spacenexus.net

## 1. What it is

29 free, portable **Agent Skills** (each a `SKILL.md` instruction + rubric + output format) plus a read-only Python **CLI** (`geoskills`). No dashboard, no paid API required. Free-first; DataForSEO prompt-pack is optional/paid-per-use and kept separate.

> Traditional SEO: "Can Google rank this page?" → GEO: "Can ChatGPT / Perplexity / Gemini / AI Overviews understand, extract, and cite this page?"

## 2. Skill architecture

```
skills/<name>/SKILL.md   — instruction doc (portable)
agents/                  — 5 subagents for orchestrator fan-out
  geo-ai-visibility, geo-content, geo-platform-analysis, geo-schema, geo-technical
src/geoskills/           — CLI: validate, inspect, citability, owner-map, prompts/skills list
schemas/                 — versioned JSON handoffs (owner-intent map → TokenMax)
prompt-packs/dataforseo-intelligence/ — 7 paste-ready prompts with spend caps + receipts
examples/                — geo-audit-summary.json, citability-summary.json
```

**Orchestration:** `/geo audit <URL>` → `geo` orchestrator fans out 5 subagents in parallel (Claude Code native), merges into **GEO Score 0–100 + prioritized fix list + 30-day plan**. On Codex/Cursor/other agents: same skills run sequentially/directly; `allowed-tools` frontmatter is advisory.

## 3. Available skills (29)

**GEO core (flagship):** `geo` (orchestrator), `geo-audit`, `geo-citability`, `geo-crawlers`, `geo-ai-index-access`, `geo-fanout`, `geo-youtube`, `geo-measurement`, `geo-llmstxt`, `geo-brand-mentions`, `geo-platform-optimizer`, `geo-schema`, `geo-technical`, `geo-content`, `geo-report`/`geo-report-pdf`, `geo-proposal`/`geo-prospect`/`geo-compare`, `ai-seo`, `token-max-factory`, `tokenmax-fleet-orchestrator`
**Supporting SEO:** `programmatic-seo`, `schema-markup`, `competitor-alternatives`, `seo-audit`, `content-strategy`, `site-architecture`

## 4. How it measures "citable?" — the GEO Score

| Category | Wt | What it measures | How (skill → signal) |
|---|---|---|---|
| AI Citability | 25% | Quotable, extractable passages | `geo-citability`: passage score 0–100 (direct answers ≤50 words, definitions, stats, lists, Q&A); rewrite suggestions |
| Brand Authority | 20% | 3rd-party mentions + entity recognition | `geo-brand-mentions`: web mention map, sameAs/entity signals |
| Content E-E-A-T | 20% | Experience/Expertise/Authority/Trust | `geo-content`: authorship, evidence, freshness, trust cues |
| Technical GEO | 15% | AI crawler access, preview control, rendering, speed | `geo-crawlers` (robots.txt/headers for GPTBot, ClaudeBot, PerplexityBot…), `geo-ai-index-access` (Bing index + IndexNow, nosnippet audit, SSR check), `geo-technical` (CWV) |
| Schema / Structured Data | 10% | Entity clarity for LLMs + rich results | `geo-schema`: detect/validate/generate JSON-LD |
| Platform Optimization | 10% | Presence where models retrieve | `geo-platform-optimizer`, `geo-youtube` (transcript-first citation lane), `geo-fanout` (query fan-out/topic clusters) |

Severity-ranked issues (critical first, quick-wins flagged) + evidence-state labels + fail-closed missing-data rules (no invented traffic/rankings).

## 5. Deep dives requested

- **GEO audit:** `geo` + `geo-audit` + 5 subagents → composite score, deltas (`geo-compare`), PDF (`geo-report-pdf`). CLI mirror: `geoskills inspect <URL> --mode full --json` (read-only).
- **AI crawler analysis:** `geo-crawlers` (robots/headers per-bot) + `geo-ai-index-access` (Bing/IndexNow/nosnippet/SSR prerequisites — ChatGPT retrieval path).
- **Citability:** `geo-citability` passage-level 0–100 + rewrites; CLI: `geoskills citability <URL> --json`.
- **Prompt packs:** `prompt-packs/dataforseo-intelligence` — site-explorer, keyword, competitor-gap, tech-audit, AI-visibility, community-demand, owner-intent (front door to TokenMax: upgrade/create/consolidate/hold). Each with spend cap, coverage receipt, handoff.
- **Claude Code:** native (parallel subagents). Install: copy `skills/`→`~/.claude/skills/`, `agents/`→`~/.claude/agents/`, then `/geo audit <URL>`.
- **Codex:** works — copy `skills/`→`~/.codex/skills/`, run directly/sequentially.
- **CLI:** `pip install geoskills==0.1.1`; `doctor`, `validate`, `skills list`, `prompts list`, `inspect`, `citability`, `owner-map validate` — all `--json`, all read-only.

## 6. Live test — spacenexus.net (2026-10-08, read-only fetch)

### 6.1 AI crawler accessibility — PASS (strong)
`robots.txt` explicitly allows `GPTBot, ChatGPT-User, PerplexityBot, ClaudeBot, anthropic-ai, Google-Extended, Bingbot`; `Allow: /`; only `/api/, /admin/, /private/, /seo/, /templates/, /_next/` disallowed. Sitemaps declared (`/sitemap.xml`, `/kindora/sitemap.xml`). No blanket AI disallow. ✅ Matches `geo-crawlers` + `geo-ai-index-access` expectations.
**Gaps to verify with CLI/agent run:** response headers (no `nosnippet`/`noai` bleed), Bing indexation + IndexNow submission, SSR HTML contains key content (Next.js — likely yes).

### 6.2 Citation readiness — GOOD (78/100 est.)
- Direct answers present: hero ("AI-powered VDR… live in under 24h"), FAQ (8 Qs), VeritasGraph Q&A block — all quotable ≤50-word style. ✅
- Stats with numbers ($340M, 8→3 wks, 500+ enterprises, 99.99%) — highly extractable. ✅
- `llms.txt` comprehensive (products, pricing, features, comparisons, facts) + `/ai/*.json` (faq/service/summary), `openapi.json` — anti-hallucination hedge exactly as `geo-llmstxt` prescribes. ✅
- Missing: per-passage definition sentences ("X is…") on long solution/industry pages; TL;DR answer-first intro on guides; last-updated dates sparse.

### 6.3 Content extractability — GOOD
SSR Next.js, single H1, FAQPage + Q&A headings, lists/tables, transcript-less but text-rich. Risks: heavy JS/client widgets (deal-room demo, analytics visuals) may hide facts from dumb fetchers; comparison tables need plain-HTML fallbacks. Run `geoskills inspect --mode full --json` to confirm.

### 6.4 Entity clarity — GOOD
Organization + SoftwareApplication (SpaceNexus VDR, VeritasGraph) + WebSite+SearchAction + FAQPage + Breadcrumb + SiteNavigationElement per prior audit; `sameAs` (LinkedIn/X/Crunchbase/G2/Capterra…); NAP + phones (7 regions) + address consistent; VeritasGraph→GitHub/docs linkage disambiguates the engine. Gap: add `Author/Person` + `Review/Testimonial` markup for E-E-A-T; confirm Kindora entities don't dilute primary VDR entity (separate `/kindora/llms.txt` already helps).

### 6.5 Missing information (prioritized per geo-skills severity)
1. **[Quick win]** Add answer-first 40–60-word TL;DR + `dateModified` to top 20 solution/guide pages (lifts `geo-citability` passages).
2. **[Quick win]** Publish `/ai/*.json` + `llms.txt` links in footer/sitemap so `geo-llmstxt` validator passes discovery.
3. **Medium** — Verbatim-query fan-out titles (`geo-fanout`): "Best VDR for Series C fundraising", "Datasite vs SpaceNexus pricing 2026" pages already exist — add query-matched H1/intro sentences.
4. **Medium** — `geo-youtube` lane empty: transcript-first demo + chapters would open rank-free citations.
5. **Medium** — `geo-measurement`: stand up share-of-citation prompt panel (ChatGPT/Perplexity/Gemini × 10 money prompts) before claiming wins.
6. **Low** — IndexNow + Bing Webmaster proof; header audit for `nosnippet`.

**Estimated GEO Score (mapping to repo weights):** Citability 78×.25=19.5 + Authority 75×.20=15 + E-E-A-T 78×.20=15.6 + Technical 92×.15=13.8 + Schema 85×.10=8.5 + Platform 70×.10=7 → **≈79–80/100**. Aligns with prior internal 80–82.

## 7. How to reproduce with geo-skills

```bash
python -m pip install geoskills==0.1.1
geoskills --json validate
geoskills inspect https://spacenexus.net --mode full --json
geoskills citability https://spacenexus.net --json
# agent-led (Claude Code):
# /geo audit https://spacenexus.net
```

## 8. Verdict

geo-skills is a **legit, well-architected free alternative to paid GEO dashboards** for the "can AI cite this?" question. Its moat: weighted composite score + passage-level citability + crawler/index prerequisites + fail-closed evidence rules + portable SKILL.md + read-only CLI. For SpaceNexus specifically it confirms strong foundations (robots, llms.txt, schema, FAQs) and points to answer-first intros, fan-out titles, YouTube transcripts, and citation-share tracking as next levers. Recommended: adopt `geo-citability` + `geo-crawlers` + `geo-llmstxt` as CI checks on every content PR.
