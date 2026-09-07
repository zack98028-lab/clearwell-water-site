# Clearwell Water Filtration — Website

Live site: **https://clearwellwaterfiltration.com**
Repo: https://github.com/zack98028-lab/clearwell-water-site
Owner: Sharbin Sajadpour (GitHub user `zack98028-lab`)

---

## THE ONE THING THAT IS STILL BROKEN

**Form submissions are not confirmed to be arriving.** Every form posts to
formsubmit.co, but formsubmit requires a **one-time activation** before it
delivers anything. Until someone submits the form once and clicks the link
formsubmit emails back, every lead is silently discarded — and the visitor
still sees "Request sent."

To finish it:
1. Go to https://clearwellwaterfiltration.com/book.html
2. Fill it out completely and submit
3. Check **sharbinsajadpour2007@gmail.com** (including spam) for a formsubmit
   activation email and click the link
4. Submit once more to confirm a real lead lands

Until that is done the phone is the only working way to reach the business.

---

## How to publish a change

This folder IS the live site. Edit a file here and push — it goes live.

```bash
git add -A && git commit -m "describe the change" && git push origin main
```

GitHub Pages rebuilds in about a minute. `START - Auto Publish Website.bat`
watches the folder and pushes on every save if you'd rather not type commands.

**When the user asks for a site change, make the edit and push it.** Don't ask
where the site lives or how to deploy — it's this folder and the command above.

### If the whole computer is lost

Nothing here is only on the computer. To get back to work anywhere:

```bash
git clone https://github.com/zack98028-lab/clearwell-water-site.git
```

That gives you every page, this document, and the full history. The GitHub
account is `zack98028-lab`. The domain is at Squarespace, hosting is GitHub
Pages (free), and leads go to gmail — none of it depends on that machine.

---

## The business

**Clearwell Water LLC** — residential water treatment. Michigan LLC, filed
8/12/2026, entity #900262735, renews annually (statement due Feb 15, $25).
Registered agent Sharbin Sajadpour, 17421 Parkshore Dr, Northville MI 48168.
Brand is "Clearwell Water Filtration"; the legal name is "Clearwell Water LLC" —
use the legal name on contracts and invoices.

- **Phone:** (734) 407-5571 — written as `tel:+17344075571` in markup.
  This is a Quo shared line; both Sharbin and his partner get every call and
  text, and an AI assistant (Sona) answers anything missed after 30 seconds.
- **Email:** team@clearwellwaterfiltration.com (published on the site).
  Leads currently route to sharbinsajadpour2007@gmail.com because the team@
  mailbox was not confirmed working.
- **Service area:** Plymouth, Canton, Salem Township, Northville, Superior
  Township, Ypsilanti. Livonia, Novi, South Lyon case-by-case.

### The positioning — this is the whole argument, don't break it

**Other companies send a salesman to your kitchen to "test your water." We
don't need to.**

- **City water** — the utility already tests it and publishes results by law.
  We read those for you **free, online, no visit, no appointment**. The site
  does this by address/ZIP and links to EWG's published data.
- **Private well** — no published records exist; nobody tests a well but the
  owner. **This is the one case where we come out**, and that test is free.

This was inconsistent for a while: the hero promised nobody enters your house
while four other places advertised a free on-site test. That is fixed. **Never
reintroduce "free on-site water test" as a blanket claim** — it contradicts the
entire pitch, and it also poisoned the AI phone assistant, which was reading it
off the website and repeating it to callers.

### Pricing shown on the site

| Service | Price |
|---|---|
| Water softener (most common) | $2,000–3,500 installed |
| Whole-home filtration | $1,000–4,500 |
| Under-sink RO (add-on) | $300–2,500 |
| Well water treatment | $6,500–8,000 |

Rentals from competitors run ~$25–100/month forever; the site compares against
that. Customers own the system outright — no rentals, no contracts.

---

## Files

- `index.html` — the homepage. **Self-contained**: all CSS in a `<style>` block
  and all JS in a `<script>` at the bottom. Does NOT use `assets/styles.css`.
  Contains the address/ZIP water checker, the problem-and-fix section, the
  rental-vs-own price table, and the SVG service-area map.
- `book.html` — the quote flow and main call to action. Self-contained.
  One question per screen: name → phone → city or well → (city only) ZIP water
  check → service cards → home details → address → date/time → review → sent.
  Validation blocks each step, past dates are impossible, and the questions
  after the service card **change based on what they picked**.
- `services.html`, `about.html`, `contact.html`, `quote.html` — subpages, use
  `assets/styles.css` and `assets/main.js`. `quote.html` is an older form that
  nothing links to any more.
- `CNAME` — the custom domain. Deleting it unbinds the domain.
- `.nojekyll` — stops GitHub Pages running Jekyll.
- `index-old-basic.html.bak` — the original minimal homepage.

### How leads reach you

