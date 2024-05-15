#!/bin/bash

#修改默认IP地址
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.15.1/g" ./package/base-files/files/bin/config_generate

#删除冲突插件
#rm -rf $(find ./feeds/luci/ -type d -regex ".*\(argon\|design\|openclash\|passwall\|ssr-plus\).*")
rm -rf $(find ./feeds/luci/ -type d -regex ".*\(ddns-go\|openclash\|passwall\|alist\|ssr-plus\|easymesh\).*")

rm -rf package/istore
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 20.x feeds/packages/lang/golang
#修改默认主机名
sed -i "s/hostname='.*'/hostname='RAX3000M'/g" package/base-files/files/bin/config_generate

##-----------------Delete DDNS's examples-----------------
sed -i '/myddns_ipv4/,$d' feeds/packages/net/ddns-scripts/files/etc/config/ddns
##-----------------Manually set CPU frequency for MT7981B-----------------
sed -i '/"mediatek"\/\*|\"mvebu"\/\*/{n; s/.*/\tcpu_freq="1.3GHz" ;;/}' package/emortal/autocore/files/generic/cpuinfo


#修改默认时区
sed -i "s/timezone='.*'/timezone='CST-8'/g" ./package/base-files/files/bin/config_generate
sed -i "/timezone='.*'/a\\\t\t\set system.@system[-1].zonename='Asia/Shanghai'" ./package/base-files/files/bin/config_generate

##添加软件包
git clone https://github.com/messense/aliyundrive-webdav package/messense
git clone https://github.com/sirpdboy/luci-app-ddns-go package/luci-app-ddns-go
git clone https://github.com/lhbox1/luci-app-adguardhome1 package/luci-app-adguardhome
git clone https://github.com/shuishihan/luci-app-easymesh.git package/luci-app-easymesh

#alist
git clone https://github.com/lmq8267/luci-app-alist package/luci-app-alist

##
git clone https://github.com/linkease/istore package/nas-istore
git clone https://github.com/linkease/nas-packages.git package/nas-istore1
git clone https://github.com/linkease/nas-packages-luci.git package/nas-istore2
