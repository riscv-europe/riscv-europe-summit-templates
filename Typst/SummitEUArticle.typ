// RISC-V Summit Europe 2026 — Extended Abstract Template
// Formatting per submission guidelines
//
// Usage:
//   #import "SummitEUArticle.typ": conf
//   #show: conf.with(
//     title: [Your Title Here],
//     // running-head: [Short Title],  // No header per formatting rules
//     authors: (
//       (name: "First Author", affiliation: (1,), corresponding: true, email: "first@example.com"),
//       (name: "Second Author", affiliation: (2,)),
//     ),
//     affiliations: (
//       (id: 1, name: [Department, University]),
//       (id: 2, name: [Department, Other University]),
//     ),
//     abstract: [Your abstract text here.],
//     appendix: [Optional appendix content for reviewers only.],
//   )

#let conf(
  title: none,
  authors: (),
  affiliations: (),
  abstract: [],
  appendix: none,
  doc,
) = {
  // Blind submission mode: invoke with `typst compile --input blind=true`
  // Replaces author names with "Author 1", etc. and affiliations with
  // "Affiliation 1", etc.  Hides corresponding-author email.
  let blind = "blind" in sys.inputs and sys.inputs.blind == "true"
  if blind {
    authors = authors.enumerate().map(((i, a)) => {
      let blinded = (name: "Author " + str(i + 1), affiliation: a.affiliation)
      if "corresponding" in a and a.corresponding {
        blinded.insert("corresponding", true)
        blinded.insert("email", "author" + str(i + 1) + "@example.com")
      }
      blinded
    })
    affiliations = affiliations.enumerate().map(((i, a)) => {
      (id: a.id, name: [Affiliation #(i + 1)])
    })
  }
  // Page setup: A4, custom header and footer
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
    header: none,
    footer: context {
      let pg = counter(page).get().first()
      let left-content = text(9pt, style: "italic")[RISC-V Summit Europe, Bologna, 8-12th June 2026]
      let right-content = text(9pt, weight: "bold")[#pg]
      if calc.odd(pg) {
        grid(columns: (1fr, 1fr), left-content, align(right, right-content))
      } else {
        grid(columns: (1fr, 1fr), right-content, align(right, left-content))
      }
    },
  )

  // Times New Roman throughout, with 1.05 line spread
  set text(font: "Times New Roman", size: 10pt, lang: "en")
  set par(justify: true, leading: 0.65em * 1.05)

  // Column width (used for footnote separator and other calculations)
  let col-width = (21cm - 2cm - 2cm - 20pt) / 2

  // Footnote styling for regular footnotes (e.g. in-text footnotes)
  set footnote.entry(separator: line(length: col-width / 2, stroke: 0.5pt), indent: 6pt)
  show footnote.entry: set text(9pt)

  // Links: all black (matching LaTeX hypersetup)
  show link: set text(fill: black)
  show ref: set text(fill: black)

  // Lists: tight (no extra item spacing, matching LaTeX noitemsep)
  set list(spacing: auto)
  set enum(spacing: auto)

  // --- Single-column header block ---

  // Title: 24pt bold, centered
  align(center, text(24pt, weight: "bold", title))
  v(0.2em)

  // Authors line: "John Smith^{1,2}, Robert Smith^{3} and Jane Smith^{1}*"
  {
    let author-parts = authors.enumerate().map(((i, a)) => {
      let sup-nums = a.affiliation.map(n => str(n)).join(",")
      let corresponding-mark = if "corresponding" in a and a.corresponding { "*" } else { "" }
      [#text(12pt)[#a.name#super[#sup-nums]#corresponding-mark]]
    })
    // Join with ", " and "and" before the last
    let author-line = if author-parts.len() == 1 {
      author-parts.first()
    } else {
      let all-but-last = author-parts.slice(0, -1).join([, ])
      [#all-but-last and #author-parts.last()]
    }
    align(center, text(12pt, author-line))
  }

  // Corresponding author note: placed at bottom-left of page 1 (left column only)
  // Uses place() so it doesn't consume vertical space from the right column.
  {
    let corresponding = authors.filter(a => "corresponding" in a and a.corresponding)
    if corresponding.len() > 0 {
      let c = corresponding.first()
      place(bottom + left, float: true, scope: "column", clearance: 6pt,
        block(width: col-width)[
          #line(length: 50%, stroke: 0.5pt)
          #v(4pt)
          #text(9pt)[#super[\*]Corresponding author: #raw(c.email)]
        ]
      )
    }
  }
  v(0.15em)

  // Affiliations block
  {
    let aff-lines = affiliations.map(a => {
      [#super[#str(a.id)]#text(8pt, a.name)]
    })
    align(center, text(8pt, aff-lines.join(linebreak())))
  }
  v(0.8em)

  // Abstract
  align(left, text(10pt, weight: "bold")[Abstract])
  v(0.3em)
  text(9pt, style: "italic", abstract)
  v(0.5em)

  // --- Two-column body ---

  // Heading rules
  // Level 1: 14pt bold, centered
  show heading.where(level: 1): it => {
    v(0.4em)
    align(center, text(14pt, weight: "bold", it.body))
    v(0.1em)
  }
  // \subsection: \large = ~12pt, bold, left-aligned (ragged right)
  show heading.where(level: 2): it => {
    v(0.3em)
    text(12pt, weight: "bold", it.body)
    v(0.05em)
  }
  // \subsubsection: normal size (10pt), bold, run-in (inline with following text)
  show heading.where(level: 3): it => {
    v(0.5 * 0.65em)
    box(text(10pt, weight: "bold", it.body))
    h(8pt)
  }

  // Equation numbering
  set math.equation(numbering: "(1)")

  // Bibliography styling (numeric, sorting by order of use — IEEE matches this)
  set bibliography(style: "ieee")
  show bibliography: set text(8pt)

  // Figure/table caption styling: label bold+small, text italic+small
  show figure.caption: it => {
    text(9pt)[#text(weight: "bold")[#it.supplement #context it.counter.display(it.numbering):] #emph(it.body)]
  }
  set figure(gap: 6pt)
  show figure: set text(9pt)

  // Column gap: 20pt (matching LaTeX columnsep)
  columns(2, gutter: 20pt, doc)

  // Optional appendix (not part of page-limited paper; for reviewers only)
  if appendix != none {
    pagebreak()
    align(center, text(12pt, weight: "bold", fill: red)[— Not part of the paper — for reviewers only —])
    v(0.5em)
    columns(2, gutter: 20pt, appendix)
  }
}
