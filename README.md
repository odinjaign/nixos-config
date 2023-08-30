
## 分区挂载
```bash
sudo parted /dev/sda -- mklabel gpt
sudo parted /dev/sda -- mkpart primary 512MB -1
sudo parted /dev/sda -- mkpart esp fat32 1MB 512MB
sudo parted /dev/sda -- set 2 esp on
sudo mkfs.ext4 -L nixos /dev/sda1
sudo mkfs.fat -F 32 -n boot /dev/sda2 
sudo mount /dev/disk/by-label/nixos /mnt
mount /dev/disk/by-label/boot /mnt/boot -m
```

## 部署
```bash
nix-shell -p git
# 直接使用仓库暂时不成功
# sudo nixos-install -vv --flake https://github.com/odinjaign/nixos-config#nixos-minimal-hyperv --option substituters "https://mirrors.ustc.edu.cn/nix-channels/store" 
git clone https://github.com/odinjaign/nixos-config
sudo nixos-install -vv --flake ./nixos-config#nixos-minimal-hyperv --option substituters "https://mirrors.ustc.edu.cn/nix-channels/store" 
```