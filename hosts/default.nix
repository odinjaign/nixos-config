{ system, self, nixpkgs, inputs, user, ... }:
let
  machine = "nixos-minimal-hyperv";
in
{
  ${machine} = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [
      ./${machine}
    ];
  };
}