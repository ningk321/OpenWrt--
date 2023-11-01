#!/bin/bash


# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git slim https://github.com/ysx88/slim-pkgs' feeds.conf.default
