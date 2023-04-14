{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    qq
    qv2ray
    microsoft-edge
    tilda
    helix
    tree
  ];
}
