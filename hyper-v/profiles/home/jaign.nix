{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vim
    httpie
  ];

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "jaign";
      userEmail = "jaign@outlook.com";
    };
    zsh = {
      enable = true;
      shellAliases = {
        update = "sudo nixos-rebuild switch --flake /home/jaign/nixos-profiles#nixos-hyper-v";
        update-impure = "update --impure";
        clean = "sudo nix-collect-garbage -d";
      };
      history.size = 10000;
      oh-my-zsh.enable = true;
      oh-my-zsh.theme = "robbyrussell";
    };
  };
}
