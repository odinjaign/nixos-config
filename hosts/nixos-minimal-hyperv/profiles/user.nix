{ inputs, user, pkgs, ... }:
let
  sshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDhmSdP4sVoCQy7I72E4LBg77WA0dZYeUQHNOlNnD0M6";
  hashPassword = "$y$j9T$DiS4wHav8YWF1DHqin76n0$FLnuLHwJAWwXKAjVDm80vu9LaOpyG.s9MNZvLobnhvA";
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  programs.zsh.enable = true;
  users.mutableUsers = false;
  users.users.root.openssh.authorizedKeys.keys = [ sshPublicKey ];
  users.users.${user} = {
    openssh.authorizedKeys.keys = [ sshPublicKey ];
    hashedPassword = hashPassword;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit user; };
    users.${user} = {
        imports = [ ./home/${user}.nix ];
        home.stateVersion = "23.05";
    };
  };
  
}