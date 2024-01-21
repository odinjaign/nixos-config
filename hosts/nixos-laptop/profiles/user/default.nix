{
  # home-manager,
  pkgs,
  inputs,
  self-options,
  ...
} @ args: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs self-options;
    };
    users.${self-options.username} = {
      imports = [
        # ({...}: {programs.home-manager.enable = true;})
        ./home
      ];
      home.stateVersion = "24.05";
    };
  };

  programs.zsh.enable = true;

  users.users.${self-options.username} = {
    isNormalUser = true;
    description = "${self-options.username}";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
}
