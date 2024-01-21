{pkgs, ...}: {
  imports = [
    ./programs
    ./packages
    ./config
  ];
}
