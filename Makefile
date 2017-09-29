TARBALL = scard.tgz
TARBALL_FILES = scard libr Makefile .gitignore .git

WEB_TARGET = $(WEBDIR)/$(TARBALL)
WEBDIR = $(HOME)/html/stac/eagle/

RM = rm -rf
CP = cp
TAR_CREATE = tar czf

.PHONY: webmirror clean

$(TARBALL): $(TARBALL_FILES)
	$(TAR_CREATE) $(TARBALL) $(TARBALL_FILES)

$(WEB_TARGET): $(TARBALL)
	$(CP) $(TARBALL) $(WEBDIR)

webmirror: $(WEB_TARGET)

clean:
	$(RM) $(WEB_TARGET) $(TARBALL)
