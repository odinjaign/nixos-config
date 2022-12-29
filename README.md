## 使用方法

克隆本仓库到 /etc/nixos 目录

```bash
# 使用git和make环境
nix-shell -p git gnumake

# 同步本仓库到 /etc/nixos
cd /etc/nixos
git init
git remote add origin https://github.com/odinjaign/nixos-config.git
git remote update
git add .
git reset --hard
git checkout wsl

# 安装
make install
```