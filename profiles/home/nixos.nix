{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go git wget vim python3Full nixfmt gnumake tldr
    rustup
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
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      history = { size = 10000; };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "python" ];
        theme = "robbyrussell";
      };
    };
  };

}
