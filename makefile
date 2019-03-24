proj=cv
SRC = cv.tex resume.tex
OUT = $(SRC:.tex=.pdf)

all: $(OUT)

%.pdf: %.tex cv.bib functions.tex
	xelatex $<
	bibtex $*.1
	bibtex $*.2
	xelatex $<
	xelatex $<

clean:
	-rm *.pdf
	-rm *.aux
	-rm *.log
	-rm *.out
	-rm *.blg
	-rm *.bbl
	-rm *.fls
	-rm *.xdv
	-rm *.fdb_latexmk
	-rm *~
