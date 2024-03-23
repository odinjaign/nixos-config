{pkgs, ...}: {
  vscode = {
    enable = true;
    package = pkgs.unstable.vscode;
    extensions = with pkgs.unstable.vscode-extensions; [
      bbenoist.nix
      kamadorueda.alejandra
      ms-ceintl.vscode-language-pack-zh-hans
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      ms-vscode-remote.remote-containers
    ];
    userSettings = {
      "files.autoSave" = "off";
      "[nix]" = {
        "editor.tabSize" = 2;
      };
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "window.dialogStyle" = "custom";
      "window.titleBarStyle" = "custom";
    };
  };

  ssh = {
    enable = true;
    userKnownHostsFile = "/dev/null";
  };

  git = {
    enable = true;
    userName = "odinjaign";
    userEmail = "jaign@outlook.com";
  };

  git-credential-oauth = {
    enable = true;
  };
}
