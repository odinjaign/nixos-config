{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    qq
    qv2ray
    microsoft-edge
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "odinjaign";
    userEmail = "jaign@outlook.com";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/jaign/Codes/laptop-nixconfig#nixos-laptop";
      clean = "sudo nix-collect-garbage -d";
    };
    history.size = 10000;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      editorconfig.editorconfig
      ms-ceintl.vscode-language-pack-zh-hans
      pkief.material-icon-theme
    ];
  };

}