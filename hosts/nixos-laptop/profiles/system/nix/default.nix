{...}: {
  nix.settings.substituters = ["https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "22.11";
  nixpkgs.config.allowUnfree = true;
}
