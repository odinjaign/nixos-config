{ inputs, user, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit user; };
    users.${user} = {
      home.stateVersion = "23.05";
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
    };
  };
  
}