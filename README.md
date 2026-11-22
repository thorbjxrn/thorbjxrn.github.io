# thorbjxrn.github.io

Personal site — app showcase, music, links, and a blog.

Static HTML hosted on GitHub Pages from the root of `master`. No build step or JavaScript is required. Blog posts live at `blog/<slug>/index.html`; shared blog styles are in `blog/blog.css`.

To preview locally, run `python3 -m http.server 8000 --bind 127.0.0.1` from the repository root and open `http://127.0.0.1:8000/blog/overdubber/`.

`overdubber/index.html` is the product page for Overdubber: plain statements of what the app does, what is free and paid, requirements, and a visible FAQ mirrored in its structured data. `llms.txt` summarises the site for AI assistants. When the app's features, limits or requirements change, update the page, its structured data and `llms.txt` together, checking them against the live App Store listing. The feature descriptions cover iPhone, iPad and Mac. The Google Play link is labeled as an open beta.

The product page and FAQ are available in English, German, Japanese, French, Spanish, Korean, Simplified Chinese and Traditional Chinese. When product facts change, update every translation and keep its visible FAQ and JSON-LD in sync. Give each page a self-canonical URL, reciprocal alternates for every language and an English `x-default`. Keep the language switcher and sitemap in sync when adding languages. Blog articles, support and privacy pages remain in English; translated product pages label those destinations accordingly. No language redirects or client-side translation are used. Selection evidence and maintenance guidance are in [the localization note](docs/2026-11-20-overdubber-web-languages.md).

When adding a post, update `blog/index.html` and `sitemap.xml`, and give the post an absolute canonical URL, a description, and social sharing metadata. `robots.txt` allows crawling and links to the sitemap; this makes the pages accessible to search crawlers but does not guarantee indexing or recommendations.

The Overdubber article includes a web copy of the existing App Store Session preview, with the original AAC audio preserved. The MP4 uses H.264 and fast-start metadata; the native player loads it on demand and does not autoplay. Its poster is a frame from the same video. Future article additions are tracked in [BACKLOG.md](BACKLOG.md).

Overdubber download links share one App Store campaign (`pt=128788989`, `ct=thorbjxrn.github.io`, `mt=8`) so low-volume website traffic is reported together. Use the same campaign on new articles; retain `platform=mac` for Mac-specific calls to action. Keep structured-data identity URLs (`@id`, `url`, `sameAs`) stable and untagged; the `downloadUrl` uses the campaign. Campaign link supplied by the owner on 2026-11-14.

The Gorilla Habits article uses the owner-supplied campaign URL for app 6762311878, with the same site campaign parameters. Its six JPEG concept images are web copies of the original Meta creative exports retained in the Simple Habit Tracker brand-research evidence. The gallery depicts concepts, not released app screenshots.
