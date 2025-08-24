LATEX         := lualatex
PDF_VIEWER    := evince

all:
	 $(LATEX) example.tex
	make clean

show: all
	$(PDF_VIEWER) example.pdf

clean:
	rm -rf *.log

clean-pdf: clean
	-@rm -rf *.pdf

.PHONY: all show clean clean-pdf
