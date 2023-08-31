# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:
{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-minimal-hyperv"; # Define your hostname.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [ ];

  # Some programs need SUID wrappers, can be configured further or are

  ################# Hyprland ####################
  # programs.hyprland.enable = true;
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # environment.sessionVariables.WLR_RENDERER_ALLOW_SOFTWARE = "1";
  # environment.sessionVariables.LIBSEAT_BACKEND = "logind";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";
  services.openssh.settings.PasswordAuthentication = true;
  programs.ssh.startAgent = true;

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05"; # Did you read the comment?

  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

