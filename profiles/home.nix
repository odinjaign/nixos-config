{ home-manager, pkgs, ... }:

{
  imports = [
    home-manager.nixosModule
    (fetchTarball {
      url = "https://github.com/msteen/nixos-vscode-server/tarball/master";
      sha256 = "1qga1cmpavyw90xap5kfz8i6yz85b0blkkwvl00sbaxqcgib2rvv";
    })
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
