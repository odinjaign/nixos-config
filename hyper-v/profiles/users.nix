{ home-manager, vscode-server, pkgs, ... }:

{

  imports = [
    home-manager.nixosModule
    vscode-server.nixosModule
  ];

  services.vscode-server.enable = true;

  programs.zsh.enable = true;

  users.users.jaign = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "jaign";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
    openssh.authorizedKeys.keyFiles = [
      ./.ssh/id_rsa.pub
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jaign = {
      imports = [ ./home/jaign.nix ];
      home.stateVersion = "22.11";
    };
  };
}
