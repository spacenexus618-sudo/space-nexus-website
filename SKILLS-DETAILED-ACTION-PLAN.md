# SpaceNexus Skills — Detailed Action Plan

## Overview

Detailed task breakdown for 13 skills from `.claude/skills/`. Each skill has 5-10 specific tasks.

---

## Skill 1: seo-audit ✅ DONE

**Purpose**: Find and fix SEO issues to improve rankings

| Task | Description | Priority | Status |
|------|-------------|----------|--------|
| 1.1 | Run site crawl with Screaming Frog or Sitebulb | High | ✅ |
| 1.2 | Check for broken links (404 errors) | High | ✅ |
| 1.3 | Audit meta titles (unique, keyword-rich, <60 chars) | High | ✅ |
| 1.4 | Audit meta descriptions (unique, compelling, <160 chars) | High | ✅ |
| 1.5 | Check for duplicate content issues | High | ✅ |
| 1.6 | Verify XML sitemap is submitted to Google Search Console | High | ✅ |
| 1.7 | Audit robots.txt for crawl errors | High | ✅ |
| 1.8 | Check page speed scores (Core Web Vitals) | Medium | ✅ |
| 1.9 | Audit internal linking structure | Medium | ✅ |
| 1.10 | Check for missing alt text on images | Medium | ✅ |
| 1.11 | Verify canonical tags are correct | Medium | ✅ |
| 1.12 | Check for mobile usability issues | Medium | ✅ |
| 1.13 | Audit schema markup presence | Low | ✅ |
| 1.14 | Check for HTTPS issues | Low | ✅ |
| 1.15 | Verify hreflang tags (if multilingual) | Low | ✅ |

**Output**: SEO audit report with prioritized fixes

---

## Skill 2: schema-markup ✅ DONE

**Purpose**: Add structured data for rich snippets in search results

| Task | Description | Priority | Status |
|------|-------------|----------|--------|
| 2.1 | Add Organization schema to homepage | High | ✅ |
| 2.2 | Add BreadcrumbList schema to all pages | High | ✅ |
| 2.3 | Add FAQPage schema to feature pages | High | ✅ |
| 2.4 | Add SoftwareApplication schema to pricing page | High | ✅ |
| 2.5 | Add Review/AggregateRating schema to testimonials | Medium | ✅ |
| 2.6 | Add Product schema to pricing tiers | Medium | ✅ |
| 2.7 | Add HowTo schema to migration guides | Medium | ✅ |
| 2.8 | Add Video schema to demo page | Low | ✅ |
| 2.9 | Add Event schema to webinars (if any) | Low | ✅ |
| 2.10 | Test all schema with Google Rich Results Test | High | ✅ |

**Output**: JSON-LD schema added to all key pages

---

## Skill 3: analytics-tracking ✅ DONE

**Purpose**: Set up GA4 tracking to measure what's working

| Task | Description | Priority | Status |
|------|-------------|----------|--------|
| 3.1 | Verify GA4 is tracking all pages correctly | High | ✅ |
| 3.2 | Set up conversion event: demo_request | High | ✅ |
| 3.3 | Set up conversion event: signup_complete | High | ✅ |
| 3.4 | Set up conversion event: pricing_page_view | High | ✅ |
| 3.5 | Track CTA button clicks (all pages) | High | ✅ |
| 3.6 | Track scroll depth (25%, 50%, 75%, 100%) | Medium | ✅ |
| 3.7 | Track internal link clicks | Medium | ✅ |
| 3.8 | Set up custom dashboard in GA4 | Medium | ✅ |
| 3.9 | Track form submissions | Medium | ✅ |
| 3.10 | Set up UTM parameter tracking | Low | ✅ |
| 3.11 | Create monthly reporting template | Low | ✅ |

**Output**: GA4 events configured + dashboard

---

## Skill 4: ai-seo ✅ DONE

**Purpose**: Optimize for AI search engines (ChatGPT, Perplexity, Claude)

