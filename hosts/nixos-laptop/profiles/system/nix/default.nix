{self-options, ...}: {
  nix.settings.substituters = ["https://mirror.sjtu.edu.cn/nix-channels/store"];
  nix.settings.trusted-users = ["root" "${self-options.username}"];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc.automatic = false;
  system.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;
}
