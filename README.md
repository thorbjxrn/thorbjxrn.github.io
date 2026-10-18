# thorbjxrn.github.io

Personal site — app showcase, music, links, and a blog.

Static HTML hosted on GitHub Pages from the root of `master`. No build step or JavaScript is required. Blog posts live at `blog/<slug>/index.html`; shared blog styles are in `blog/blog.css`.

To preview locally, run `python3 -m http.server 8000 --bind 127.0.0.1` from the repository root and open `http://127.0.0.1:8000/blog/overdubber/`.

When adding a post, update `blog/index.html` and `sitemap.xml`, and give the post an absolute canonical URL, a description, and social sharing metadata. `robots.txt` allows crawling and links to the sitemap; this makes the pages accessible to search crawlers but does not guarantee indexing or recommendations.

The Overdubber article includes a web copy of the existing App Store Session preview, with the original AAC audio preserved. The MP4 uses H.264 and fast-start metadata; the native player loads it on demand and does not autoplay. Its poster is a frame from the same video. Future article additions are tracked in [BACKLOG.md](BACKLOG.md).
