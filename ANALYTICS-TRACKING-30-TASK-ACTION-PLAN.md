# SpaceNexus Analytics Tracking — 30-Task Action Plan

> Generated from [analytics-tracking skill](.claude/skills/analytics-tracking/SKILL.md)
> Goal: Set up tracking that informs marketing decisions and improves conversions

---

## Why Analytics Tracking Matters

**Without analytics tracking:**
- Don't know which pages convert
- Can't measure what's working
- Flying blind on marketing spend
- Can't optimize for demo requests
- No data for A/B tests

**With analytics tracking:**
- Know which pages drive demos
- Measure content performance
- Optimize marketing ROI
- Improve conversion rates
- Data-driven decisions

---

## Phase 1: GA4 Setup & Configuration (Tasks 1–8)

### Task 1: Verify GA4 Installation
**File:** `app/layout.tsx` or GTM container
- [ ] Check if GA4 is installed
- [ ] Verify tracking ID is correct
- [ ] Check if enhanced measurement is enabled
- [ ] Test real-time reports in GA4
- [ ] Document: Is GA4 working? Yes/No

### Task 2: Set Up GA4 Property Structure
**File:** GA4 Admin
- [ ] Create GA4 property (if not exists)
- [ ] Set up data stream for spacenexus.net
- [ ] Configure data retention settings (14 months)
- [ ] Enable Google Signals (if allowed)
- [ ] Document: GA4 property ID

### Task 3: Configure Enhanced Measurement
**File:** GA4 Admin → Data Streams → Enhanced Measurement
- [ ] Enable page views
- [ ] Enable scrolls (90% depth)
- [ ] Enable outbound clicks
- [ ] Enable site search
- [ ] Enable file downloads
- [ ] Document: Which enhanced measurements are active?

### Task 4: Set Up Conversion Events
**File:** GA4 Admin → Conversions
- [ ] Mark `demo_requested` as conversion
- [ ] Mark `form_submitted` as conversion
- [ ] Mark `signup_completed` as conversion (if applicable)
- [ ] Set counting method: Once per session
- [ ] Document: Which events are conversions?

### Task 5: Create Custom Dimensions
**File:** GA4 Admin → Custom Definitions
- [ ] Create `user_type` dimension (new/returning)
- [ ] Create `page_category` dimension (homepage/pricing/features/competitors/blog)
- [ ] Create `cta_location` dimension (hero/section/footer)
- [ ] Document: Custom dimensions created

### Task 6: Set Up Content Groupings
**File:** GA4 Admin → Content Groupings
- [ ] Group pages by type:
  - Product pages (homepage, features, pricing)
  - Competitor pages
  - Blog posts
  - Legal pages (privacy, terms)
- [ ] Document: Content groupings configured

### Task 7: Configure Audiences
**File:** GA4 Admin → Audiences
- [ ] Create "High Intent" audience (visited pricing + features)
- [ ] Create "Competitor Researchers" audience (visited competitor pages)
- [ ] Create "Blog Readers" audience (2+ blog posts)
- [ ] Document: Audiences created

### Task 8: Set Up Custom Reports
**File:** GA4 → Explore
- [ ] Create "Demo Conversion Funnel" report
- [ ] Create "Content Performance" report
- [ ] Create "Competitor Page Analysis" report
- [ ] Document: Reports created

---

## Phase 2: Event Tracking Implementation (Tasks 9–16)

### Task 9: Track Demo Request Button Clicks
**File:** `app/components/DemoRequest.tsx` or demo page
- [ ] Add event: `demo_button_clicked`
- [ ] Properties: `button_location` (hero/footer), `page`
- [ ] Trigger: On click
- [ ] Test: Verify event fires in GA4 DebugView
- [ ] Document: Event implemented

### Task 10: Track Form Submissions
**File:** Contact/demo forms
- [ ] Add event: `form_submitted`
- [ ] Properties: `form_type` (demo/contact), `form_location`
- [ ] Trigger: On successful submit
- [ ] Test: Verify event fires
- [ ] Document: Event implemented

