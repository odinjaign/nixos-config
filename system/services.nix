{pkgs, ...}: {
  xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.settings = {
      X11 = {
        ServerArguments = "-dpi 192";
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
}
