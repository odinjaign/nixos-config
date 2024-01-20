{pkgs, ...}: {
  imports = [
    ./docker.nix
  ];
  environment.systemPackages = with pkgs; [
    vim
    wget
  ];
}
