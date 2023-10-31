#!/bin/bash


# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

sed -i '$a src-git Jejz https://github.com/Jejz168/openwrt-packages' feeds.conf.default
