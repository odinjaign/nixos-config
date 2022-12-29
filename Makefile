.PHONY: clone, update, install

clone: scripts/clone.sh
	bash $^

update:
	sudo nixos-rebuild switch --flake . --impure

install: scripts/chown.sh
install: scripts/clone.sh
install: scripts/vscode-fix.sh
	bash scripts/chown.sh
	bash scripts/clone.sh
	sudo nixos-rebuild switch --flake . --impure
	bash scripts/vscode-fix.sh

