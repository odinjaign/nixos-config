#!/usr/bin/env bash
set -euo pipefail

nix_repos=/nix/repos

[ -d "$nix_repos" ] || sudo mkdir -p $nix_repos && sudo chown $(id -u):$(id -g) $nix_repos

function clone_repo {
    local user=$1
    local repo=$2
    local branch=$3

    local repo_url="https://ghproxy.com/https://github.com/$user/$repo.git"
    local dist="$nix_repos/$user.$repo.$branch"

    [ -d $dist ] || {
        git clone -b $branch --depth 1 $repo_url $dist
    }
}

clone_repo NixOS            nixpkgs             nixos-unstable
clone_repo nix-community    home-manager        master
clone_repo nix-community    NixOS-WSL           main
clone_repo msteen           nixos-vscode-server master