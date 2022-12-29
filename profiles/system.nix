{ pkgs, ... }:

{
  # System Proxy
  networking.proxy.default = "http://192.168.31.188:7890";
  networking.proxy.noProxy = "127.0.0.1,localhost";

  # Use Tuna Mirror
  nix.settings.substituters =
    [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "22.11";

}
