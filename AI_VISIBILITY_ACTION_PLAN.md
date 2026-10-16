# AI Visibility Score Improvement Plan

**Target: 69 → 89/100**

---

## Phase 1: Critical Fixes

**Task 1:** Fix the merge conflict in `public/llms.txt` — remove all git conflict markers (`<<<<<<< HEAD`, `=======`, `>>>>>>> origin/main`) and keep the correct content.

**Task 2:** Delete `public/robots.txt` — keep only the dynamic `app/robots.ts` to avoid conflicting rules.

**Task 3:** Sync the homepage `faqSchema` in `app/page.tsx` with the questions actually rendered by `FAQSection.tsx` — they currently show different questions and answers.

---

## Phase 2: Schema Markup

**Task 4:** Add FAQPage JSON-LD schema to the `FAQSection.tsx` component so every page using it gets structured FAQ data.

**Task 5:** Add Service schema to the homepage (`app/page.tsx`).

**Task 6:** Add Service schema to the security page (`app/security/page.tsx`).

**Task 7:** Add Service schema to the pricing page (`app/pricing/page.tsx`).

**Task 8:** Add Service schema to the about page (`app/about/page.tsx`).

**Task 9:** Add Service schema to the reviews page (`app/reviews/page.tsx`).

**Task 10:** Add Service schema to the glossary page (`app/glossary/page.tsx`).

**Task 11:** Add Person/Author schema to the global `JsonLd.tsx` component so all pages have author attribution.

**Task 12:** Add LocalBusiness schema with office locations (Sacramento, New York) to `JsonLd.tsx`.

**Task 13:** Add SpeakableSpecification to the homepage.

**Task 14:** Add SpeakableSpecification to the pricing page.

**Task 15:** Add SpeakableSpecification to the security page.

---

## Phase 3: AI Citability and E-E-A-T

**Task 16:** Rewrite FAQ answers in `FAQSection.tsx` to be 40-60 words each — concise, direct, and AI-extractable.

**Task 17:** Add FAQPage schema to all industry pages (`/industries/*`) that have FAQ content but no schema.

**Task 18:** Add FAQPage schema to all solution pages (`/solutions/*`) that have FAQ content but no schema.

**Task 19:** Add author bios with credentials (name, title, expertise) to key content pages like features and solutions.

**Task 20:** Make all `dateModified` values dynamic instead of hardcoded strings — use current date or a config value.

**Task 21:** Add statistics with cited sources to the homepage and key feature pages.

**Task 22:** Create a `/pricing.md` machine-readable file in `public/` with structured pricing data for AI agents.

---

## Phase 4: Verification

**Task 23:** Validate all schema changes using Google Rich Results Test for each modified page.

**Task 24:** Re-run the AI visibility audit on aibizmod.com to confirm score improvement.

---

**Total: 24 tasks across 4 phases.**
