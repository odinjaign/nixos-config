{...}: {
  imports = [
    ./common/zsh.nix
    ./common/git.nix
    ./common/vscode.nix
    ./common/lsd.nix
    ./alacritty
    # ./waybar # Need Wayland
  ];
}
