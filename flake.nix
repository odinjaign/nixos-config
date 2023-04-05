{
  description = "Jaign Flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server.url = github:msteen/nixos-vscode-server;
  };

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.nixos-hyper-v = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./hyper-v/configuration.nix ];
    };
  };
}
