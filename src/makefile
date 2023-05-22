PD = pandoc
META = yaml/meta.yaml

PDF_ENGINE = --pdf-engine=xelatex
TEMPLATE = --template=template.tex
INCLUDES = --include-in-header=components/components.sty

DATE = $(shell date +%m%d%Y)
OUT_PDF = $(DATE)_resume.pdf

$(OUT_PDF) : clean $(META)
	$(PD) $(PDF_ENGINE) $(INCLUDES) $(TEMPLATE) $(META) -o $@

.PHONY: clean
clean :
	if [ -e *.pdf ]; then rm *.pdf; fi

# pandoc meta.yaml --template=template.tex  -o output.pdf 
