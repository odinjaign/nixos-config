{ nixos-wsl, ... }:

{
  imports = [ nixos-wsl.nixosModules.wsl ];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "nixos";
    startMenuLaunchers = true;
    nativeSystemd = true;
    interop.includePath = false;
  };
}
