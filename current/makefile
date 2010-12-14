proj=cv

all: $(proj).pdf

$(proj).pdf: $(proj).tex
	xelatex $(proj)
	bibtex $(proj)
	xelatex $(proj)
	xelatex $(proj)

clean:
	-rm *.pdf
	-rm *.aux
	-rm *.log
	-rm *.out
	-rm *.blg
	-rm *.bbl
