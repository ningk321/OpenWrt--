#!/bin/bash


# Modify default IP
sed -i 's/192.168.1.1/192.168.1.4/g' package/base-files/files/bin/config_generate

# Themes 主题
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

##更改主机名
sed -i "s/hostname='.*'/hostname='Phicomm-N1'/g" package/base-files/files/bin/config_generate

# 更改 Argon 主题背景
cp -f $GITHUB_WORKSPACE/diy/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# replace banner
cp -f $GITHUB_WORKSPACE/diy/banner package/base-files/files/etc/banner

# alist
git clone https://github.com/sbwml/luci-app-alist package/alist

# vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr

# passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall

# adguardhome
svn co https://github.com/xiangfeidexiaohuo/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome

# 晶晨宝盒
svn co https://github.com/ysxhub888/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic

# 阿里云盘webdav
rm -rf feeds/luci/applications/luci-app-aliyundrive-webdav
rm -rf feeds/packages/multimedia/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav package/luci-app-aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav package/aliyundrive-webdav

# 科学上网插件依赖
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

# 调整alist到服务菜单
sed -i 's/nas/services/g' feeds/luci/applications/luci-app-alist/luasrc/controller/*.lua
sed -i 's/nas/services/g' feeds/luci/applications/luci-app-alist/luasrc/model/cbi/alist/*.lua
sed -i 's/nas/services/g' feeds/luci/applications/luci-app-alist/luasrc/view/alist/*.htm
