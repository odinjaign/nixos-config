{self-options, ...}: {
  nix.settings.substituters = ["https://mirror.sjtu.edu.cn/nix-channels/store"];
  nix.settings.trusted-users = ["root" "${self-options.username}"];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc.automatic = false;
  system.stateVersion = "unstable";

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
      "electron-19.1.9"
    ];
  };
}
