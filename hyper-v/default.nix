{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./profiles/system.nix
    ./profiles/users.nix
  ];
}
