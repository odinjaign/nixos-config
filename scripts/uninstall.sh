#!/usr/bin/env bash

project_dir=$(dirname $(dirname $(realpath $0)))

echo "==== Uninstall Nix Start"
if [ -f $HOME/.nix-profile/bin/home-manager ];
then
  home-manager uninstall --flake $project_dir
fi
rm -rf /nix
rm -rf $HOME/.nix-channels $HOME/.nix-defexpr $HOME/.nix-profile
rm -rf $HOME/.config/home-manager $HOME/.config/nix
rm -rf $HOME/.local/state
echo "==== Uninstall Nix End"
