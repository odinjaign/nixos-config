{ pkgs, ... } @ attrs:

{
  imports = [
    attrs.vscode-server.nixosModule
  ];

  services.vscode-server.enable = true;

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = "experimental-features = nix-command flakes";
  nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  system.stateVersion = "22.11";
}