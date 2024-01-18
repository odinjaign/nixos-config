{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    qq
    qv2ray
    # microsoft-edge
    telegram-desktop
    tilda

    helix
    tree
    alejandra
  ];
}
