{pkgs, ...}: {
  
  programs = {
  
    git = {
      enable = true;
      userName = "jaign";
      userEmail = "jaign@outlook.com";
    };

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      oh-my-zsh = {
        enable = true;
        theme = "ys";
        plugins = [ "git" "sudo" ];
      };
    };

    lsd = {
      enable = true;
      enableAliases = true;
      settings.icons.theme = "unicode";
    };
  
  };

}
