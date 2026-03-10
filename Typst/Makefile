# Include local configuration, if any, where variables can be set.
sinclude local-conf.mk


# Select the PDF viewer.

ifeq ($(shell uname -s),Darwin)
## On a Mac, use "open" unless stated otherwise.
PDF_VIEWER?=open
else
## Elsewhere, default to Ubuntu's "evince".
PDF_VIEWER?=evince
endif


# The main Typst file.
ARTICLE?=template


# Timestamp and delivery directory for the article.

## The current status of this repo. is used as timestamp.
# TIMESTAMP:=$(shell git describe --long --tags --always --abbrev=8)

## Or it could be the local date.
TIMESTAMP:=v$(shell date '+%Y-%m-%d-%Hh%M')

## Where to deliver the timestamped copy.
PDF_TARGET_DIR?=.


# The main target.
all : $(ARTICLE).pdf


# Deliver a timestamped version where it belongs.
timestamp : $(ARTICLE).pdf
	cp $< $(PDF_TARGET_DIR)/$(ARTICLE)-$(TIMESTAMP).pdf


# Produce the local draft.
$(ARTICLE).pdf : $(ARTICLE).typ SummitEUArticle.typ bibliography.bib
	typst compile $(ARTICLE).typ


# Produce a blind-submission PDF (authors/affiliations anonymized).
blind : $(ARTICLE).typ SummitEUArticle.typ bibliography.bib
	typst compile --input blind=true $(ARTICLE).typ $(ARTICLE)-blind.pdf


# Housekeeping.

## Display the current draft.
view:
	$(PDF_VIEWER) $(ARTICLE).pdf

## Remove the produced PDF.
clean clear clobber:
	rm -f $(ARTICLE).pdf $(ARTICLE)-blind.pdf

## To debug this Makefile
.PHONY: _variables
_variables: \
	_print_ARTICLE \
	_print_TIMESTAMP \
	_print_PDF_VIEWER \
	_print_PDF_TARGET_DIR

_print_%:
	@/bin/echo '$*=$($*)' and was set in '"$(origin $*)"'
