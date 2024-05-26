.PHONY: all 
all: article clean

.PHONY: article
article: 
	latexmk -pdf ${PVC} -pdflatex="pdflatex -syntex=1 -interaction=nonstopmode" thesis.tex

.PHONY: clean 
clean: 
	latexmk -C -bibtex 
	rm *.loa *.lol *.tdo

.PHONY: zip 
zip: 
	zip thesis -x *.git -x *.synctex.gz -r . 

.PHONY: bibtool 
bibtool: 
	bibtool -R -r keep_bibtex -r field -r improve -r month -s references.bib -o references.bib


