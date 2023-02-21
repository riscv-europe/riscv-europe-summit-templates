# No LaTeX included files at first.
ARTICLE_INC=


# Include local configuration, if any, where variable can be set.
sinclude local-conf.mk


# The PDF viewer of choice.

## Assume Ubuntu's evince.
PDF_VIEWER?=evince


# The main LaTeX file.
ARTICLE?=template


# Included files, if any.
ARTICLE_INC+=


# Timestamp and delivery directory for the article.

## The current status of this repo. is used as timestamp.
TIMESTAMP:=$(shell git describe --long --tags --always --abbrev=8)

## Or it could be the local date.
# TIMESTAMP:=v$(shell date '+%Y-%m-%d-%Hh%M')

## Where to deliver the timestamped copy.
PDF_TARGET_DIR?=.


# The main target.
all : $(ARTICLE).pdf


# Deliver a timestamped version where it belongs.
timestamp : $(ARTICLE).pdf
	cp $< $(PDF_TARGET_DIR)/$(ARTICLE)-$(TIMESTAMP).pdf


# Produce the local draft.
$(ARTICLE).pdf : $(ARTICLE).tex 
	pdflatex $(ARTICLE)
	pdflatex $(ARTICLE)
	biber $(ARTICLE)
	pdflatex $(ARTICLE)


# Housekeeping.

## Display the current draft.
view:
	$(PDF_VIEWER) $(ARTICLE).pdf

## Clear the various LaTeX temp. files.
clean clear:
	rm -f *-blx.bib *run.xml *.aux *.bbl *.blg *.dvi *.toc *.log *.ps *.out *.lot *.lof *.glg *.glo *.gls *.bcf *.xdy *.ist *.tns *~

## Remove also the produced PDF.
clobber: clean
	rm -f $(ARTICLE).pdf
