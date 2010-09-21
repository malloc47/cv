# Makefile
# $Id: Makefile,v 1.14 2006/12/12 22:55:50 jrblevin Exp $
#
# LaTeX Makefile for curriculum vitae template cv-us.tex
#
# Jason Blevins <jrblevin@sdf.lonestar.org>
# Durham, December 12, 2006

###############################################################################
# Configuration Section
# This should be the only section you need to modify

# Project base filename where your main tex file is $(BASENAME).tex
BASENAME = cv-us

# Any supporting files needed to compile $(BASENAME).tex such as
# included tex files or figures
SUPPORTS = 

# Other files that will be included in an archive
OTHER_FILES =

# Uncomment the next two lines if you wish to use bibtex.  These lines
# assume the bib file is $(BASENAME).bib.  Modify if needed.
BIBFILE = #$(BASENAME).bib
BBLFILE = #$(BASENAME).bbl

# Program locations and options
LATEX = latex
LATEXFLAGS = -interaction=nonstopmode
BIBTEX = bibtex
PDFLATEX = pdflatex
DVIPS = dvips
DVIPSFLAGS = -t letter

ACROREAD = acroread
XDVI = xdvi
GGV = ggv

###############################################################################
# File lists

DISTFILES = *.aux *.log *~ *.blg *.bbl *.dvi *.toc
CLEANFILES = $(DISTFILES) *.ps *.pdf *.zip *.tar.gz

TEMPLATE_FILES = Makefile $(BASENAME).tex

# Website

WEBSITE_FILES = $(BASENAME).pdf cv-template.tar.gz \
	$(OTHER_FILES) $(TEMPLATE_FILES)

WEBSITE_PATH = /home/jrblevin/projects/web/duke/content/cv/

###############################################################################
# Build rules

all: $(BASENAME).dvi $(BASENAME).ps $(BASENAME).pdf

preview: $(BASENAME).dvi
	$(XDVI) $(BASENAME).dvi &

$(BASENAME).aux: $(BASENAME).tex $(SUPPORTS) $(BIBFILE)
	$(LATEX) $(LATEXFLAGS) $(BASENAME).tex

$(BASENAME).bbl: $(BASENAME).tex $(BIBFILE) $(BASENAME).aux
	$(BIBTEX) $(BASENAME).aux

$(BASENAME).dvi: $(BASENAME).tex $(BASENAME).aux $(BBLFILE) $(BIBFILE)
	$(LATEX) $(LATEXFLAGS) $(BASENAME).tex
	$(LATEX) $(LATEXFLAGS) $(BASENAME).tex

$(BASENAME).ps: $(BASENAME).dvi
	$(DVIPS) $(BASENAME).dvi -o $@ $(DVIPSFLAGS)

$(BASENAME).pdf: $(BASENAME).tex #$(BASENAME).aux $(BIBFILE) $(BBLFILE)
	pdflatex -interaction=nonstopmode $(BASENAME).tex

###############################################################################
# Archive rules

archive: cv-template.tar.gz

cv-template.tar.gz: $(TEMPLATE_FILES)
	-mkdir cv-template
	cp $(TEMPLATE_FILES) cv-template
	tar zcvf cv-template.tar.gz cv-template
	-rm -rf cv-template

###############################################################################
# Website Rules

website: $(WEBSITE_FILES)
	cp -avf $(WEBSITE_FILES) $(WEBSITE_PATH)

###############################################################################
# Clean-up rules

clean:
	-rm -f $(CLEANFILES)

distclean:
	-rm -f $(DISTFILES)


###############################################################################
# No longer used

# For RCS check-in and -out (Now under CVS control in a larger module)
RCSFILES = $(BASENAME).tex $(SUPPORTS) Makefile $(OTHER_FILES) \
	$(BASENAME).pdf $(BASENAME).ps cv-template.tar.gz

ci: $(RCSFILES)
	$(shell for i in $(RCSFILES) ; do ci -u $$i ; done)

co: $(RCSFILES)
	$(shell for i in $(RCSFILES) ; do co -l $$i ; done)

# For archiving snapshots of the code (Moved to RCS, then CVS)
SNAPFILES = Makefile *.tex $(BASENAME).ps $(BASENAME).pdf $(BASENAME).dvi

snap: 
	-mkdir -p snapshots
	-mkdir `date +%Y%m%d`
	cp -R $(SNAPFILES) `date +%Y%m%d`
	tar zcvf snapshots/$(BASENAME).`date +%Y%m%d`.tar.gz `date +%Y%m%d`
	rm -rf `date +%Y%m%d`

# Used to make a distributable zip file
ZIPFILES = $(SUPPORTS) $(BASENAME).tex $(BIBFILE) $(BASENAME).ps \
	$(BASENAME).pdf $(OTHER_FILES)

zip: $(ZIPFILES)
	-rm -f $(BASENAME).zip
	zip $(BASENAME).zip $(ZIPFILES)

###############################################################################
