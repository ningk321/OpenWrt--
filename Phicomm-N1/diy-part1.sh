#!/bin/bash


# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

sed -i '$a src-git ysxhub https://github.com/ysxhub888/openwrt-packages' feeds.conf.default
