build: clean
	pdflatex -shell-escape index.tex
clean:
	git clean -fX