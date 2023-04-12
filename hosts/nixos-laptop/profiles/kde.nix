{...}:
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
}