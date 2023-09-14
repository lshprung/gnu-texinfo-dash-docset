
all: texinfo

texinfo:
	$(MAKE) -f texinfo-Makefile

.PHONY: clean
clean:
	$(MAKE) clean -f texinfo-Makefile
