{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    qq
    qv2ray
    microsoft-edge
    telegram-desktop
    tilda
    # spacedrive
    helix
    tree
    alejandra
    bilibili
    # citrix_workspace
    nix-output-monitor
  ];
}
