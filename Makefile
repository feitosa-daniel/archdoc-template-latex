#
# This is a blunt Makefile.
#
# If you want a more sophisticated Makefile then take a look at
# https://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# for various options and references.
#
# `man latexmk` helps as well.
#
# latexmk -pdf -pdflatex="pdflatex -shell-scape -interaction=nonstopmode" -use-make $(DOCUMENT)

DOCUMENT=main

.PHONY: all clean

all:
	$(info Make all ...)
	pdflatex -shell-escape $(DOCUMENT)
	pdflatex -shell-escape $(DOCUMENT)
	bibtex $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex -shell-escape $(DOCUMENT)

clean:
	$(info Make clean ...)
	latexmk -C -silent
	$(RM) *.bbl *.swp

bibtex:
	$(info Make bibtex ...)
	bibtex $(DOCUMENT)

