{
  description = "Jaign Flake";

  inputs = {
    nixpkgs.url = path:/nix/repos/NixOS.nixpkgs.nixos-unstable;

    home-manager = {
      url = path:/nix/repos/nix-community.home-manager.master;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-server = {
      url = path:/nix/repos/msteen.nixos-vscode-server.master;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = path:/nix/repos/nix-community.NixOS-WSL.main;
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.nixos-hyper-v = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./hyper-v/configuration.nix ];
    };
    nixosConfigurations.nixos-wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./wsl/configuration.nix ];
    };
  };
}
