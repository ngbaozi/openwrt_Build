#!/bin/bash

# ============================================
# LEDE OpenWrt 自定义配置脚本
# 默认 IP: 192.168.1.253
# ============================================

set -e

# 克隆源码目录
OPENWRT_ROOT="$PWD"

echo "========================================="
echo "开始自定义配置..."
echo "========================================="

# 修改默认 IP 为 192.168.1.253
echo "修改默认 IP 地址..."
sed -i 's/192.168.1.1/192.168.1.253/g' package/base-files/files/bin/config_generate

# 修改默认主机名
sed -i 's/OpenWrt/Lede/g' package/base-files/files/bin/config_generate

# 修改默认密码为空（或设置为 password）
# sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDDBCqXF.::0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings

# ============================================
# 添加第三方插件源
# ============================================

echo "添加第三方插件源..."

# PassWall 源
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/passwall-packages

# SSR Plus+ 源
git clone --depth=1 https://github.com/fw876/helloworld package/helloworld

# AdGuard Home
git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome

# MosDNS
git clone --depth=1 https://github.com/sbwml/luci-app-mosdns package/mosdns

# OpenList
git clone --depth=1 https://github.com/sirpdboy/openlist package/openlist

# Turbo ACC 网络加速
git clone --depth=1 https://github.com/sirpdboy/luci-app-turboacc package/turboacc

# FileBrowser
git clone --depth=1 https://github.com/sirpdboy/luci-app-filebrowser package/filebrowser

# SyncDial (多拨)
git clone --depth=1 https://github.com/sirpdboy/luci-app-syncdial package/syncdial

# AP Modem
git clone --depth=1 https://github.com/sirpdboy/luci-app-ap-modem package/ap-modem

# Broadband ACC
git clone --depth=1 https://github.com/sirpdboy/luci-app-broadbandacc package/broadbandacc

# FastNet
git clone --depth=1 https://github.com/sirpdboy/luci-app-fastnet package/fastnet

# Samba4
git clone --depth=1 https://github.com/sirpdboy/luci-app-samba4 package/samba4

# UU Game Booster
git clone --depth=1 https://github.com/sirpdboy/luci-app-uugamebooster package/uugamebooster

# Unblock NetEase Music
git clone --depth=1 https://github.com/sirpdboy/luci-app-unblockneteasemusic package/unblockneteasemusic

# AdByBy Plus
git clone --depth=1 https://github.com/sirpdboy/luci-app-adbyby-plus package/adbyby-plus

# Argon 主题
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

# MWAN3 (LEDE 自带，但确保配置正确)
# git clone --depth=1 https://github.com/coolsnowwolf/lede/tree/master/package/lean/luci-app-mwan3 package/mwan3

echo "========================================="
echo "插件源添加完成！"
echo "========================================="

# ============================================
# 添加预配置（可选）
# ============================================

# 创建自定义配置文件目录
mkdir -p files/etc/config

# 设置默认时区
echo "设置默认时区..."
sed -i 's/timezone="UTC"/timezone="CST-8"/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/timezonename="UTC"/timezonename="CST-8"/g' package/lean/default-settings/files/zzz-default-settings

echo "========================================="
echo "自定义配置完成！"
echo "========================================="
