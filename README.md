# RISC-V Summit Europe templates

The expected formatting of the two pages abstracts is detailed below,
together with two templates, for Word and LaTeX.

## Document format

The 2 pages extended abstracts shall be formatted as follows for submission:

 - Title, authors, affiliations and abstract shall be in single column mode.

 - Font shall be Times New Roman throughout the document.

 - Title is in 24 pt.

 - Author names in 12 pt.

 - Author affiliations in 8 pt.

 - The "Abstract" heading shall be in 10 pt bold.

 - Abstract body in 9 pt italics.

 - The core of the submission shall be in two columns.

 - Core text is in 10 pt.

 - Level 1 headings in 14 pt, centered.

 - Level 2 headings in 12 pt, left aligned.

 - No header.

 - The footer on odd pages shall have:

   - On the left "RISC-V Summit Europe, Paris, 12-15th May 2025" in 9 pt italics.

   - On the right, the page number, in non italics bold 9 pt.

 - The footer on even pages shall have the left and right odd footer switched.

 - The font for bibliography entries can be reduced to 8 pt.

A sample *lorem ipsum* document formatted according to these rules is
available [online](https://riscv-europe.org/summit/2024/media/template/template.pdf).

## LaTeX template

The template is based on [The Journal
Article](http://www.latextemplates.com/template/journal-article) from
the site [LaTeX Templates](http://www.latextemplates.com).

Bear with the [Call for
Submission](https://riscv-europe.org/summit/2025/cfp) rules to make sure
that your submission is anonymous, or not, depending on the topic.

The LaTeX template is in the [`LaTeX/`](LaTeX) subdirectory.  The main
LaTeX source file is [`template.tex`](LaTeX/template.tex), where most
of the article is expected to be, but the pictures.

It builds successfully on a `Ubuntu 20.04 LTS` using [`TeX live
2023`](https://www.tug.org/texlive/).

The main targets of the [`Makefile`](LaTeX/Makefile) are:

 - `all` to compile the PDF.
 
 - `timestamp` to compile the PDF, rename it with a timestamp, and
   move it to a pre-specified directory `PDF_TARGET_DIR`.

 - `view` to preview the produced PDF
 
 - `clean` and `clear` both do the same thing and erase the useless
   files from the LaTeX compilation process.
   
 - `clobber` do as `clean` and also deletes the local PDF produced.

More details are in the [`Makefile`](LaTeX/Makefile) comments.

## Word template

The Word template is in the [`Word/`](Word/) subdirectory and is named
[`template.docx`](Word/template.docx).
