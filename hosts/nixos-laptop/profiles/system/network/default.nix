{...}: {
  networking.hostName = "nixos-laptop";
  networking.networkmanager.enable = true;
  networking.proxy.default = "http://192.168.30.10:7890";
}
