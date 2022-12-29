{ pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.settings = {
    auto-optimise-store = true;
    substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
    trusted-users = [ "@wheel" ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  system.stateVersion = "22.11";

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";

  networking.hostName = "nixos";
  networking.proxy.default = "http://192.168.31.188:7890/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.networkmanager.enable = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

}
