#!/bin/bash

#更改默认地址为192.168.6.1
sed -i 's/192.168.1.1/192.168.15.1/g' package/base-files/files/bin/config_generate

##添加软件包
git clone https://github.com/lhbox1/luci-app-adguardhome package/luci-app-adguardhome
git clone https://github.com/shuishihan/luci-app-easymesh.git package/feeds/luci/luci-app-easymesh
