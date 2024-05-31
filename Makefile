# Override these vars on command line if needed
DESTDIR=$(HOME)/.emacs.d/tree-sitter
MODULES=$(wildcard tree-sitter-*)

# Linux or MacOS detection
OS_NAME=$(shell uname -s | tr A-Z a-z)
ifeq ($(OS_NAME),darwin)
	LIB_EXT=dylib
else
	LIB_EXT=so
endif

# Targets

all:
	@echo Building all modules
	@$(foreach module, $(MODULES), make -C $(module);)

list: 
	@echo Module list:
	@$(foreach module, $(MODULES), echo "  $(module)";)

clean:
	@echo Building all module 'clean' targets
	@$(foreach module, $(MODULES), make -C $(module) clean;)

$(DESTDIR):
	@echo \"$(DESTDIR)\" does not exist, creating it...
	@mkdir $(DESTDIR)
	@echo Successfully created \"$(DESTDIR)\"

install: all $(DESTDIR)
	@echo Installing all modules to $(DESTDIR)
	@$(foreach module, $(MODULES), cp $(module)/lib$(module).$(LIB_EXT) $(DESTDIR);)
