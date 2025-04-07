---
title: 运维 - 清理Linux下的虚拟软盘
categories: 运维
tags:
  - 运维
---

## 概述

虚拟软盘可以使用`lsscsi`命令来查看，如下输出:

```txt
root@localhost:~# lsscsi
[10:2:0:0]   disk    DELL     PERC H730 Mini   4.25  /dev/sda 
[10:2:1:0]   disk    DELL     PERC H730 Mini   4.25  /dev/sdb 
[11:0:0:0]   cd/dvd  iDRAC    Virtual CD       0329  /dev/sr0 
[11:0:0:1]   disk    iDRAC    Virtual Floppy   0329  /dev/sdq 
root@localhost:~# 
```

其中，`/dev/sdq`是虚拟软盘，`/dev/sr0`是虚拟光驱。


## 如何清理

> 请注意，以下方式只能用于临时清理，重启后虚拟硬盘会自动重新出现。
> 有时候如果不清理掉这两个设备，可能会导致`blkid`命令执行卡死


要临时清理掉这些虚拟硬盘，可以使用以下脚本：

```bash
yum -y install lsscsi
# or
apt -y install lsscsi
```

```bash
{
    _disk=$(lsscsi | grep '\sVirtual' | awk -F '/' '{print $NF}' | sed -r 's/\s//g')
    IFS=$'\n'
    for item in ${_disk}; do
        echo 1 | sudo tee "/sys/block/$item/device/delete"
    done
    lsscsi
}
```
