.PHONY: clone, update

clone: scripts/clone.sh
	bash $^

update:
	sudo nixos-rebuild switch

install: scripts/chown.sh
install: scripts/clone.sh
install: scripts/vscode-fix.sh
	bash scripts/chown.sh
	bash scripts/clone.sh
	sudo nixos-rebuild switch
	bash scripts/vscode-fix.sh

