# Portfolio Site Redesign — Design Spec

## Overview

Full redesign of thorbjxrn.github.io from an outdated Jekyll-based CV page to a modern single-page app showcase site. Hosted on GitHub Pages as static HTML.

## Visual Design

- **Background**: Pure black (#000000)
- **Cards**: Dark gray (#1c1c1e), 16px border-radius
- **Text**: Primary #f5f5f7, secondary #86868b, tertiary #48484a
- **Fonts**: System font stack (-apple-system, SF Pro, system-ui) — no custom fonts
- **Section labels**: 12px uppercase, 1px letter-spacing, #48484a
- **Accent colors**: Each app uses its own theme accent for the App Store link text
- **Layout**: Single column, max-width ~480px, centered
- **Responsive**: Cards stack to single column on narrow screens

## Page Structure

### Header
- Name: "Thorbjørn Bonvik" — 32px, bold, #f5f5f7
- Subtitle: "iOS Developer · Musician" — 15px, #86868b

### Apps Section
- Section label: "Apps"
- 2x2 grid of app cards (stacks to 1 column on mobile)
- Each card contains:
  - App icon (64x64, 12px border-radius) — actual icons from each project
  - App name (15px, semibold)
  - Tagline (12px, secondary color)
  - "App Store ↗" link in the app's accent color

#### App Details

| App | Tagline | Accent Color | Icon Source |
|-----|---------|-------------|-------------|
| Overdubber | Layer audio. Mix. Export. | #d92e26 | `overdubber/overdubber/Assets.xcassets/AppIcon.appiconset/AppIcon.png` |
| Prāṇa | Guided breathwork. | #8ca6cc | `breathwork/breathwork/Assets.xcassets/AppIcon.appiconset/appicon.png` |
| Stronq | Hypertrophy training. | #d9c08c | `Stronq/Stronq/Assets.xcassets/AppIcon.appiconset/icon_1024.png` |
| Simple Habit Tracker | Build better habits. | #4CAF50 | `Simple-Habit-Tracker/SimpleHabitTracker/Assets.xcassets/AppIcon.appiconset/AppIcon.png` |

App Store links will point to actual App Store listings. If an app isn't live yet, omit the link.

### Music Section
- Section label: "Music"
- Single card, horizontal layout (icon + text side by side)
- Album art / project image placeholder (72x72, 12px radius)
- "Blacklight God" — 17px, semibold
- Genre/location line — 13px, secondary
- Platform links inline:
  - Spotify (#1DB954) → https://open.spotify.com/artist/0tDiZvHjg67cy7q8bnT76Y
  - Apple Music (#FC3C44) → https://music.apple.com/no/artist/blacklight-god/1473920288
  - YouTube (#FF0000) → https://www.youtube.com/channel/UCPbGLOYUI6rcG08tJ1iysKA
  - Tidal (#000000 with white text) → https://tidal.com/artist/16399600/u

### Footer
- Top: Social links row, centered, 13px, #86868b
  - Instagram → https://instagram.com/thorbjxrn
  - TikTok → https://www.tiktok.com/@thorbjxrn
- Bottom: Privacy · Contact links, 12px, #48484a
  - Privacy links to existing privacy policy (or anchor section)
  - Contact links to email (app.chair433@passfwd.com)

## Technical Details

### File Structure
```
thorbjxrn.github.io/
  index.html          — single-page site (replaces README-based Jekyll site)
  app-ads.txt         — AdMob verification (already in place)
  icons/
    overdubber.png    — 256x256 resized app icon
    prana.png
    stronq.png
    habits.png
  sync-icons.sh       — script to copy & resize icons from local project repos
```

### Implementation Notes
- Pure static HTML + inline CSS. No build tools, no JavaScript frameworks, no Jekyll.
- Remove `_config.yml` — no longer using Jekyll themes.
- Keep `README.md` minimal or remove it (index.html is the site now).
- Icons resized to 256x256 for web (from 1024x1024 source). Using `sips` (macOS built-in) for resizing.
- All links open in new tabs (`target="_blank" rel="noopener"`).
- Privacy policy content from the existing Overdubber support page can be linked or inlined as a section. For now, link to the Overdubber repo's GitHub Pages URL for privacy.

### Icon Sync Script (`sync-icons.sh`)
Copies the latest app icons from each project's asset catalog into `icons/`, resizes to 256x256. Run manually when icons change.

Source paths (relative to `~/Code`):
- `overdubber/overdubber/Assets.xcassets/AppIcon.appiconset/AppIcon.png` → `icons/overdubber.png`
- `breathwork/breathwork/Assets.xcassets/AppIcon.appiconset/appicon.png` → `icons/prana.png`
- `Stronq/Stronq/Assets.xcassets/AppIcon.appiconset/icon_1024.png` → `icons/stronq.png`
- `Simple-Habit-Tracker/SimpleHabitTracker/Assets.xcassets/AppIcon.appiconset/AppIcon.png` → `icons/habits.png`

### What Gets Removed
- `_config.yml` (Jekyll theme config)
- `pdf/` directory (old CV and portfolio PDFs)
- Current `README.md` content (replaced with minimal readme or removed)

### What Stays
- `app-ads.txt` — must remain at root for AdMob