### Task 11: Track CTA Clicks Across Site
**File:** All CTA buttons
- [ ] Add event: `cta_clicked`
- [ ] Properties: `button_text`, `button_location`, `page`
- [ ] Trigger: On click
- [ ] Test: Verify events fire for all CTAs
- [ ] Document: Events implemented

### Task 12: Track Feature Page Engagement
**File:** `app/features/*/page.tsx`
- [ ] Add event: `feature_page_viewed`
- [ ] Properties: `feature_name`, `scroll_depth`
- [ ] Trigger: On page view
- [ ] Test: Verify event fires
- [ ] Document: Event implemented

### Task 13: Track Competitor Page Engagement
**File:** `app/competitors/*/page.tsx`
- [ ] Add event: `competitor_page_viewed`
- [ ] Properties: `competitor_name`, `page_type` (alternative/compare)
- [ ] Trigger: On page view
- [ ] Test: Verify event fires
- [ ] Document: Event implemented

### Task 14: Track Blog Post Engagement
**File:** `app/blog/*/page.tsx`
- [ ] Add event: `blog_post_read`
- [ ] Properties: `post_title`, `post_category`, `scroll_depth`
- [ ] Trigger: At 75% scroll depth
- [ ] Test: Verify event fires
- [ ] Document: Event implemented

### Task 15: Track Pricing Page Interactions
**File:** `app/pricing/page.tsx`
- [ ] Add event: `pricing_plan_viewed`
- [ ] Properties: `plan_name` (starter/pro/enterprise)
- [ ] Trigger: On scroll to plan section
- [ ] Add event: `pricing_cta_clicked`
- [ ] Properties: `plan_name`, `cta_text`
- [ ] Document: Events implemented

### Task 16: Track Internal Link Clicks
**File:** All pages
- [ ] Add event: `internal_link_clicked`
- [ ] Properties: `link_text`, `link_url`, `source_page`
- [ ] Trigger: On click (internal links only)
- [ ] Test: Verify events fire
- [ ] Document: Event implemented

---

## Phase 3: UTM Strategy & Campaign Tracking (Tasks 17–22)

### Task 17: Create UTM Naming Conventions
**File:** Document
- [ ] Define naming conventions:
  - `utm_source`: lowercase, no spaces (google, linkedin, newsletter)
  - `utm_medium`: cpc, email, social, referral
  - `utm_campaign`: descriptive (spring_sale, product_launch)
  - `utm_content`: differentiate versions (hero_cta, sidebar_cta)
- [ ] Document: UTM conventions file

### Task 18: Set Up UTM Tracking for Email Campaigns
**File:** Email platform
- [ ] Add UTMs to all email links
- [ ] Example: `utm_source=newsletter&utm_medium=email&utm_campaign=monthly_update`
- [ ] Test: Verify UTMs appear in GA4
- [ ] Document: Email UTM strategy

### Task 19: Set Up UTM Tracking for Social Media
**File:** Social media profiles/posts
- [ ] Add UTMs to all social links
- [ ] Example: `utm_source=linkedin&utm_medium=social&utm_campaign=product_launch`
- [ ] Test: Verify UTMs appear in GA4
- [ ] Document: Social UTM strategy

### Task 20: Set Up UTM Tracking for Paid Ads
**File:** Ad platforms (Google Ads, LinkedIn Ads)
- [ ] Enable auto-tagging in Google Ads
- [ ] Add UTMs to LinkedIn Ads
- [ ] Test: Verify UTMs appear in GA4
- [ ] Document: Paid ads UTM strategy

### Task 21: Create UTM Spreadsheet
**File:** Google Sheet or Excel
- [ ] Create UTM tracking spreadsheet
- [ ] Columns: URL, utm_source, utm_medium, utm_campaign, utm_content, date
- [ ] Log all UTMs used
- [ ] Document: UTM spreadsheet link

### Task 22: Set Up Campaign Reports in GA4
**File:** GA4 → Explore
- [ ] Create "Campaign Performance" report
- [ ] Create "Source/Medium" report
- [ ] Create "UTM Campaign" report
- [ ] Document: Reports created

---

