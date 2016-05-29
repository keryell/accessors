DOCUMENT=accessors

# A trivial suboptimal Makefile
all:
	pdflatex $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex $(DOCUMENT)
	pdflatex $(DOCUMENT)
