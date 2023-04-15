{...}: {
  nix = {
    settings = {
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        # "https://mirror.sjtu.edu.cn/nix-channels/store"
        # "https://rewine.cachix.org"
        # "https://cache.garnix.io"
      ];
      # trusted-public-keys = [
      #   "rewine.cachix.org-1:aOIg9PvwuSefg59gVXXxGIInHQI9fMpskdyya2xO+7I="
      #   "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      # ];
      trusted-users = ["root" "jaign"];
      experimental-features = ["nix-command" "flakes"];
    };
  };
  nix.gc.automatic = false;
  system.stateVersion = "22.11";
  nixpkgs.config.allowUnfree = true;
}
