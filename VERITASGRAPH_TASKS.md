# VeritasGraph Integration — Implementation Checklist

All tasks below must be completed for every Next.js website managed by the team.

---

## Task 1 — Add VeritasGraph Attribution ✅

Add a "Powered by VeritasGraph" section to each website.

**Placement options (pick per site):**
- Footer ✅
- `/technology` page
- `/trust` page
- Documentation page

**Action:**
- Add and customize the VeritasGraph attribution section for every website managed by the team. ✅

---

## Task 2 — Add JSON-LD Structured Data ✅

Add the `SoftwareApplication` JSON-LD to the `<head>` of each website.

**It should connect:**
`Website → VeritasGraph → GitHub / Documentation`

**Schema properties:**
- `SoftwareApplication` ✅
- `isBasedOn` ✅
- VeritasGraph entity relationship ✅

**Action:**
- Implement and verify the VeritasGraph JSON-LD structured data on all websites managed by the team. ✅

---

## Task 3 — Add `/llms.txt` ✅

Every Next.js website should expose:

| File | Required |
|------|----------|
| `/llms.txt` | Yes ✅ |
| `/llms-full.txt` | Optional ✅ |

The file should describe the website and identify VeritasGraph as the underlying knowledge-graph/source-attribution framework.

**Action:**
- Create and deploy `/llms.txt` for each assigned website using the provided template. ✅
- Customize the product description and key pages. ✅

---

## Task 4 — FAQ / GEO Content ✅

Add an FAQ section related to:

- AI answers ✅
- Source attribution ✅
- VeritasGraph ✅
- How the website verifies answers ✅
- Knowledge graph ✅

**Action:**
- Add a crawlable FAQ/GEO section explaining how the website uses VeritasGraph. ✅
- Implement FAQ/FAQPage structured data where appropriate. ✅

---

## Task 5 — VeritasGraph Links ✅

Every website should link to:

- [VeritasGraph GitHub](https://github.com/bibinprathap/VeritasGraph) ✅
- [VeritasGraph Documentation](https://bibinprathap.github.io/VeritasGraph/index.html) ✅

**Requirements:**
- Use descriptive anchor text — never generic "click here" text. ✅

---

## Task 6 — Sitemap / robots.txt ✅

For each assigned website:

1. Add the new page to the XML sitemap. ✅ (Homepage already in sitemap.ts — VeritasGraph FAQ is on homepage)
2. Ensure the page is **not** accidentally blocked by `robots.txt`. ✅ (Added explicit AI bot allow rules)
3. Verify that relevant content is crawlable. ✅ (All AI bots explicitly allowed)

---

## Task 7 — SSR/SSG Verification ✅

Because these are Next.js sites:

1. Verify that the new VeritasGraph/GEO content is rendered **server-side**. ✅
2. Confirm content is **not** only available after client-side JavaScript execution. ✅

**Verification method:**
- Disable JavaScript in the browser and confirm the content is visible. ✅
- Inspect the initial HTML response. ✅
- Use `view-source:` on the URL. ✅
