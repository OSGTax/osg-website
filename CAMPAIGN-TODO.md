# Campaign Launch — Manual Follow-ups

Before running Google Ads / local-search traffic, complete these off-repo steps.
Each item links to the in-code placeholder or file that depends on it.

## 1. Swap the GA4 + Google Ads tag IDs

Replace **both** placeholders in **both** files.

- `index.html` — head, in the `gtag.js` block
- `contractors.html` — head, in the `gtag.js` block

Find:
```
G-XXXXXXXXXX   → your GA4 Measurement ID (e.g. G-ABC123XYZ4)
AW-XXXXXXXXX   → your Google Ads account ID (e.g. AW-1234567890)
```

Three `gtag('config', ...)` calls exist per page — update every occurrence.

## 2. Define the Sign-Up conversion in Google Ads

- Tools → Goals → Conversions → New conversion action → Website
- Category: **Submit lead form** (or Sign-up)
- Value: whatever a new-client signup is worth to you
- Conversion name: **sign_up_click** (must match the `data-event` value fired by the site)
- Count: **One** (avoid double-counting accidental re-clicks)
- Attribution: Data-driven (if available) or Last click
- Get the conversion label and confirm it fires with Google Tag Assistant

Optional secondary conversions (lower value, same process):
- `phone_click` — call intent
- `contact_form_submit` — inquiry form
- `cta_payroll_calc`, `cta_se_calc`, `cta_cfo` — calculator / CFO interest

## 3. Add the social-share image

- Create a 1200×630 PNG: OSG logo centered on the cream (#faf8f4) background, with the tagline "Tax, Bookkeeping & Payroll — Ogdensburg, NY"
- Save as **`og-image.png`** at the repo root (`/home/user/osg-website/og-image.png`)
- Referenced by `og:image` and `twitter:image` meta tags in `index.html` and `contractors.html`
- Verify at https://www.opengraph.xyz/ after deploy

## 4. Claim the Google Business Profile

- Go to https://business.google.com
- Business name: **Oswegatchie Shoreline Group LLC** (exact match to site)
- Phone: **315-323-9612**
- Categories: Tax Preparation Service (primary), Accountant, Bookkeeping Service, Payroll Service
- Service-area business: hide address, set service area to St. Lawrence County + surrounding North Country counties
- Hours: Open 24/7 (matches the schema) or list whatever you want displayed publicly
- Verify via postcard or phone
- Once verified, link to Google Ads so Location Extensions pull from it

## 5. Post-deploy verification checklist

After the next deploy, run through this once:

- [ ] Open the site in an incognito window with GA4 DebugView open — confirm `page_view` fires on each page
- [ ] Click Sign Up (nav, hero, How-It-Works CTA) — confirm `sign_up_click` fires and the Google Ads conversion tag reports a conversion
- [ ] Click the phone number on mobile — confirm `phone_click` fires
- [ ] Submit the contact form — confirm `contact_form_submit` fires
- [ ] Paste the homepage URL into https://search.google.com/test/rich-results — confirm AccountingService + FAQPage parse without errors
- [ ] Paste the homepage URL into https://www.opengraph.xyz/ — confirm image + title + description render
- [ ] `curl -I https://oshorelinegroup.com/robots.txt` and `.../sitemap.xml` return 200
- [ ] Run Lighthouse on both index.html and contractors.html — target ≥90 on Performance / SEO / Accessibility

## 6. Submit to Search Console

- Add the property `https://oshorelinegroup.com/` to Google Search Console
- Submit `https://oshorelinegroup.com/sitemap.xml`
- Request indexing for `/` and `/contractors.html`