| Task | Description | Priority | Status |
|------|-------------|----------|--------|
| 4.1 | Create llms.txt file for AI crawlers | High | ✅ |
| 4.2 | Add definition blocks ("What is [X]") to key pages | High | ✅ |
| 4.3 | Optimize for featured snippets (concise answers) | Medium | ✅ |
| 4.4 | Add structured data for AI parsing | Medium | ✅ |
| 4.5 | Add FAQ sections with direct answers | Medium | ✅ |
| 4.6 | Optimize headings for question-based queries | Medium | ✅ |
| 4.7 | Add comparison tables (AI loves structured data) | Low | ✅ |
| 4.8 | Create glossary page for industry terms | Low | ✅ |

**Output**: AI SEO optimizations implemented

---

## Skill 5: page-cro ✅ DONE

**Purpose**: Improve conversions on marketing pages

| Task | Description | Priority | Status |
|------|-------------|----------|--------|
| 5.1 | Audit hero section clarity (value prop in 5 seconds) | High | ✅ |
| 5.2 | Test CTA copy ("Get Started" vs "Start Free Trial") | High | ✅ |
| 5.3 | Improve social proof (testimonials, logos, numbers) | High | ✅ |
| 5.4 | Reduce form fields (name, email, company only) | High | ✅ |
| 5.5 | Add urgency elements (limited time offers) | Medium | ✅ |
| 5.6 | Improve mobile experience | Medium | ✅ |
| 5.7 | Add live chat/chatbot | Medium | ✅ |
| 5.8 | Create dedicated landing pages for ads | Low | ✅ |
| 5.9 | A/B test pricing page layout | Low | ✅ |

**Output**: CRO recommendations + implementations

---

## Skill 6: signup-flow-cro

**Purpose**: Optimize signup/registration process

| Task | Description | Priority |
|------|-------------|----------|
| 6.1 | Audit signup form fields (remove unnecessary) | High |
| 6.2 | Add social login (Google, LinkedIn) | Medium |
| 6.3 | Add progress indicator (if multi-step) | Medium |
| 6.4 | Test single-page vs multi-step signup | Medium |
| 6.5 | Add trust signals (security badges, privacy policy) | Medium |
| 6.6 | Optimize confirmation email | Low |
| 6.7 | Add welcome screen/onboarding | Low |
| 6.8 | Test different signup CTAs | Low |

**Output**: Optimized signup flow

---

## Skill 7: form-cro

**Purpose**: Optimize lead capture forms

| Task | Description | Priority |
|------|-------------|----------|
| 7.1 | Audit form fields (remove friction) | High |
| 7.2 | Add smart defaults (country, company size) | Medium |
| 7.3 | Improve error messages (helpful, not generic) | Medium |
| 7.4 | Test multi-step vs single-step forms | Medium |
| 7.5 | Add progress bars for long forms | Low |
| 7.6 | Add autofill support | Low |
| 7.7 | Test button copy ("Submit" vs "Get My Demo") | Low |
| 7.8 | Add inline validation | Low |

**Output**: Optimized forms

---

## Skill 8: copywriting ✅ DONE

**Purpose**: Write/improve marketing copy

| Task | Description | Priority | Status |
|------|-------------|----------|--------|
| 8.1 | Rewrite homepage hero headline | High | ✅ |
| 8.2 | Improve pricing page copy | High | ✅ |
| 8.3 | Enhance feature page descriptions | Medium | ✅ |
| 8.4 | Write better CTAs (action-oriented) | Medium | ✅ |
| 8.5 | Create compelling meta descriptions | Medium | ✅ |
| 8.6 | Write case study templates | Low | ✅ |
| 8.7 | Create email copy templates | Low | ✅ |
| 8.8 | Write social media copy | Low | ✅ |

**Output**: Updated copy on key pages

---

## Skill 9: copy-editing

**Purpose**: Polish existing content

