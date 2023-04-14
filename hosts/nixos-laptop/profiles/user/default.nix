{
  home-manager,
  pkgs,
  ...
}: {
  imports = [
    home-manager.nixosModule
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jaign = {
      imports = [
        ({...}: {programs.home-manager.enable = true;})
        ./home
      ];
      home.stateVersion = "22.11";
    };
  };

  programs.zsh.enable = true;

  users.users.jaign = {
    isNormalUser = true;
    description = "jaign";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
}
