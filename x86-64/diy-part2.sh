#!/bin/bash


# Modify default IP
sed -i 's/192.168.1.1/192.168.1.3/g' package/base-files/files/bin/config_generate

# Themes 主题
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

##更改主机名
sed -i "s/hostname='.*'/hostname='TIAmo'/g" package/base-files/files/bin/config_generate

# 更改 Argon 主题背景
cp -f $GITHUB_WORKSPACE/diy/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# replace banner
cp -f $GITHUB_WORKSPACE/diy/banner package/base-files/files/etc/banner
