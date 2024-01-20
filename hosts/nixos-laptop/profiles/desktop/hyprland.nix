# 不可用
{
  hyprland,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true;
  programs.hyprland.package = hyprland.packages.${pkgs.system}.hyprland;
}
