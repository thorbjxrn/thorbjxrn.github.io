# Portfolio Site Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the outdated Jekyll CV site at thorbjxrn.github.io with a modern single-page app showcase featuring iOS apps, music project, and social links.

**Architecture:** Static single-page HTML site with inline CSS. No build tools, no JavaScript frameworks. App icons copied from local project repos and resized for web. Hosted on GitHub Pages from the `master` branch.

**Tech Stack:** HTML, CSS, `sips` (macOS built-in image tool), bash

**Spec:** `docs/superpowers/specs/2026-04-25-portfolio-redesign-design.md`

---

### Task 1: Icon Sync Script

**Files:**
- Create: `sync-icons.sh`
- Create: `icons/` directory (populated by script)

- [ ] **Step 1: Create the sync script**

```bash
#!/bin/bash
# Copies app icons from local project repos and resizes to 256x256 for web

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$HOME/Code"
ICONS_DIR="$SCRIPT_DIR/icons"

mkdir -p "$ICONS_DIR"

declare -A ICONS=(
    ["overdubber"]="overdubber/overdubber/Assets.xcassets/AppIcon.appiconset/AppIcon.png"
    ["prana"]="breathwork/breathwork/Assets.xcassets/AppIcon.appiconset/appicon.png"
    ["stronq"]="Stronq/Stronq/Assets.xcassets/AppIcon.appiconset/icon_1024.png"
    ["habits"]="Simple-Habit-Tracker/SimpleHabitTracker/Assets.xcassets/AppIcon.appiconset/AppIcon.png"
)

for name in "${!ICONS[@]}"; do
    src="$CODE_DIR/${ICONS[$name]}"
    dest="$ICONS_DIR/$name.png"

    if [ ! -f "$src" ]; then
        echo "WARNING: $src not found, skipping $name"
        continue
    fi

    cp "$src" "$dest"
    sips -z 256 256 "$dest" --out "$dest" >/dev/null 2>&1
    echo "Synced $name (256x256)"
done

echo "Done. Icons in $ICONS_DIR/"
```

- [ ] **Step 2: Make script executable and run it**

Run: `chmod +x sync-icons.sh && ./sync-icons.sh`

Expected output:
```
Synced habits (256x256)
Synced overdubber (256x256)
Synced prana (256x256)
Synced stronq (256x256)
Done. Icons in /Users/developer3/Code/thorbjxrn.github.io/icons/
```

- [ ] **Step 3: Verify icons exist and are 256x256**

Run: `ls -la icons/ && sips -g pixelWidth -g pixelHeight icons/overdubber.png`

Expected: 4 PNG files, pixelWidth: 256, pixelHeight: 256

- [ ] **Step 4: Commit**

```bash
git add sync-icons.sh icons/
git commit -m "Add icon sync script and app icons"
```

---

### Task 2: Build the HTML Page

**Files:**
- Create: `index.html` (replaces the Jekyll README-based site)

- [ ] **Step 1: Write index.html**

