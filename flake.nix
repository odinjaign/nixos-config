{
  description = "A very basic flake";

  outputs = inputs @ { self, nixpkgs, flake-parts, ... }: 
    let
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      flake = {
        nixosConfigurations = (
          import ./hosts {
            system = "x86_64-linux";
            user = "jaign";
            inherit nixpkgs self inputs;
          }
        );
      };
    };
    
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

  };
}
