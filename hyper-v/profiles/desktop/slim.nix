{ ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [ "fbdev" ];
    displayManager.gdm.enable = true;
    windowManager.i3.enable = true;
    # have i3 open terminology instead of default xterm
    windowManager.i3.extraSessionCommands = "bindsym $mod+Return exec terminology";
  };

}