| Task | Description | Priority |
|------|-------------|----------|
| 9.1 | Fix grammar and spelling errors | High |
| 9.2 | Improve readability (shorter sentences) | Medium |
| 9.3 | Ensure consistent tone of voice | Medium |
| 9.4 | Remove jargon and buzzwords | Medium |
| 9.5 | Add power words (boost, unlock, transform) | Low |
| 9.6 | Ensure consistent formatting | Low |
| 9.7 | Add transition words for flow | Low |

**Output**: Polished content

---

## Skill 10: social-content

**Purpose**: Create social media content

| Task | Description | Priority |
|------|-------------|----------|
| 10.1 | Create LinkedIn post templates | Low |
| 10.2 | Write Twitter/X thread templates | Low |
| 10.3 | Plan 30-day content calendar | Low |
| 10.4 | Repurpose blog posts into social content | Low |
| 10.5 | Create branded graphics templates | Low |
| 10.6 | Write engagement prompts/questions | Low |

**Output**: Social media content plan

---

## Skill 11: email-sequence

**Purpose**: Create email nurture campaigns

| Task | Description | Priority |
|------|-------------|----------|
| 11.1 | Design welcome sequence (5 emails) | Low |
| 11.2 | Create demo follow-up sequence (3 emails) | Low |
| 11.3 | Build re-engagement campaign | Low |
| 11.4 | Write onboarding emails | Low |
| 11.5 | Create newsletter template | Low |
| 11.6 | Set up email automation workflows | Low |

**Output**: Email sequences

---

## Skill 12: ab-test-setup

**Purpose**: Plan and run A/B tests

| Task | Description | Priority |
|------|-------------|----------|
| 12.1 | Identify test hypotheses (what to test) | Low |
| 12.2 | Set up test variations | Low |
| 12.3 | Define success metrics | Low |
| 12.4 | Run tests (minimum 2 weeks) | Low |
| 12.5 | Analyze results | Low |
| 12.6 | Implement winners | Low |

**Output**: A/B test results

---

## Skill 13: free-tools

**Purpose**: Build free tools for lead generation

| Task | Description | Priority |
|------|-------------|----------|
| 13.1 | Identify tool ideas (ROI calculator, VDR grader) | Low |
| 13.2 | Plan tool features | Low |
| 13.3 | Design UI/UX | Low |
| 13.4 | Build tool | Low |
| 13.5 | Add lead capture form | Low |
| 13.6 | Launch and promote | Low |

**Output**: Free tool for lead generation

---

## Summary by Priority

### 🔴 High Priority (Do First)
- seo-audit: 15 tasks ✅ DONE
- schema-markup: 10 tasks ✅ DONE
- analytics-tracking: 11 tasks ✅ DONE
- page-cro: 9 tasks ✅ DONE

### 🟡 Medium Priority (Do Second)
- ai-seo: 8 tasks ✅ DONE
- copywriting: 8 tasks ✅ DONE
- copy-editing: 7 tasks
- form-cro: 8 tasks
- signup-flow-cro: 8 tasks

**Total Medium Priority: 39 tasks (16 done)**

### 🟢 Low Priority (Do Last)
- social-content: 6 tasks
- email-sequence: 6 tasks
- ab-test-setup: 6 tasks
- free-tools: 6 tasks

**Total Low Priority: 24 tasks**

---

## Grand Total

| Priority | Tasks |
|----------|-------|
| High | 45 |
| Medium | 39 |
| Low | 24 |
| **Total** | **108 tasks** |

---

## Recommended Execution Order

| Week | Skills | Tasks | Status |
|------|--------|-------|--------|
| 1 | seo-audit | 15 | ✅ Done |
| 2 | schema-markup | 10 | ✅ Done |
| 3 | analytics-tracking | 11 | ✅ Done |
| 4 | page-cro | 9 | ✅ Done |
| 5 | ai-seo + copywriting | 16 | ✅ Done |
| 6 | copy-editing + form-cro | 15 | |
| 7 | signup-flow-cro | 8 | |
| 8 | social-content + email-sequence | 12 | |
| 9 | ab-test-setup + free-tools | 12 | |

---

**Next Step**: Start with `seo-audit` (Task 1.1 - Run site crawl)
