proj=cv
SRC = cv.tex resume.tex
OUT = $(SRC:.tex=.pdf)

all: $(OUT)

%.pdf: %.tex cv.bib functions.tex
	xelatex --shell-escape $<
	bibtex $*.1
	-bibtex $*.2
	xelatex --shell-escape $<
	xelatex --shell-escape $<

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
	-rm -rf svg-inkscape
