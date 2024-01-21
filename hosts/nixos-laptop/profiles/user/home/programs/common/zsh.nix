{self-options, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~${self-options.username}/Codes/laptop-nixconfig#nixos-laptop";
      clean = "sudo nix-collect-garbage -d";
      edit = "code ~${self-options.username}/Codes/laptop-nixconfig";
    };
    history.size = 10000;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
}
