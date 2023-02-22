# RISC-V Summit Europe templates

These are the two templates, Word and LaTeX, to use to submit 2 pages
abstracts to the RISC-V Summit Europe.

## LaTeX template

The template is based on [The Journal
Article](http://www.latextemplates.com/template/journal-article) from
the site [LaTeX Templates](http://www.latextemplates.com).

Bear with the [Call for
Submission](https://riscv-europe.org/program.html) rules to make sure
that your submision is anonymous, or not, depending on the topic.

The LaTeX template is in the `LaTeX/` subdirectory.  The main LaTeX
source file is `template.tex`, where most of the article is expected
to be, but the pictures.

It builds successfuly on a `Ubuntu 20.04 LTS` using [`TeX live
2022`](https://www.tug.org/texlive/).

The main targets of the `Makefile` are:

 - `all` to compile the PDF.
 
 - `timestamp` to compile the PDF, rename it with a timestamp, and
   move it to a pre-secified directory `PDF_TARGET_DIR`.

 - `view` to preview the produced PDF
 
 - `clean` and `clear` both do the ame thing and erase the uselss
   files from the LaTeX compilation process.
   
 - `clobber` do as `clean` and also delete the local PDF produced.

More details are in the `Makefile` comments.

## Word template

The Word template is in the `Word/` subdirectory and is named
`template.docx`.
