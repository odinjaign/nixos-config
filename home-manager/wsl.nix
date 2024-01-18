{ pkgs, ...}:{

  home.stateVersion = "23.11";

  imports = [
    ./libs/pkgs.nix
    ./libs/cli.nix
  ];

}
