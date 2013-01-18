proj=cv
SRC = cv.tex resume.tex
OUT = $(SRC:.tex=.pdf)

all: $(OUT)

%.pdf: %.tex cv.bib functions.tex
	xelatex $<
	bibtex $*
	xelatex $<
	xelatex $<

clean:
	-rm *.pdf
	-rm *.aux
	-rm *.log
	-rm *.out
	-rm *.blg
	-rm *.bbl
	-rm *~
