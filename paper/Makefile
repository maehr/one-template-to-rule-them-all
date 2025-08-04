# Makefile for LaTeX projects using BibLaTeX/Biber
# Usage: make [filename without extension]
#        make clean

# Declare all targets as phony to force execution
.PHONY: all clean cleanall help $(basename $(wildcard *.tex))

# Find all .tex files in current directory
TEX_FILES := $(wildcard *.tex)
PDF_FILES := $(TEX_FILES:.tex=.pdf)

# Default target builds all PDFs
all: $(basename $(TEX_FILES))

# Rule to build a specific document
$(basename $(TEX_FILES)):
	@echo "Building $@.pdf from $@.tex..."
	pdflatex -interaction=nonstopmode $@.tex
	pdflatex -interaction=nonstopmode $@.tex
	biber $@
	pdflatex -interaction=nonstopmode $@.tex
	pdflatex -interaction=nonstopmode $@.tex
	@echo "Build of $@.pdf complete."

# Clean temporary files
clean:
	@echo "Cleaning temporary files..."
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.bcf *.blg *.run.xml *.fls *.fdb_latexmk *.synctex.gz *.dvi *.bak *-blx.bib *.spl
	@echo "Clean complete."

# Clean all including PDFs
cleanall: clean
	@echo "Removing PDF files..."
	rm -f *.pdf
	@echo "Clean complete."

# Help command
help:
	@echo "Makefile for LaTeX projects with BibLaTeX/Biber"
	@echo ""
	@echo "Available targets:"
	@echo "  make           - Build all PDFs from .tex files in current directory"
	@echo "  make filename  - Build a specific filename.pdf from filename.tex"
	@echo "  make clean     - Remove all temporary LaTeX files"
	@echo "  make cleanall  - Remove all temporary files and PDFs"
	@echo "  make help      - Display this help message"