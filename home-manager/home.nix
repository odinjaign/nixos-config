{ config, pkgs, home-options,... }:

{
  home.username = "${home-options.username}";
  home.homeDirectory = "${home-options.home-dir}";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  imports = [
    ./libs/pkgs.nix
    ./libs/cli.nix
    ./libs/nix.nix
  ];

  programs.home-manager.enable = true;
}
