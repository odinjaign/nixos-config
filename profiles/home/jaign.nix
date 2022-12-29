{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    htop
    httpie
    git
    wget
    vim
    python3Full
    nixfmt
    gnumake
    tldr
    vscode
    firefox
  ];
  programs = {
    home-manager.enable = true;
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
        vscodevim.vim
        yzhang.markdown-all-in-one
        bbenoist.nix
        ms-ceintl.vscode-language-pack-zh-hans
        golang.go
      ];
    };
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
        plugins = [ "git" "command-not-found" "python" ];
        theme = "robbyrussell";
      };
    };
  };

}
