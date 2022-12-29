{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./profiles/system.nix
    ./profiles/gui.nix
    ./profiles/locale.nix
    ./profiles/home.nix
  ];
}
