{
  description = "Home Manager configuration of root";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "https://ghproxy.net/https://github.com/nixos/nixpkgs/archive/5a156c2e89c1eca09b40bcdcee86760e0e4d79a9.tar.gz";
    flake-utils = {
      url = "https://ghproxy.net/https://github.com/numtide/flake-utils/archive/93a2b84fc4b70d9e089d029deacc3583435c2ed6.tar.gz";
    };
    home-manager = {
      # url = "github:nix-community/home-manager";
      url = "https://ghproxy.net/https://github.com/nix-community/home-manager/archive/28698126bd825aff21cae9ffd15cf83e169051b0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.utils.follows = "flake-utils";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.root = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./src ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
