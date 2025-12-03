# RISC-V Summit Europe templates

The expected formating of the two pages abstracts is detailled below,
together with three templates, for Word, LibreOffice and LaTeX.

## Document format

The 2 pages extended abstracts shall be formated as follows for submission:

 - Title, authors, affiliations and abstract shall be in single collumn mode.

 - Font shall be Times New Roman throughout the document.

 - Title is in 24 pt.

 - Author names in 12 pt.

 - Author affiliations in 8 pt.

 - The "**Abstract**" heading shall be in 10 pt bold.

 - Abstract body in 9 pt italics.

 - The core of the submission shall be in two columns.

 - Core text is in 10 pt.

 - Level 1 headings in 14 pt **bold**, centered.

 - Level 2 headings in 12 pt **bold**, left aligned.

 - No header.

 - The footer on odd pages shall have:

   - On the left "*RISC-V Summit Europe, Bologna, 8-12th June 2026*" in 9 pt italics.

   - On the right, the **page number**, in bold 9 pt.

 - The footer on even pages shall have the left and right odd footer switched.

 - The font for bibliography entries can be reduced to 8 pt.

A sample *lorem ipsum* document formated according to these rules is
available [online](https://riscv-europe.org/summit/2024/media/template/template.pdf).

## LaTeX template

The template is based on [The Journal
Article](http://www.latextemplates.com/template/journal-article) from
the site [LaTeX Templates](http://www.latextemplates.com).

Bear with the [Call for
Submission](https://riscv-europe.org/summit/2025/cfp) rules to make sure
that your submision is anonymous, or not, depending on the topic.

The LaTeX template is in the [`LaTeX/`](LaTeX) subdirectory.  The main
LaTeX source file is [`template.tex`](LaTeX/template.tex), where most
of the article is expected to be, but the pictures.

It builds successfuly using [`TeX live
2025`](https://www.tug.org/texlive/) on a `Ubuntu 22.04 LTS`, and on
`macOS Tahoe 26.1`.

The main targets of the [`Makefile`](LaTeX/Makefile) are:

 - `all` to compile the PDF.
 
 - `timestamp` to compile the PDF, rename it with a timestamp, and
   move it to a pre-secified directory `PDF_TARGET_DIR`.

 - `view` to preview the produced PDF
 
 - `clean` and `clear` both do the ame thing and erase the uselss
   files from the LaTeX compilation process.
   
 - `clobber` do as `clean` and also deletes the local PDF produced.

 - `_variables`to help debug the [`Makefile`](LaTeX/Makefile) by
   printing its display variables.

More details are in the [`Makefile`](LaTeX/Makefile) comments.

## Word template

The Word template is in the [`Word/`](Word/) subdirectory and is named
[`template.docx`](Word/template.docx).
