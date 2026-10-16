# Knowledge Graph Page — Action Plan

**Target:** `/knowledge-graph`
**Purpose:** Public explainer diagram page showing how entities and information are connected through VeritasGraph.

---

## Files to Create/Modify

| # | File | Action | Description |
|---|------|--------|-------------|
| 1 | `spacenexus/app/knowledge-graph/page.tsx` | **CREATE** | Main page (server component) |
| 2 | `spacenexus/app/sitemap.ts` | **MODIFY** | Add `/knowledge-graph` route |

---

## Section 1: Hero

- Breadcrumb: Home > Knowledge Graph
- Badge: "VeritasGraph"
- H1: "The Connected Knowledge Graph"
- Subtitle: Explain how VeritasGraph links entities, documents, and facilities into a single queryable graph.
- Two CTAs: "See the Diagram" (anchor link) + "Request a Demo" (/demo)
- `AnswerBlock` with GEO-optimized paragraph for LLM citation

---

## Section 2: Public Knowledge-Graph Explainer Diagram (SVG)

This is the core deliverable. An inline SVG diagram inside `<figure>`.

### Diagram Layout

```
                    [Documents]
                   /     |     \
                  /      |      \
    [People] ---+--- [VeritasGraph] ---+--- [Organizations]
                  \      |      /
                   \     |     /
                    [Facilities]
                   /      |      \
                  /       |       \
        [Financial Data]  +  [Contracts]
                          |
                   [Space Data Hub]
```

### SVG Nodes (7 entity types)

| Node | Color | Position |
|------|-------|----------|
| VeritasGraph (center) | #2563eb (blue) | Center |
| Documents | #10b981 (green) | Top |
| People | #f59e0b (amber) | Left |
| Organizations | #8b5cf6 (purple) | Right |
| Facilities | #ef4444 (red) | Bottom-left |
| Financial Data | #06b6d4 (cyan) | Bottom-right |
| Contracts | #ec4899 (pink) | Bottom |
| Space Data Hub | #1e3a8a (dark blue) | Bottom-center (below contracts) |

### SVG Edges

- Each outer node connects to the center VeritasGraph node
- Edge labels show relationship types: "authored by", "managed by", "located at", "references", "linked to", "stored in"

### Crawlability Requirements

```html
<figure role="img" aria-label="Knowledge graph diagram showing how VeritasGraph connects documents, people, organizations, facilities, financial data, and contracts through entity linking and the Space Data Hub">
  <svg ...>...</svg>
  <figcaption>
    Diagram: VeritasGraph knowledge graph connecting entities...
  </figcaption>
  <noscript>
    <p>Text fallback describing the diagram</p>
  </noscript>
</figure>
```

---

## Section 3: Connected Knowledge Graph

3-column grid explaining:
1. **Entity Extraction** — VeritasGraph parses documents to extract entities (people, orgs, dates, amounts)
2. **Relationship Mapping** — Entities are linked through typed relationships (e.g., "Person A signed Contract B for Organization C")
3. **Multi-Hop Reasoning** — Queries traverse multiple edges to answer complex questions (e.g., "Which contracts reference this facility?")

---

## Section 4: Entity Linking

Explanation of how VeritasGraph resolves entity references:
- Coreference resolution (same entity, different mentions)
- Canonical entity identification
- Cross-document linking
- Fuzzy matching for near-duplicates

Each point as a card with icon.

---

## Section 5: Space Data Hub

The Space Data Hub as the ingestion layer:
- Document ingestion pipeline
- Auto-categorization
- Entity extraction
- Graph construction
- Real-time updates

Flow diagram (horizontal steps, inline SVG or styled divs).

---

## Section 6: GEO Task — Generative Engine Optimization

How the knowledge graph powers GEO:
- AI citability scoring
- Source attribution on every answer
- Verifiable reasoning paths
- Structured data for LLM consumption
- `llms.txt` integration

---

## Section 7: FAQ (6 items)

With `FAQPage` JSON-LD schema.

