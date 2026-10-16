# SpaceNexus Copywriting — 30-Task Action Plan

> Generated from [copywriting skill](.claude/skills/copywriting/SKILL.md)
> Goal: Improve content quality to boost rankings and conversions

---

## Phase 1: Homepage Headlines & CTAs (Tasks 1–10)

### Task 1: Rewrite Hero Headline
**File:** `app/components/HeroSection.tsx:22-29`
- Current: "AI-Powered Virtual Data Room Software for M&A, Fundraising & Legal Deals"
- Problem: Generic, doesn't communicate outcome
- [ ] Rewrite using formula: "{Achieve outcome} without {pain point}"
- [ ] Provide 3 alternatives:
  - Option A: "Close M&A Deals 3x Faster Without the Security Risk"
  - Option B: "The Virtual Data Room That Sets Up in 24 Hours, Not 2 Weeks"
  - Option C: "Due Diligence Without the Drama"
- [ ] Select best option based on search intent match

### Task 2: Rewrite Hero Subheadline
**File:** `app/components/HeroSection.tsx:32-36`
- Current: "Virtual data room software purpose-built for M&A, capital raising, and legal transactions. AI-powered document processing, SOC 2 certified, and live in under 24 hours."
- Problem: Repeats headline, too long
- [ ] Make it 1-2 sentences max
- [ ] Add specificity: "Join 500+ enterprises who closed deals 3x faster"
- [ ] Include key differentiator: "Live in 24 hours, not 2 weeks"

### Task 3: Improve Primary CTA
**File:** `app/components/HeroSection.tsx:42-60`
- Current: "Talk to Founders"
- Problem: Doesn't communicate value
- [ ] Change to action-oriented: "Start Free Trial" or "See SpaceNexus in Action"
- [ ] Add risk reversal below: "No credit card required · Setup in 24 hours"
- [ ] Test 2-3 variations

### Task 4: Improve Secondary CTA
**File:** `app/components/HeroSection.tsx:61-66`
- Current: "Explore Features"
- Problem: Passive, doesn't drive action
- [ ] Change to: "See How It Works" or "Watch 2-Min Demo"
- [ ] Make it clear what they'll get

### Task 5: Add Social Proof Near CTA
**File:** `app/components/HeroSection.tsx:69-85`
- Current: "Built by a team from: Fortune 500, Big 4 Consulting, Top Investment Banks"
- Problem: Vague, no specific proof
- [ ] Add specific numbers: "500+ enterprises · 10,000+ deals closed"
- [ ] Add customer logos if available
- [ ] Add 1 testimonial quote near CTA

### Task 6: Rewrite Benefits Headlines
**File:** `app/components/BenefitsSection.tsx:19-82`
- Current labels: "Lightning Fast Setup", "Bank-Grade Security", "AI-Powered Intelligence", "Global Infrastructure"
- Problem: Feature-focused, not benefit-focused
- [ ] Convert to benefits:
  - "Lightning Fast Setup" → "Live in 24 Hours, Not 2 Weeks"
  - "Bank-Grade Security" → "SOC 2 Certified, Bank-Grade Protection"
  - "AI-Powered Intelligence" → "Process 1,000 Documents in Minutes"
  - "Global Infrastructure" → "99.99% Uptime, Access Anywhere"

### Task 7: Rewrite Benefits Descriptions
**File:** `app/components/BenefitsSection.tsx:20-82`
- Current: Generic descriptions like "Get your data room up and running in minutes, not days"
- Problem: Not specific enough
- [ ] Add numbers: "Setup takes 24 hours, not 2 weeks"
- [ ] Add outcome: "Save 40 hours per deal on document processing"
- [ ] Use customer language, not company jargon

### Task 8: Add "How It Works" Section
**File:** New component or `app/components/BenefitsSection.tsx`
- [ ] Create 3-step process:
  1. "Upload your documents" (with time estimate)
  2. "Set permissions and invite users"
  3. "Track activity and close your deal"
- [ ] Add visual for each step
- [ ] Keep copy simple and scannable

### Task 9: Rewrite Testimonials Section Header
**File:** `app/components/TestimonialsSection.tsx:41-55`
- Current: "Trusted by M&A professionals worldwide"
- Problem: Generic
- [ ] Make it specific: "500+ Teams Closed Deals Faster with SpaceNexus"
- [ ] Add social proof numbers

### Task 10: Improve Trust Bar
**File:** `app/components/TrustBar.tsx`
- [ ] Add specific customer logos (if available)
- [ ] Add usage stats: "10,000+ documents processed daily"
- [ ] Add certification badges: SOC 2, ISO 27001

---

## Phase 2: Pricing Page Copy (Tasks 11–16)

### Task 11: Rewrite Pricing Headline
**File:** `app/pricing/page.tsx`
- Current: "Transparent VDR Pricing"
- Problem: Generic, doesn't address anxiety
- [ ] Rewrite: "Flat-Rate Pricing. No Surprises. No Per-Page Fees."
- [ ] Add subheadline: "See exactly what you pay — no hidden costs"

### Task 12: Add Plan Recommendation
**File:** `app/pricing/page.tsx`
- [ ] Add "Which plan is right for you?" section
- [ ] Create decision tree:
  - "Single deal? → Starter"
  - "Multiple deals? → Professional"
  - "Enterprise needs? → Enterprise"
- [ ] Highlight recommended plan more prominently

### Task 13: Improve Starter CTA
**File:** `app/pricing/page.tsx:37`
- Current: "Get Started"
- Problem: Generic
- [ ] Change to: "Start Your First Deal" or "Get Started in 24 Hours"
- [ ] Add risk reversal: "No credit card required"

