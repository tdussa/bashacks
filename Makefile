INTERNAL = $(shell find src/internal -type f -name '*.sh')
PLUGINS = $(shell find src/ -type f -name '*.sh' -not -path 'src/internal/*')
OUTFILE = bashacks.sh
BASHRCFILE = ~/.bash_profile

all:
	if [ -e "$(OUTFILE)" ]; then \
		cp -vi "$(OUTFILE)" "$(OUTFILE).$$(date +%Y%m%d)"; \
		echo -n > "$(OUTFILE)"; \
	fi
	for file in $(INTERNAL) $(PLUGINS); do \
		cat $$file >> $(OUTFILE); \
		echo >> $(OUTFILE); \
	done

install:
ifeq ("$(wildcard $(OUTFILE))","")
	$(error $(OUTFILE) not found. Try: make)
endif	
	echo -e "\n[[ -e $(shell pwd)/$(OUTFILE) ]] && source $(shell pwd)/$(OUTFILE)" >> $(BASHRCFILE)
	
clean:
	rm -f bashacks.sh

uninstall:
	sed -i .bak "/bashacks\.sh/d" $(BASHRCFILE)
