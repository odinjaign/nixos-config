{pkgs, ...}: {
  xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.settings = {
      X11 = {
        ServerArguments = "-dpi 128";
      };
    };
    desktopManager.plasma5.enable = true;
    libinput.enable = true;
    layout = "cn";
    excludePackages = with pkgs; [xterm];
  };

  openssh = {
    enable = true;
  };

  printing = {
    enable = true;
  };

  xrdp = {
    enable = true;
    defaultWindowManager = "startplasma-wayland";
    openFirewall = true;
    package = pkgs.unstable.xrdp;
  };
}
