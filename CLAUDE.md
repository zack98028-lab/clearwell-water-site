# Clearwell Water Filtration — Website

Live site: **https://clearwellwaterfiltration.com**
Repo: https://github.com/zack98028-lab/clearwell-water-site
Owner: Sharbin (GitHub user `zack98028-lab`)

## How to publish a change

This folder IS the live site. Edit a file here and push — it goes live.

```bash
git add -A && git commit -m "describe the change" && git push origin main
```

GitHub Pages rebuilds in ~1 minute. There is also `START - Auto Publish Website.bat` —
double-click it once and every file save auto-commits and pushes, hands-free.

**When the user asks for a site change, just make the edit and push it.** Don't ask
where the site lives or how to deploy — it's this folder, and the command is above.

## Open item that needs the user (important)

**The forms don't work yet.** `contact.html` and `quote.html` post to Web3Forms, but
the access key is still the placeholder `YOUR_ACCESS_KEY_HERE`. Submissions fail, so
every lead is lost. To fix: get a free key at https://web3forms.com (it's emailed to
you — no account needed), then replace the placeholder in both files:

```bash
sed -i 's/YOUR_ACCESS_KEY_HERE/<the-real-key>/g' contact.html quote.html
```

Until that's done, the phone number is the only working way to reach the business.

## The business

Clearwell Water Filtration — residential water treatment.

- **Service area:** Plymouth, Canton, Salem Township, and Northville, MI.
  Livonia, Novi, and South Lyon case-by-case. Well inquiries west of Napier Rd get priority.
- **Phone:** (734) 306-5475 — written as `tel:+17343065475` in markup
- **Positioning:** test first, flat published pricing, customer owns the equipment
  outright. No rental contracts. Explicitly anti-"vague phone quote."

### Two customer types, different pitch

- **Plymouth & Canton** — municipal GLWA water. Safe to drink; the problem is
  hardness (7–13 grains per gallon) and chlorine taste. Comfort/appliance-life fix.
- **Salem Township & well homes** — private wells, unregulated and untested by
  default. Iron, sulfur, coliform, nitrates, arsenic. Test before recommending.

### Pricing shown on the site

| Service | Price shown |
|---|---|
| Water softener (most common) | $2,000–3,500 installed |
| Whole-home filtration | $1,000–4,500 |
| Under-sink RO (add-on) | $300–2,500 |
| Well water treatment | $3,000–8,000+ bundled |

## Files

- `index.html` — the homepage. **Self-contained**: all CSS lives in a `<style>` block
  in its head, and it does NOT use `assets/styles.css`. Edit this file alone for
  homepage changes.
- `services.html`, `about.html`, `quote.html`, `contact.html` — subpages. These DO
  use `assets/styles.css` and `assets/main.js`.
- `quote.html` is the "Free Water Test" page. There is no `water-test.html` — links
  must point at `quote.html`.
- `services.html` has anchor ids `#softener`, `#filtration`, `#ro`, `#well`, which the
  homepage footer links to. Keep them if you restructure that page.
- `CNAME` — holds the custom domain. Do not delete; removing it unbinds the domain.
- `.nojekyll` — stops GitHub Pages running Jekyll over the files.
- `index-old-basic.html.bak` — the previous minimal homepage, kept as a fallback.

**Known inconsistency:** `index.html` is a newer, much more developed design than the
four subpages. They share the same color tokens so nothing looks broken, but the
subpages are plainer and are due for a refresh to match. Worth raising if the user
asks about polish.

## Design system

Fonts: Fraunces (headings, weight 500) and Inter (body), from Google Fonts.

```
--slate:#1F3B4D   --slate-deep:#152A37
--stone:#C9BBA0   --stone-light:#E4DBC8
--teal:#4A9B8E    --teal-deep:#3A7E73
--bone:#F2EEE6    --bone-white:#FBFAF7
--ink:#232323     --clay:#B0603F
```

Voice: plain, specific, non-salesy. Real numbers over adjectives. The site's whole
credibility argument is "we'll tell you if you don't need anything," so avoid copy
that oversells or manufactures urgency.

## Also not done

- No analytics installed.
- No email address is published on the site (phone only) — intentional for now, since
  no mailbox exists at the domain yet.
