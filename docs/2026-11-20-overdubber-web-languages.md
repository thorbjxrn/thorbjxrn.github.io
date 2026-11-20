# Overdubber website languages — 20 November 2026

Owner-approved scope: state supported app languages in the product and origin-story FAQs, then begin with translated product pages and FAQs. Broader blog translation is deferred. This change does not publish unreleased 2.8 features or alter the eight-layer free allowance, purchase model or price.

## Language facts

The [live App Store listing](https://apps.apple.com/us/app/overdubber/id6762368689), checked on 20 November 2026, lists version 2.7.2 and 23 interface languages: English, Arabic, Danish, French, German, Hebrew, Hindi, Indonesian, Italian, Japanese, Korean, Norwegian Bokmål, Polish, Portuguese, Simplified Chinese, Spanish, Swedish, Thai, Traditional Chinese, Turkish, Ukrainian, Urdu and Vietnamese.

The website follows that public list, rather than counting internal localization variants. `SoftwareApplication.inLanguage` describes the app's languages; each document's `html lang` and `FAQPage.inLanguage` describe that page's language. App language availability is distinct from website translation coverage.

## First translated pages

German and Japanese were selected using the retained App Store acquisition report at `~/Code/evidence/overdubber/release-readiness-2026-11-07/acquisition/sales-by-country.csv`. Summing its `1F` units over 30 September–6 November 2026 gives Japan 22 and Germany 14, ahead of France 8 and Brazil 6. US 30 and GB 13 are excluded from this non-English pilot selection.

This is a small historical sample of downloads by territory, not measured browser language, website traffic or translation uplift. Search Console discovery through the connected Ad Superpowers tool was unavailable because the workspace trial had ended; no fresh query data was obtained and no account changes were made. Revisit language priority using newer acquisition and search data before expanding.

## Implementation and maintenance

- Static German and Japanese equivalents of the product page, including all eight FAQ entries, free/paid boundaries, requirements, accessibility, privacy, image descriptions and metadata.
- The origin-story blog stays in English and gains the app-language FAQ.
- Explicit language links; self-canonical pages; reciprocal `en`, `de`, `ja` and English `x-default` alternates; sitemap entries for both new pages.
- Existing App Store campaign parameters are preserved. App identity URLs remain untagged. `llms.txt` stays aligned with visible content, without claiming special ranking benefits.
- English destinations for the blog, support and privacy remain labelled as such in the translated pages.
- Maintain these static HTML files directly. No generator or runtime dependency is required to deploy the site.

Google recommends [separate language URLs and explicit language alternatives](https://developers.google.com/search/docs/specialty/international/managing-multi-regional-sites). Translation may improve relevance and usability for those audiences; it does not guarantee indexing, rankings, AI citations or additional sales. FAQ structured data is retained for consistency, not a promise of rich results.

## Review and verification

Independent agent review found no blockers in German/Japanese fidelity, feature/purchase scope, canonical/alternate links or accessible language navigation. Three minor wording fixes were applied: optional tape warmth in Japanese, explicit sending of anonymous events in German, and Japanese punctuation. This is not native-human translation sign-off.

Structural validation checks HTML nesting, unique IDs, local assets and anchors, campaign URLs, reciprocal alternates, self-canonicals, sitemap membership and equality of visible and structured FAQ answers. Browser checks cover phone and desktop widths, image loading, horizontal overflow and language switching.

Working evidence and check scripts are retained at `~/Code/evidence/thorbjxrn.github.io/overdubber-languages-2026-11-20/`. Review that evidence after PR resolution and before expanding to further languages. No merge or deployment is included in this task.
