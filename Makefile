
all: texinfo info-reader

texinfo:
	$(MAKE) -f texinfo-Makefile

info-reader:
	$(MAKE) -f info-reader-Makefile

.PHONY: clean
clean:
	$(MAKE) clean -f texinfo-Makefile
	$(MAKE) clean -f info-reader-Makefile

.PHONY: dist-clean
dist-clean: clean
	rm -rf tmp
