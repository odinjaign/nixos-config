{ config, pkgs, ... }:

{
  home.username = "root";
  home.homeDirectory = "/root";

  home.stateVersion = "22.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.helix 
    pkgs.neofetch
    
    (pkgs.writeShellScriptBin "update" ''
      [ -z $1 ] && {
        echo "Please Give Flake directory"
        exit 1
      }
      cd $1 && git add .
      home-manager switch --flake $1
    '')
  ];

  home.file = {
    ".bashrc".source = ./dotfiles/.bashrc;
    ".config/nix/nix.conf".text = ''
      substituters = https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://cache.nixos.org/
      experimental-features = nix-command flakes
    '';
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName  = "odinjaign";
    userEmail = "jaign@outlook.com";
  };
}
