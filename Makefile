.PHONY: clone, update

clone: scripts/clone.sh
	bash $^

update:
	sudo nixos-rebuild switch
