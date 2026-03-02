# Quarto Presentation Project


This repository contains a standard RPACT Quarto project used to build training 
websites and slide decks (Reveal.js) in a consistent and reproducible way.

The goal of this README is to provide a quick orientation after a longer break 
and to document **where to change what**.

Note that all to do items are also marked in the template with `TODO`, therefore you can search for this string to find them. Please remove the `TODO` comments after completing the tasks. 

Here we provide an overview of the required steps to create a new presentation based on this template.

## Short check list of required steps

- [ ] Install Font Awesome Extension for Quarto as described here (only once per machine): 
   [github.com/quarto-ext/fontawesome](https://github.com/quarto-ext/fontawesome)
- [ ] Add any additional required R packages to install in `.github/workflows/quarto.yml` (otherwise the rendering of the slides on GitHub Actions will fail).
- [ ] Enter date and title in `parts/_metadata.yml`.
- [ ] Copy and edit part files `parts/*.qmd` as needed:
  - [ ] Update part titles, authors, descriptions, and images.
  - [ ] Add slide contents.
- [ ] Update the website settings in `_quarto.yml`: website title, website URL, and copyright year.
- [ ] Enter the website URL in the `CNAME` file.
- [ ] Update the presentation title in `listing.qmd`.
- [ ] Update the landing page `index.qmd`:
  - [ ] Update website title, description, and date.
  - [ ] Update welcome message and URL.
  - [ ] Update date, presenter, time, location, and agenda.

---

## High-level overview

- **Authoring format:** Quarto (`.qmd`)
- **Slide engine:** Reveal.js
- **Output type:** Website
- **Output directory:** `www/`
- **IDE:** RStudio (via `project.Rproj`)

The project is structured so that:
- global website settings live in `_quarto.yml`
- visual styling is controlled centrally via `custom.scss`
- all slide decks are located in `parts/`
- shared slide metadata is defined once in `parts/_metadata.yml`

---

## Directory structure

```
.
├── _extensions/
│   └── quarto-ext/
│       └── fontawesome/   # See https://github.com/quarto-ext/fontawesome
│
├── _quarto.yml            # Global website configuration (must-edit)
├── custom.scss            # Global styling and layout rules
├── favicon.ico
│
├── figures/               # Any graphics files used
│   ├── illustrations/     # Illustrating graphics and photos
│   ├── logos/             # Company and brand logos
│   └── photos/            # Photos of speakers
│
├── index.qmd              # Website landing page (must-edit)
├── listing.qmd            # Overview page linking to all slide decks
│
├── parts/                 # Individual slide decks
│   ├── _metadata.yml      # Shared slide metadata (must-edit)
│   ├── 01_title1.qmd.     # First slide deck
│   ├── 02_title2.qmd.     # Second slide deck
│   └── ...                # Additional slide decks
│
├── references.bib         # Shared bibliography
├── project.Rproj          # RStudio project file
├── README.md              # This file
│
└── www/                   # Rendered output (do not edit manually)
```

---

## Key configuration files

### 1. `_quarto.yml` (global website configuration)

This is the **central configuration file** for the entire project.

Typical changes per project:
- `website.title`
- `website.site-url`
- footer text and links
- navbar entries

```yaml
project:
  type: website
  output-dir: www
```

Important notes:
- The `www/` folder is the **rendered output** and should not be edited manually.
- Icons in the navbar rely on the FontAwesome extension in `_extensions/`.

---

### 2. `custom.scss` (styling and layout)

This file controls **all visual aspects**:
- colors
- font sizes
- code block appearance
- callouts
- alignment helpers

What to change here:
- corporate colors
- slide font sizes
- code and output scaling
- custom utility classes (e.g. `.red`, `.small`, `.info-block`)

This file is used:
- by the website (`_quarto.yml`)
- by Reveal.js slides (via `parts/_metadata.yml`)

---

### 3. `parts/_metadata.yml` (shared slide defaults)

This file defines **default YAML settings for all slide decks** in `parts/`.

Must-update fields:
- `date`

Common settings included:
- Reveal.js theme and transition
- logo and favicon
- footer navigation
- bibliography
- knitr defaults

Because this file is shared, individual slide decks usually have 
**very short YAML headers**.

---

## Slide decks (`parts/*.qmd`)

Each file in `parts/` represents **one Reveal.js slide deck**.

Naming convention:
- numeric prefix to enforce ordering
- descriptive name for content

Example:
```
01_rpact-intro.qmd
02_design_specification.qmd
```

Each deck automatically inherits:
- styling from `custom.scss`
- Reveal.js settings from `_metadata.yml`

---

## Website pages

### `index.qmd` (landing page)

This file defines the **start page of the website**.

Must-update elements:
- YAML: `title`, `description`, `date`
- agenda / course outline
- links to slide decks

This is typically the first page users see.

---

### `listing.qmd` (slides overview)

This page provides:
- an overview of all slide decks
- thumbnails and descriptions
- navigation into individual presentations

Usually updated when:
- new slide decks are added
- ordering or grouping changes

---

## Figures, thumbnails, references

- `figures/`: logos and images used directly in slides
- `thumbnails/`: preview images for listings and navigation
- `references.bib`: shared bibliography for citations across all slides

Paths in slide decks are typically **relative to the project root**.

---

## Rendering the project

From the project root:

```bash
quarto render
```

Or render individual files from RStudio using the **Render** button.

Output will always be written to:

```
www/
```

---

## Common pitfalls

- Editing files inside `www/` (changes will be overwritten)
- Forgetting to update the date in `_metadata.yml`
- Hardcoding styling instead of using `custom.scss`
- Absolute paths instead of project-relative paths

---

## Intended usage

This structure is optimized for:
- trainings
- workshops
- internal and external presentations
- consistent branding across RPACT material

It is intentionally opinionated and should be reused as-is unless there is a 
strong reason to diverge.

