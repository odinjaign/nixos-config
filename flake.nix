{
  description = "Flake WSL";
  inputs = {
    # https://github.com/NixOS/nixpkgs.git
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable/;
    # nixpkgs.url = "/flakes/nixpkgs/?ref=nixos-unstable";

    # https://github.com/nix-community/home-manager
    home-manager.url = "/flakes/home-manager/";
    
    # https://github.com/nix-community/NixOS-WSL.git
    nixos-wsl.url = "/flakes/NixOS-WSL/";

    # https://github.com/msteen/nixos-vscode-server.git
    vscode-server.url = "/flakes/nixos-vscode-server/";
  };
  
  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./configuration.nix ];
    };
  };
}
