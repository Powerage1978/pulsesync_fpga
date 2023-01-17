# Minimal makefile for Sphinx documentation

# You can set these variables from the command line.
SPHINXOPTS      =
SPHINXBUILD     = sphinx-build
SPHINXAUTOBUILD =
SPHINXPROJ      = picotemtransceiverfpga
SOURCEDIR       =
DOCSDIR         = ./docs
BUILDDIR        = _build
OUTPUTDIR       = ./output

# Put html first so that "make" without argument is like "make html".

html: create-outputdir 
	@$(SPHINXBUILD) -b html $(SPHINXOPTS) $(DOCSDIR) $(DOCSDIR)/$(BUILDDIR)/html
	cp -r $(DOCSDIR)/$(BUILDDIR)/html $(OUTPUTDIR)/

pdf : create-outputdir latex
	$(MAKE) -C $(DOCSDIR)/$(BUILDDIR)/latex all-pdf
	cp $(DOCSDIR)/$(BUILDDIR)/latex/$(SPHINXPROJ).pdf $(OUTPUTDIR)/pdf

latex :
	@$(SPHINXBUILD) -b latex $(SPHINXOPTS) $(DOCSDIR) $(DOCSDIR)/$(BUILDDIR)/latex

clean-docs :
	rm -rf $(DOCSDIR)/$(BUILDDIR)

clean-output:
	rm -rf $(OUTPUTDIR)

create-outputdir :
	mkdir -p $(OUTPUTDIR)
	mkdir -p $(OUTPUTDIR)/pdf

.PHONY: html latex clean-docs latex create-outputdir clean-output