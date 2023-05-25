PANDOC     = pandoc
PDF_ENGINE = --pdf-engine=xelatex
INCLUDES   = --include-in-header=components/components.sty

OUTPUT_DIR = output
TMP_DIR    = tmp

RESUME_TEMPLATE = resume_template.tex
COVERLETTER_TEMPLATE = coverletter_template.tex
COVERLETTER_TEMPLATE_TEMP := $(shell mktemp -u coverletter_template.XXXXXX.yaml)

RESUME_YAML = yaml/resume.yaml
COVERLETTER_YAML = yaml/coverletter.yaml

CURRENT_DATE_FNAME := $(shell date +%m%d%Y)
CURRENT_DATE       := $(shell date "+%B %e, %Y")

RESUME_PDF = $(OUTPUT_DIR)/$(CURRENT_DATE_FNAME)_resume.pdf
COVERLETTER_PDF = $(OUTPUT_DIR)/$(CURRENT_DATE_FNAME)_coverletter.pdf

.PHONY: all coverletter resume clean

all: coverletter resume

coverletter: $(COVERLETTER_PDF)

$(COVERLETTER_PDF): $(OUTPUT_DIR) $(COVERLETTER_YAML) $(COVERLETTER_TEMPLATE)
	sed "s/\[\[DATE\]\]/$(CURRENT_DATE)/g" $(COVERLETTER_TEMPLATE) > $(COVERLETTER_TEMPLATE_TEMP)
	$(PANDOC) $(PDF_ENGINE) $(INCLUDES) --template=$(COVERLETTER_TEMPLATE_TEMP) $(COVERLETTER_YAML) -o $@
	rm $(COVERLETTER_TEMPLATE_TEMP)

resume: $(RESUME_PDF)

$(RESUME_PDF): $(OUTPUT_DIR) $(RESUME_YAML) $(RESUME_TEMPLATE)
	$(PANDOC) $(PDF_ENGINE) $(INCLUDES) --template=$(RESUME_TEMPLATE) $(RESUME_YAML) -o $@

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf

# pandoc meta.yaml --template=template.tex  -o output.pdf 
