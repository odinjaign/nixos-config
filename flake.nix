{
  description = "A very basic flake";

  outputs = inputs @ { self, nixpkgs, flake-parts, ... }: 
    let
      user = "jaign";
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      flake = {
        nixosConfigurations = (
          import ./hosts {
            system = "x86_64-linux";
            inherit nixpkgs self inputs user;
          }
        );
      };
    };
    
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
}
