#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#


#luci-app-vssr[Hello World]项目 
 
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb  #git lua-maxminddb 依赖
git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr

#OpenClash项目
#库超容量，无法编译
#mkdir package/luci-app-openclash
#cd package/luci-app-openclash
#git init
#git remote add -f origin https://github.com/vernesong/OpenClash.git
#git config core.sparsecheckout true
#echo "luci-app-openclash" >> .git/info/sparse-checkout
#git pull origin master
#git branch --set-upstream-to=origin/master master
#cd ../..

## 下载OpenClash
wget https://github.com/vernesong/OpenClash/archive/master.zip
## 解压
unzip master.zip
## 复制OpenClash软件包到OpenWrt
cp -r OpenClash-master/luci-app-openclash package


# 删除自定义源默认的 argon 主题
rm -rf package/lean/luci-theme-argon

# 部分第三方源自带 argon 主题，上面命令删除不掉的请运行下面命令
#find ./ -name luci-theme-argon | xargs rm -rf;

# 针对 LEDE 项目拉取 argon 原作者的源码
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

## 下载luci-app-argon-config
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config

# 替换默认主题为 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.0.113/g' package/base-files/files/bin/config_generate