Both a **complete** and an **abandoned** submission send an email:

- Complete → subject like `INSTALL REQUEST: Water softener — Dana Reed — Canton — Friday, Sept 11`
- Abandoned → `INCOMPLETE — Dana Reed (no service chosen) — Canton`, plus
  "Got as far as: Step 5 of 9"

The abandoned one fires via `navigator.sendBeacon` when someone closes the tab,
as long as they'd given a name and phone. The email contains everything needed
to dispatch: address, water source, service, install location, existing
equipment, main line size, drain and outlet, access route, who's home, pets,
home age, and notes.

To change where leads go, edit `LEAD_ENDPOINT` at the top of the script in
`book.html`, plus the form `action` in `contact.html` and `quote.html`.

---

## Design system

Fonts: Fraunces (headings, 500) and Inter (body), from Google Fonts.

```
--slate:#1F3B4D   --slate-deep:#152A37
--stone:#C9BBA0   --stone-light:#E4DBC8
--teal:#4A9B8E    --teal-deep:#3A7E73
--bone:#F2EEE6    --bone-white:#FBFAF7
--ink:#232323     --clay:#B0603F
```

Voice: plain, specific, non-salesy. Real numbers over adjectives. The whole
credibility argument is "we'll tell you if you don't need anything," so avoid
copy that oversells or manufactures urgency.

---

## Gotchas that have already bitten

- **Never let layout depend on an animation or transition finishing.** The
  mobile menu once used a transform transition; if it didn't advance the drawer
  stayed off-screen and the site was unnavigable on a phone. It toggles
  `display` now.
- **Define a responsive drawer at the same breakpoint that hides the nav.**
  Hiding `nav.links` at 940px while the `.open` rule only existed at 720px left
  a band of widths where the menu could not be reopened at all.
- **`assets/styles.css` has its whole ruleset duplicated.** If a rule seems not
  to apply, look for a later duplicate. Overrides appended at the end win.
- **Every page needs `<button class="burger" id="burgerBtn">`** in the markup —
  the CSS alone does nothing.
- **The in-app preview does not advance CSS animations** and will not reload a
  `file://` page on `location.reload()`. Verify motion on a real device, and
  reset wizard state by clicking Back rather than reloading.
- **Wide tables must scroll inside their own `overflow-x:auto` container**, not
  the page. The price comparison table does this.
- **The hero scroll effect must actually reach 0 blur.** It was once written as
  `9 - sharp * 5`, which bottoms out at 4px and never looks sharp.

---

## Domain and hosting

Domain registered 8/7/2026 at **Squarespace Domains II LLC**, renews 8/6/2027.
Nameservers `NSA1-4.SQUARESPACEDNS.COM` pointing at GitHub Pages
(185.199.108–111.153). HTTPS is enforced.

**In August 2026 the domain went dark for two weeks** with registry status
`clientHold` — a registrar-level suspension that removes a domain from DNS
entirely, almost certainly the ICANN email-verification deadline 15 days after
registration. Nothing in the code or GitHub can fix that; only the registrar
can lift it. If the site ever returns `DNS_PROBE_FINISHED_NXDOMAIN` again:

```bash
curl -s "https://rdap.verisign.com/com/v1/domain/CLEARWELLWATERFILTRATION.COM" | grep -o '"status":\[[^]]*\]'
```

If that shows `client hold`, call Squarespace at **+1 646-693-5324** and say the
Verisign registry shows clientHold — their own dashboard may still show
"Active," which sends people in circles. As a stopgap the site can be served
from `https://zack98028-lab.github.io/clearwell-water-site/` by parking the
`CNAME` file and clearing the custom domain in the Pages API.

---

## Phone system (Quo)

Shared line **(734) 407-5571**, $19/seat/month, two seats. Call flow:
incoming → ring both phones at once for 30s → if missed, Sona (AI) → voicemail.

**Sona's knowledge is only as good as what it's told, and it was originally
built from the website.** When the site said "free on-site test," Sona told
callers that too. If Sona ever says something wrong, check the site copy first —
that's usually the source. Its knowledge pages live under Sona → Manage →
Knowledge, and old pages must be toggled OFF, not just supplemented.

---

## Not done yet

- **Form activation** (see the top of this file) — nothing else matters until
  this is clicked.
- **Meta ads** — $180 spent, 0 leads. Check the **Results** column in Ads
  Manager: if it shows a number, leads are sitting uncollected in Leads Center;
  if it shows 0, the campaign objective is likely not set to Leads. Note the
  ServiceNest site has `landing.html` and `get-flyer.html` referenced but never
  pushed live — both 404 — so any ad pointing there wasted its spend.
- No analytics installed.
- No payment collection. Stripe Checkout is the intended route once the
  business bank account is live (Mercury). Card details must never be collected
  by a form on this site.
- Well-water process: decide whether wells get a mail-in kit or a visit.
