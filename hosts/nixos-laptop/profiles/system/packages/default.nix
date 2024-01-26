{
  config,
  pkgs,
  ...
}: let
  nur = config.nur;
in {
  imports = [
    ./docker.nix
  ];
  environment.systemPackages = with pkgs; [
    vim
    wget

    nur.repos.mic92.hello-nur
    nur.repos.rewine.electron-netease-cloud-music
    # nur.repos.xddxdd.wechat-uos
  ];
}
