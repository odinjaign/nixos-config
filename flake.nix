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
          proxy = "http://192.168.30.10:7890"
        };
      in nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs wsl-options; };
        modules = [
          ./machines/nixos-wsl.nix          
        ];
      };
    };

    homeConfigurations = {
      "jaign" = let 
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        home-options = {
          username = "jaign";
          home-dir = "/home/jaign";
        };
      in home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager/home.nix ];
        extraSpecialArgs = { inherit inputs home-options; };
      };
    };
  };
}
