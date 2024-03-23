{pkgs}:
with pkgs; {
  user = [
    # guis
    # unstable.firefox
    unstable.google-chrome
    unstable.telegram-desktop
    unstable.bilibili
    # nur.repos.xddxdd.wechat-uos # error
    # unstable.clash-nyanpasu
    qq
    # others
    tree
    alejandra
    fishPlugins.tide
    vim
    wget
    alacritty
    atool
    httpie
    # pkgs.qq
  ];
  system = [neovim];
  insecure = [
    "openssl-1.1.1w"
    "electron-19.1.9"
  ];
}