Questions:
1. What is a knowledge graph?
2. How does VeritasGraph build the knowledge graph?
3. What is entity linking and why does it matter?
4. How does the Space Data Hub feed the knowledge graph?
5. What is GEO (Generative Engine Optimization)?
6. Can the knowledge graph run on-premise?

---

## Section 8: CTA + Last Updated

- Gradient blue CTA section
- `<LastUpdated date="2026-09-15" />`

---

## JSON-LD Schemas

### 1. Dataset Schema

```json
{
  "@context": "https://schema.org",
  "@type": "Dataset",
  "@id": "https://spacenexus.net/knowledge-graph#dataset",
  "name": "VeritasGraph Knowledge Graph Schema",
  "description": "Schema describing the entity types and relationships in the VeritasGraph knowledge graph powering SpaceNexus.",
  "url": "https://spacenexus.net/knowledge-graph",
  "creator": { "@id": "https://spacenexus.net/#organization" },
  "isBasedOn": { "@id": "https://spacenexus.net/#veritasgraph" },
  "variableMeasured": [
    "Entity Type",
    "Relationship Type",
    "Source Document",
    "Confidence Score",
    "Reasoning Path"
  ],
  "measurementTechnique": "GraphRAG Knowledge Graph Construction"
}
```

### 2. FAQPage Schema

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    { "@type": "Question", "name": "What is a knowledge graph?", "acceptedAnswer": { "@type": "Answer", "text": "..." }},
    ...
  ]
}
```

### 3. BreadcrumbList Schema

```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://spacenexus.net" },
    { "@type": "ListItem", "position": 2, "name": "Knowledge Graph", "item": "https://spacenexus.net/knowledge-graph" }
  ]
}
```

### 4. WebPage Schema

```json
{
  "@context": "https://schema.org",
  "@type": "WebPage",
  "@id": "https://spacenexus.net/knowledge-graph#webpage",
  "url": "https://spacenexus.net/knowledge-graph",
  "name": "The Connected Knowledge Graph — How VeritasGraph Links Entities",
  "isPartOf": { "@id": "https://spacenexus.net/#website" },
  "about": { "@id": "https://spacenexus.net/#veritasgraph" },
  "description": "Public explainer of how VeritasGraph builds a connected knowledge graph with entity linking, the Space Data Hub, and GEO task support."
}
```

---

## Sitemap Addition

Add to `app/sitemap.ts` in the `vdrStaticPages` array:

```ts
{ route: "/knowledge-graph", priority: 0.8, changeFrequency: "monthly" as const },
```

---

## Implementation Order

1. **Step 1:** Create `app/knowledge-graph/page.tsx` with metadata, JSON-LD schemas, and page structure
2. **Step 2:** Build the inline SVG diagram with all 8 nodes, edges, and labels
3. **Step 3:** Add crawlability attributes (`role="img"`, `aria-label`, `<figcaption>`, `<noscript>`)
4. **Step 4:** Add the Dataset JSON-LD schema
5. **Step 5:** Build remaining sections (Connected KG, Entity Linking, Space Data Hub, GEO, FAQ, CTA)
6. **Step 6:** Add route to `app/sitemap.ts`
7. **Step 7:** Run `npm run build` to verify no errors
8. **Step 8:** Run `npm run lint` to verify code quality

---

## Conventions to Follow

- Server component (no `"use client"`)
- Export `metadata: Metadata` for SEO
- JSON-LD via `<Script type="application/ld+json">` with `dangerouslySetInnerHTML`
- Tailwind utility classes (no CSS modules)
- Primary color: `#2563eb`, hover: `#1d4ed8`
- Alternating section backgrounds: `white` / `#f8f9fa`
- `py-16 lg:py-24` section spacing
- `max-w-7xl` container width
- `pt-20 lg:pt-24` on `<main>` for header offset
- Inline SVG icons (no icon library)
- `rounded-2xl` for cards, `rounded-full` for buttons/badges
- Accessibility: `aria-labelledby`, `aria-label`, `role`
