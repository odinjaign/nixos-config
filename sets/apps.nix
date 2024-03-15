{pkgs}:
with pkgs; {
  user = [
    # guis
    firefox
    unstable.google-chrome
    # others
    tree
    alejandra
    fishPlugins.tide
    vim
    wget
    alacritty
    atool
    httpie
    qq
    # pkgs.qq
  ];
  system = [neovim];
}
