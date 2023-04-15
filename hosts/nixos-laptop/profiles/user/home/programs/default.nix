{...}: {
  imports = [
    ./zsh.nix
    ./git.nix
    ./vscode.nix
    ./alacritty
    # ./waybar # Need Wayland
  ];
}
