{pkgs, ...}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.libinput.enable = true;
  services.xserver.excludePackages = with pkgs; [xterm];
  services.xserver.layout = "cn";
  # services.xserver.videoDrivers = ["nvidia"]

  services.xserver.displayManager.sddm.enable = true;
  # services.xserver.displayManager.sddm.settings.X11.ServerArguments = "-dpi 100";
  services.xserver.desktopManager.plasma5.enable = true;

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    # konsole
    plasma-browser-integration
    print-manager
  ];
}
