#!/bin/bash


# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

sed -i '$a src-git pkgs https://github.com/ysx88/openwrt-packages' feeds.conf.default
