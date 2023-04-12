#!/usr/bin/env bash

home_manager_url="https://ghproxy.net/https://github.com/nix-community/home-manager/archive/28698126bd825aff21cae9ffd15cf83e169051b0.tar.gz"
project_dir=$(dirname $(dirname $(realpath $0)))

if [ ! -f $HOME/.nix-profile/bin/nix ];
then
  echo "==== Install Nix Start"
  sh <(curl https://mirrors.tuna.tsinghua.edu.cn/nix/latest/install) --yes --no-channel-add --no-modify-profile  
  . $HOME/.nix-profile/etc/profile.d/nix.sh
  nix-channel --add https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixpkgs-unstable nixpkgs
  nix-channel --update
  mkdir -p $HOME/.config/nix/
  echo "experimental-features = nix-command flakes" >> $HOME/.config/nix/nix.conf
  echo "substituters = https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" >> $HOME/.config/nix/nix.conf
  echo "==== Install Nix End"
fi

if [ ! -f $HOME/.nix-profile/bin/home-manager ];
then
  echo "==== Install Home-Manager Start"
  nix-shell $home_manager_url -A install
  home-manager switch --flake $project_dir -b bak
  echo "==== Install Home-Manager End"
fi
