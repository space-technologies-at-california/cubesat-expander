TARBALL = scard.tgz
PARENT_DIR = $(shell basename $(PWD))
TARBALL_DEPS = .git .gitignore Makefile libr scard
TARBALL_FILES = $(patsubst %,../$(PARENT_DIR)/%,$(TARBALL_DEPS))

WEB_TARGET = $(WEBDIR)/$(TARBALL)
WEBDIR = $(HOME)/html/stac/eagle/

RM = rm -rf
CP = cp
TAR_CREATE = tar czf

.PHONY: webmirror clean

$(TARBALL): $(TARBALL_DEPS)
	$(TAR_CREATE) $(TARBALL) $(TARBALL_FILES)

$(WEB_TARGET): $(TARBALL)
	$(CP) $(TARBALL) $(WEBDIR)

webmirror: $(WEB_TARGET)

clean:
	$(RM) $(WEB_TARGET) $(TARBALL)
