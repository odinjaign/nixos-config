{ pkgs, config, modulesPath, ... } @ attrs:

{
  imports = [
    attrs.nixos-wsl.nixosModules.wsl
    attrs.vscode-server.nixosModule
  ];

  services.vscode-server.enable = true;

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "nixos";
    startMenuLaunchers = true;
    nativeSystemd = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

  };

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = "experimental-features = nix-command flakes";
  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  system.stateVersion = "22.11";
}