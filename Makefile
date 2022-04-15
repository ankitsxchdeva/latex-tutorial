SRC = $(wildcard *.tex)
PDF = $(SRC:.tex=.pdf)
TEX = pdflatex

.PHONY: all
all: $(PDF)

.PHONY: tidy
tidy:
	rm -f $(PDF:.pdf=.aux) $(PDF:.pdf=.log) $(PDF:.pdf=.out) $(PDF:.pdf=.dvi)

.PHONY: clean
clean: tidy
	rm -f $(PDF)

.PHONY: view
view: all
	open tutorial.pdf -a firefox

%.pdf: %.tex
	$(TEX) $<
