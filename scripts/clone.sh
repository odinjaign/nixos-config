#!/usr/bin/env bash

[ -d /flakes ] || sudo mkdir /flakes && sudo chown $(id -u):$(id -g)  /flakes

# Download /flakes

function clone_repo {
    local repo=$1
    local branch=$2
    local dist=$3

    [ -d $dist ] || {
        git clone -b $branch --depth 1 $repo $dist
    }
}

clone_repo https://github.com/NixOS/nixpkgs.git nixos-unstable /flakes/nixpkgs
clone_repo https://github.com/nix-community/home-manager.git master /flakes/home-manager
clone_repo https://github.com/nix-community/NixOS-WSL.git main /flakes/NixOS-WSL
clone_repo https://github.com/msteen/nixos-vscode-server.git master /flakes/nixos-vscode-server
