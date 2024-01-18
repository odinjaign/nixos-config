{
  description = "jaign's flakes";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    
  };
  
  outputs = { self
    , nixpkgs
    , home-manager
    , nixos-wsl
    ,... } @inputs : {
    nixosConfigurations = {
      "nixos-wsl" = let
        wsl-options = {
          username = "jaign";
          hostname = "nixos-wsl";
        };
      in nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs wsl-options; };
        modules = [
          # nixos-wsl.nixosModules.wsl
          # home-manager.nixosModules.home-manager
          ./nixos-wsl.nix          
        ];
      };
    };

    homeConfigurations = {
      "jaign" = let 
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager ];
      };
    };
  };
}
