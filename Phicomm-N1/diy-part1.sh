#!/bin/bash


# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

sed -i '$a src-git silm https://github.com/ysx88/silm-pkgs' feeds.conf.default
