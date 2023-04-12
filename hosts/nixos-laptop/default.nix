# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nixpkgs, ... }:

{
  imports =
    [ 
      ./hardware.nix
      ./profiles/system.nix
      ./profiles/boot.nix
      ./profiles/network.nix
      ./profiles/i18n.nix
      ./profiles/fonts.nix
      ./profiles/kde.nix
      ./profiles/user.nix
    ];
}
