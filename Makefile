# Override these vars on command line if needed
DESTDIR=$(HOME)/.emacs.d/tree-sitter
MODULES=$(wildcard tree-sitter-*)

all:
	@echo Building all modules
	@$(foreach module, $(MODULES), make -C $(module);)

list: 
	@echo Module list:
	@$(foreach module, $(MODULES), echo "  $(module)";)

clean:
	@echo Building all module 'clean' targets
	@$(foreach module, $(MODULES), make -C $(module) clean;)

install: all
	@mkdir $(DESTDIR)
	@echo Installing all modules to $(DESTDIR)
	@$(foreach module, $(MODULES), cp $(module)/lib$(module).so $(DESTDIR);)