## Phase 4: Debugging & Validation (Tasks 23–27)

### Task 23: Test GA4 DebugView
**File:** GA4 → Admin → DebugView
- [ ] Enable debug mode
- [ ] Verify page views are firing
- [ ] Verify custom events are firing
- [ ] Verify event properties are correct
- [ ] Document: DebugView results

### Task 24: Test GTM Preview Mode (if using GTM)
**File:** GTM → Preview
- [ ] Enter preview mode
- [ ] Verify tags are firing
- [ ] Verify triggers are correct
- [ ] Verify variables are populating
- [ ] Document: GTM preview results

### Task 25: Validate Conversion Tracking
**File:** GA4 → Conversions
- [ ] Test demo request conversion
- [ ] Test form submission conversion
- [ ] Verify conversions are recorded correctly
- [ ] Check conversion counts match actual submissions
- [ ] Document: Conversion validation results

### Task 26: Check for Duplicate Events
**File:** GA4 → DebugView
- [ ] Monitor for duplicate page views
- [ ] Monitor for duplicate events
- [ ] Check for multiple GA containers
- [ ] Fix any duplicates found
- [ ] Document: Duplicate event issues

### Task 27: Test Mobile Tracking
**File:** Mobile device
- [ ] Test tracking on iOS Safari
- [ ] Test tracking on Android Chrome
- [ ] Verify events fire on mobile
- [ ] Check for mobile-specific issues
- [ ] Document: Mobile tracking results

---

## Phase 5: Privacy & Compliance (Tasks 28–30)

### Task 28: Implement Cookie Consent
**File:** `app/layout.tsx` or consent platform
- [ ] Check if cookie consent is required (EU/UK/CA visitors)
- [ ] Implement consent banner
- [ ] Configure GA4 to respect consent
- [ ] Test: Verify tracking waits for consent
- [ ] Document: Cookie consent implementation

### Task 29: Configure IP Anonymization
**File:** GA4 Admin or GTM
- [ ] Enable IP anonymization
- [ ] Verify no PII in event properties
- [ ] Check data retention settings
- [ ] Document: Privacy configuration

### Task 30: Create Analytics Documentation
**File:** Document
- [ ] Create tracking plan document
- [ ] Document all events and properties
- [ ] Document UTM conventions
- [ ] Document conversion events
- [ ] Share with team
- [ ] Document: Analytics documentation link

---

## Summary

| Phase | Tasks | Focus Area |
|-------|-------|------------|
| 1 | 1–8 | GA4 Setup & Configuration |
| 2 | 9–16 | Event Tracking Implementation |
| 3 | 17–22 | UTM Strategy & Campaign Tracking |
| 4 | 23–27 | Debugging & Validation |
| 5 | 28–30 | Privacy & Compliance |
| **Total** | **30** | **Full Analytics Setup** |

---

## Key Events to Track for SpaceNexus

| Event | Properties | Why Track |
|-------|------------|-----------|
| `demo_requested` | page, source | Primary conversion |
| `form_submitted` | form_type, location | Secondary conversion |
| `cta_clicked` | button_text, location, page | Measure CTA effectiveness |
| `feature_page_viewed` | feature_name | Content performance |
| `competitor_page_viewed` | competitor_name | Competitive analysis |
| `blog_post_read` | post_title, scroll_depth | Content engagement |
| `pricing_plan_viewed` | plan_name | Purchase intent |

---

## Expected Impact

- **Know what works:** See which pages drive demos
- **Optimize marketing:** Measure campaign ROI
- **Improve conversions:** Identify drop-off points
- **Data-driven decisions:** Replace guessing with data
- **A/B test foundation:** Measure test results accurately

---

## Next Steps

1. Start with Phase 1 (GA4 Setup) — foundation
2. Implement Phase 2 (Event Tracking) — core events
3. Add Phase 3 (UTM Strategy) — campaign tracking
4. Complete Phase 4 (Debugging) — validate everything
5. Ensure Phase 5 (Privacy) — compliance

**Note:** This requires access to GA4, GTM, and codebase. If you don't have GA4 set up yet, start with Task 1-4 first.
