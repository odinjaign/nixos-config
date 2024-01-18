# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, wsl-options, inputs, ... }:

{
  imports = [

    inputs.nixos-wsl.nixosModules.wsl
    inputs.home-manager.nixosModules.home-manager
    
    # ./libs/vscode.nix

  ];

  wsl.enable = true;
  wsl.defaultUser = "${wsl-options.username}";
  
  system.stateVersion = "23.11";

  networking.proxy.default = "${wsl-options.proxy}";
  networking.hostName = "${wsl-options.hostname}";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs;[
    git helix wget curl
  ];

  # default shell: zsh
  users.users."${wsl-options.username}".shell = pkgs.zsh;
  programs.zsh.enable = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {inherit inputs;};
  home-manager.users."${wsl-options.username}".imports = [
    ../home-manager/wsl.nix
  ];
  
}
