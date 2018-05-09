PACKAGE=multi-display-indicator
SHARE_PATH=/usr/local/share/$(PACKAGE)/
BIN_PATH=/usr/local/bin/$(PACKAGE)

all:
	bash config.sh

install:
	mkdir -p $(SHARE_PATH)
	cp ./commands ./run.py $(SHARE_PATH)
	chmod a+x $(SHARE_PATH)/run.py
	ln -s -T $(SHARE_PATH)/run.py $(BIN_PATH)
	cp multi-display-indicator.desktop /etc/xdg/autostart/

uninstall:
	-rm /etc/xdg/autostart/multi-display-indicator.desktop
	-rm -rf $(SHARE_PATH)
	-rm -rf $(BIN_PATH)

reinstall: uninstall install
