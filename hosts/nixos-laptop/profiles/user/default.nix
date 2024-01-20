{
  home-manager,
  pkgs,
  ...
}: {
  imports = [
    home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jaign = {
      imports = [
        # ({...}: {programs.home-manager.enable = true;})
        ./home
      ];
      home.stateVersion = "24.05";
    };
  };

  programs.zsh.enable = true;

  users.users.jaign = {
    isNormalUser = true;
    description = "jaign";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
}
