{ home-manager, vscode-server, pkgs, ... }:

{
  imports = [
    home-manager.nixosModule
    vscode-server.nixosModule
  ];

  services.vscode-server.enable = true;

  users.users.jaign = {
    isNormalUser = true;
    description = "jaign";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.jaign = {
    imports = [ ./home/jaign.nix ];
    home.stateVersion = "22.11";
  };
}
