## 使用方法

#### 前置操作

参考 `profiles/system.nix` 提前配置代理和镜像站

#### 克隆本仓库到 /etc/nixos 目录

```bash
# 使用git和make环境
nix-shell -p git gnumake

# 备份原配置
sudo mv /etc/nixos /etc/nixos.bak

# 同步本仓库到 /etc/nixos
sudo git clone -b wsl https://github.com/odinjaign/nixos-config.git /etc/nixos

# 安装
cd /etc/nixos
make install
```