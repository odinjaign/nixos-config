{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      editorconfig.editorconfig
      ms-ceintl.vscode-language-pack-zh-hans
      pkief.material-icon-theme
      kamadorueda.alejandra
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      # arrterian.nix-env-selector
      ms-vscode-remote.remote-containers
    ];
    userSettings = {
      "window.dialogStyle" = "custom";
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Droid Sans Mono', 'monospace', monospace";
    };
  };
}
