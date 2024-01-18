{
  pkgs,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      import = [./alacritty.toml];
      font = {size = 12.0;};
      shell = {
        program = lib.getExe pkgs.zsh;
      };
    };
  };
}
