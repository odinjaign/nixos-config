{...}: {
  imports = [
    ./zsh.nix
    ./git.nix
    ./vscode.nix
    ./lsd.nix
    ./alacritty
    # ./waybar # Need Wayland
  ];
}