Write the full single-page site to `index.html`. The page has four sections: header, apps grid, music card, and footer with socials.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thorbjørn Bonvik — iOS Developer</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text', system-ui, sans-serif;
            background: #000;
            color: #f5f5f7;
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
        }
        .container {
            max-width: 480px;
            margin: 0 auto;
            padding: 64px 24px 48px;
        }

        /* Header */
        .header {
            text-align: center;
            margin-bottom: 48px;
        }
        .header h1 {
            font-size: 32px;
            font-weight: 700;
            letter-spacing: -0.5px;
            margin-bottom: 6px;
        }
        .header p {
            font-size: 15px;
            color: #86868b;
        }

        /* Section labels */
        .section-label {
            font-size: 12px;
            font-weight: 600;
            color: #48484a;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 16px;
        }

        /* App grid */
        .app-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 48px;
        }
        .app-card {
            background: #1c1c1e;
            border-radius: 16px;
            padding: 20px;
            text-decoration: none;
            display: block;
            transition: background 0.2s;
        }
        .app-card:hover { background: #2c2c2e; }
        .app-card img {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            margin-bottom: 12px;
        }
        .app-card .app-name {
            font-size: 15px;
            font-weight: 600;
            color: #f5f5f7;
            margin-bottom: 2px;
        }
        .app-card .app-tagline {
            font-size: 12px;
            color: #86868b;
            margin-bottom: 12px;
        }
        .app-card .app-link {
            font-size: 11px;
            font-weight: 500;
        }

        /* Music section */
        .music-section { margin-bottom: 48px; }
        .music-card {
            background: #1c1c1e;
            border-radius: 16px;
            padding: 24px;
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .music-art {
            width: 72px;
            height: 72px;
            background: linear-gradient(135deg, #1a1a2e, #4a1942, #1a1a2e);
            border-radius: 12px;
            flex-shrink: 0;
        }
        .music-info { flex: 1; }
        .music-info h3 {
            font-size: 17px;
            font-weight: 600;
            margin-bottom: 4px;
        }
        .music-info .music-genre {
            font-size: 13px;
            color: #86868b;
            margin-bottom: 12px;
        }
        .music-links {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
        }
        .music-links a {
            font-size: 12px;
            font-weight: 500;
            text-decoration: none;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding-top: 24px;
            border-top: 1px solid #1c1c1e;
        }
        .socials {
            display: flex;
            justify-content: center;
            gap: 24px;
            margin-bottom: 16px;
        }
        .socials a {
            font-size: 13px;
            color: #86868b;
            text-decoration: none;
        }
        .socials a:hover { color: #f5f5f7; }
        .footer-links {
            font-size: 12px;
            color: #48484a;
        }
        .footer-links a {
            color: #48484a;
            text-decoration: none;
            margin: 0 8px;
        }
        .footer-links a:hover { color: #86868b; }

        /* Responsive */
        @media (max-width: 480px) {
            .app-grid { grid-template-columns: 1fr; }
            .container { padding: 48px 20px 40px; }
        }
    </style>
</head>
<body>
    <div class="container">

        <div class="header">
            <h1>Thorbjørn Bonvik</h1>
            <p>iOS Developer · Musician</p>
        </div>

        <div class="section-label">Apps</div>
        <div class="app-grid">

            <a class="app-card" href="https://apps.apple.com/no/app/overdubber/id6762368689" target="_blank" rel="noopener">
                <img src="icons/overdubber.png" alt="Overdubber icon">
                <div class="app-name">Overdubber</div>
                <div class="app-tagline">Layer audio. Mix. Export.</div>
                <div class="app-link" style="color: #d92e26;">App Store ↗</div>
            </a>

            <div class="app-card">
                <img src="icons/prana.png" alt="Prāṇa icon">
                <div class="app-name">Prāṇa</div>
                <div class="app-tagline">Guided breathwork.</div>
                <div class="app-link" style="color: #8ca6cc;">Coming Soon</div>
            </div>

            <div class="app-card">
                <img src="icons/stronq.png" alt="Stronq icon">
                <div class="app-name">Stronq</div>
                <div class="app-tagline">Hypertrophy training.</div>
                <div class="app-link" style="color: #d9c08c;">Coming Soon</div>
            </div>

            <a class="app-card" href="https://apps.apple.com/us/app/simple-habits-weekly-tracker/id6762311878" target="_blank" rel="noopener">
                <img src="icons/habits.png" alt="Simple Habit Tracker icon">
                <div class="app-name">Simple Habit Tracker</div>
                <div class="app-tagline">Build better habits.</div>
                <div class="app-link" style="color: #4CAF50;">App Store ↗</div>
            </a>

        </div>

        <div class="music-section">
            <div class="section-label">Music</div>
            <div class="music-card">
                <div class="music-art"></div>
                <div class="music-info">
                    <h3>Blacklight God</h3>
                    <div class="music-genre">Electronic · Oslo</div>
                    <div class="music-links">
                        <a href="https://open.spotify.com/artist/0tDiZvHjg67cy7q8bnT76Y" target="_blank" rel="noopener" style="color: #1DB954;">Spotify ↗</a>
                        <a href="https://music.apple.com/no/artist/blacklight-god/1473920288" target="_blank" rel="noopener" style="color: #FC3C44;">Apple Music ↗</a>
                        <a href="https://tidal.com/artist/16399600/u" target="_blank" rel="noopener" style="color: #86868b;">Tidal ↗</a>
                        <a href="https://www.youtube.com/channel/UCPbGLOYUI6rcG08tJ1iysKA" target="_blank" rel="noopener" style="color: #FF0000;">YouTube ↗</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="socials">
                <a href="https://instagram.com/thorbjxrn" target="_blank" rel="noopener">Instagram</a>
                <a href="https://www.tiktok.com/@thorbjxrn" target="_blank" rel="noopener">TikTok</a>
            </div>
            <div class="footer-links">
                <a href="mailto:app.chair433@passfwd.com">Contact</a>
                ·
                <a href="https://thorbjxrn.github.io/overdubber/" target="_blank" rel="noopener">Privacy</a>
            </div>
        </div>

    </div>
</body>
</html>
```

**Notes on App Store URLs:** Overdubber and Simple Habit Tracker have live App Store links. Prāṇa and Stronq are not yet published — they use `<div>` instead of `<a>` and show "Coming Soon" instead of "App Store ↗". When they go live, swap the `<div class="app-card">` to `<a class="app-card" href="...">` and update the link text.

- [ ] **Step 2: Preview locally**

Run: `open index.html`

Verify in browser:
- Black background, centered layout
- 4 app cards in 2x2 grid with icons visible
- Music card with Blacklight God info and 4 platform links
- Footer with Instagram, TikTok, Contact, Privacy
- Resize browser narrow to verify cards stack to single column

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "Add single-page portfolio site"
```

---

### Task 3: Clean Up Old Files

**Files:**
- Remove: `_config.yml`
- Remove: `pdf/CV_Bonvik.pdf`
- Remove: `pdf/portfolio_bonvik.pdf`
- Modify: `README.md`

- [ ] **Step 1: Remove Jekyll config and old PDFs**

```bash
git rm _config.yml
git rm -r pdf/
```

- [ ] **Step 2: Replace README with minimal content**

Write `README.md`:

```markdown
# thorbjxrn.github.io

Personal site — app showcase, music, and links.
```

- [ ] **Step 3: Add .gitignore for superpowers directory**

Write `.gitignore`:

```
.superpowers/
```

- [ ] **Step 4: Commit**

```bash
git add README.md .gitignore
git commit -m "Remove old Jekyll config, PDFs, and clean up README"
```

---

### Task 4: Push and Verify

- [ ] **Step 1: Push to remote**

```bash
git push origin master
```

- [ ] **Step 2: Wait for GitHub Pages deploy and verify**

Run: `sleep 30 && curl -s -o /dev/null -w "%{http_code}" https://thorbjxrn.github.io/`

Expected: `200`

- [ ] **Step 3: Verify in browser**

Open: `https://thorbjxrn.github.io/`

Check:
- Page loads with black background
- App icons render correctly
- All links work (App Store, music platforms, socials)
- `https://thorbjxrn.github.io/app-ads.txt` still accessible
- Mobile responsive (resize browser or use dev tools)

- [ ] **Step 4: Verify app-ads.txt still works**

Run: `curl -s https://thorbjxrn.github.io/app-ads.txt`

Expected: `google.com, pub-3919813110479769, DIRECT, f08c47fec0942fa0`
