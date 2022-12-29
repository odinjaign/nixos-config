{ home-manager, vscode-server, pkgs, ... }:

{
  imports = [
    home-manager.nixosModule
    vscode-server.nixosModule
  ];

  services.vscode-server.enable = true;

  programs.zsh.enable = true;
  users.users.nixos.shell = pkgs.zsh;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.nixos = {
    imports = [ ./home/nixos.nix ];
    home.stateVersion = "22.11";
  };
}
