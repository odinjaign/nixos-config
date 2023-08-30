{ inputs, user, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit user; };
    users.${user} = {
      home.stateVersion = "23.05";
      programs.git = {
        enable = true;
        userName = "odinjaign";
        userEmail = "jaign@outlook.com";
      };      
    };
  };
  
}