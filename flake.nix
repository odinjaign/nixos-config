{
  description = "Laptop Configuration";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    nur.url = "github:nix-community/NUR";

    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {...} @ inputs: let
    self-options = {
      username = "jaign";
    };
  in {
    nixosConfigurations.nixos-laptop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit self-options inputs;
      };
      # // inputs;
      modules = [
        inputs.nur.nixosModules.nur
        ./hosts/nixos-laptop
      ];
    };
  };
}
