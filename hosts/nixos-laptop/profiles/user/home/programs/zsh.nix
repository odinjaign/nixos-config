{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/jaign/Codes/laptop-nixconfig#nixos-laptop";
      clean = "sudo nix-collect-garbage -d";
    };
    history.size = 10000;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
}
