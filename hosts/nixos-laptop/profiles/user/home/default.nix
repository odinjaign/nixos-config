{pkgs, ...}: {
  imports = [
    ./programs
    ./packages
    ./config.nix
  ];
}
