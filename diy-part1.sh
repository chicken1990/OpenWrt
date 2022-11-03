#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git jerryk https://github.com/jerrykuku/openwrt-package' >>feeds.conf.default 
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git kiddin https://github.com/kiddin9/openwrt-packages' feeds.conf.default
./scripts/feeds clean
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


git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config
 
