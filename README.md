# dataviz_spr2026

Course materials for Data Management and Visualization (Instructor: Michael Hallquist; Spring 2026).

Rendered site (update after publishing):
https://ORG.github.io/dataviz_spr2026/

## Rendering

Open R and run:

```r
rmarkdown::render("index.Rmd")
```

Commit the generated HTML files (e.g., `index.html` and any lecture HTML files) so GitHub Pages can serve them.

## Structure

- `index.Rmd`: landing page
- `rmd_style.css`: shared styling
- Add lecture folders at the repo root (or in a subfolder) and link to their rendered HTML files from `index.Rmd`
