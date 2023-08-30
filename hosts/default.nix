{ system, self, nixpkgs, inputs, user, ... }:
let
  lib = nixpkgs.lib;
in
{
  nixos-minimal-hyperv = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [
      ./nixos-minimal-hyperv/hardware-configuration.nix
      ./nixos-minimal-hyperv/configuration.nix
    ];
  };
}