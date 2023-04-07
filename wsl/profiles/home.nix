{ pkgs, ... } @ attrs:

{
  imports = [
    attrs.home-manager.nixosModule
  ];

  programs.zsh.enable = true;

  users.users.nixos.shell = pkgs.zsh;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.nixos = {
    imports = [ ./home/nixos.nix ];
    home.stateVersion = "22.11";
  };
}