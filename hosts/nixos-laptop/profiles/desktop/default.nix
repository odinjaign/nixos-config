{pkgs, ...}:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver = {
    layout = "cn";
    xkbVariant = "";
    # videoDrivers = [ "nvidia" ];
  };
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
