{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./desktop/gnome.nix
    ./profiles/system.nix
    ./profiles/users.nix
  ];
}
