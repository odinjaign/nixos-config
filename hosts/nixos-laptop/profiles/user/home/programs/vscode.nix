{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      editorconfig.editorconfig
      ms-ceintl.vscode-language-pack-zh-hans
      pkief.material-icon-theme
      kamadorueda.alejandra
    ];
  };
}
