{ pkgs, ... }:

{
    home.packages = with pkgs; [
        vim
        httpie
        helix
        tree
    ];

    programs.git = {
        enable = true;
        userName = "odinjaign";
        userEmail = "jaign@outlook.com";
    };

    programs.zsh = {
        enable = true;
        shellAliases = {
            update = "sudo nixos-rebuild switch --flake /flake";
            update-impure = "update --impure";
            clean = "sudo nix-collect-garbage -d";
        };
        history.size = 10000;
        oh-my-zsh.enable = true;
        oh-my-zsh.theme = "robbyrussell";
    };
}