### Task 14: Improve Professional CTA
**File:** `app/pricing/page.tsx:60`
- Current: "Talk to Sales"
- Problem: Passive
- [ ] Change to: "See SpaceNexus in Action" or "Get a Demo"
- [ ] Add social proof: "Most Popular · 500+ teams"

### Task 15: Add Price Comparison
**File:** `app/pricing/page.tsx`
- [ ] Add "Why teams switch" section
- [ ] Show savings vs competitors (if data available)
- [ ] Example: "Save $5,000+ per deal vs traditional VDRs"
- [ ] Add "No per-page fees" callout

### Task 16: Add Urgency
**File:** `app/pricing/page.tsx`
- [ ] Add setup timeline: "Live in 24 hours"
- [ ] Add social proof: "500+ teams already using SpaceNexus"
- [ ] Add "Questions? Talk to sales" fallback CTA

---

## Phase 3: Feature Pages Copy (Tasks 17–22)

### Task 17: Audit Feature Page Headlines
**Files:** `app/features/*/page.tsx`
- [ ] List all feature pages
- [ ] Check headline clarity
- [ ] Ensure benefit-focused (not feature-focused)
- [ ] Example: "AI Document Processing" → "Process 1,000 Documents in Minutes"

### Task 18: Add Use Cases to Feature Pages
**Files:** Feature pages
- [ ] Add "How teams use this" section
- [ ] Show real-world scenarios
- [ ] Connect feature to business outcome
- [ ] Add case study snippets

### Task 19: Improve Feature Page CTAs
**Files:** Feature pages
- [ ] Add contextual CTAs: "See AI Processing in Action"
- [ ] Add secondary CTA: "Read Case Study"
- [ ] Place CTA after benefits, not just at bottom

### Task 20: Add Social Proof to Feature Pages
**Files:** Feature pages
- [ ] Add testimonial quotes related to each feature
- [ ] Add usage stats: "10,000+ documents processed"
- [ ] Add trust badges: SOC 2, ISO 27001

### Task 21: Optimize Meta Descriptions
**Files:** Feature pages
- [ ] Write unique meta descriptions for each feature page
- [ ] Include primary keyword
- [ ] Add benefit and CTA
- [ ] Keep under 160 characters

### Task 22: Improve Feature Descriptions
**Files:** Feature pages
- [ ] Convert features to benefits
- [ ] Add specificity: numbers, timeframes
- [ ] Remove jargon
- [ ] Use customer language

---

## Phase 4: Competitor Pages Copy (Tasks 23–27)

### Task 23: Audit Competitor Headlines
**Files:** `app/competitors/*/page.tsx`
- [ ] Check all 12+ competitor alternative pages
- [ ] Ensure headline is specific: "[Competitor] Alternative for [Use Case]"
- [ ] Add value proposition in first paragraph

### Task 24: Improve Competitor CTAs
**Files:** Competitor pages
- [ ] Add contextual CTAs: "Try SpaceNexus Free"
- [ ] Add secondary CTA: "Download Comparison Guide"
- [ ] Add risk reversal: "No credit card required"

### Task 25: Add Social Proof to Competitor Pages
**Files:** Competitor pages
- [ ] Add customer quotes: "We switched from [Competitor] and..."
- [ ] Add migration stats: "500+ teams migrated from [Competitor]"
- [ ] Add comparison table with clear winner

### Task 26: Improve "Why Switch" Section
**Files:** Competitor pages
- [ ] Make switching benefits specific
- [ ] Example: "Save 40% vs [Competitor]"
- [ ] Address switching objections
- [ ] Add migration guide link

### Task 27: Add Competitor-Specific FAQs
**Files:** Competitor pages
- [ ] Add FAQs about switching from each competitor
- [ ] Address common objections
- [ ] Add pricing comparison

---

## Phase 5: Blog Content Copy (Tasks 28–30)

### Task 28: Audit Blog Headlines
**Files:** `app/blog/*/page.tsx`
- [ ] Check all blog posts for headline quality
- [ ] Use curiosity + benefit formula
- [ ] Example: "How to Close M&A Deals 3x Faster (Without the Risk)"
- [ ] Add numbers and specificity

### Task 29: Improve Blog Intros
**Files:** Blog posts
- [ ] Hook readers in first 2 sentences
- [ ] Use rhetorical questions: "Tired of slow due diligence?"
- [ ] State the benefit upfront
- [ ] Add clear CTA within first 200 words

### Task 30: Add CTAs to Blog Posts
**Files:** Blog posts
- [ ] Add contextual CTAs matching content topic
- [ ] Place CTAs at natural stopping points
- [ ] Add "Related Product" CTA at end
- [ ] Example: After M&A article → "See Our M&A Data Room"

---

## Summary

| Phase | Tasks | Focus Area | Files |
|-------|-------|------------|-------|
| 1 | 1–10 | Homepage | HeroSection, BenefitsSection, TestimonialsSection |
| 2 | 11–16 | Pricing | pricing/page.tsx |
| 3 | 17–22 | Features | features/*/page.tsx |
| 4 | 23–27 | Competitors | competitors/*/page.tsx |
| 5 | 28–30 | Blog | blog/*/page.tsx |
| **Total** | **30** | **Full Site Copy** | **All major pages** |

---

## Expected Impact

- **Rankings:** Better content quality signals to Google
- **Conversions:** Clearer value propositions drive more demo requests
- **User Experience:** Easier to understand and act
- **AI Citations:** Better structured content for AI search engines

---

## Next Steps

1. Start with Phase 1 (Homepage) — highest impact
2. Use `copy-editing` skill after each phase for polish
3. Use `ab-test-setup` to test headline/CTA variations
4. Track results with `analytics-tracking`
