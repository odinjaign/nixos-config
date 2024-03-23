{
  config,
  lib,
  pkgs,
  ...
}: let
  srcs = import ./sets/srcs.nix {};
  apps = import ./sets/apps.nix {inherit pkgs;};
in {
  imports = [
    ./hardware-configuration.nix
    ./libs/default.nix
    (import srcs.home-manager {}).nixos
  ];

  # boot.loader.systemd-boot.enable = true;
  # boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
    grub.enable = true;
    grub.device = "nodev";
    grub.efiSupport = true;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  networking.proxy.default = "http://192.168.30.10:7890/";
  networking.proxy.noProxy = "127.0.0.1,localhost,.localdomain,.aliyuncs.com,.cn";

  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.supportedLocales = ["zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8"];
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-configtool
      fcitx5-chinese-addons
    ];
  };

  fonts.packages = with pkgs; [
    # sarasa-gothic
    wqy_microhei
    # wqy_zenhei
    (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono"];})
  ];

  services = import ./system/services.nix {inherit pkgs;};
  programs = import ./system/programs.nix {};

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.jaign = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker"];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  home-manager.users.jaign = {pkgs, ...}: {
    home.packages = apps.user;
    home.stateVersion = "23.11";

    nixpkgs.config = config.nixpkgs.config;

    services = import ./home/services.nix {};
    programs = import ./home/programs.nix {inherit pkgs;};
  };

  security.sudo.wheelNeedsPassword = false;
  environment.systemPackages = apps.system;

  system.stateVersion = "23.11";
  nix.settings.substituters = ["https://mirror.sjtu.edu.cn/nix-channels/store"];
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import srcs.unstable-nixpkgs {
        config = config.nixpkgs.config;
      };
      nur = import srcs.nur {inherit pkgs;};
    };
    permittedInsecurePackages = apps.insecure;
  };
}
