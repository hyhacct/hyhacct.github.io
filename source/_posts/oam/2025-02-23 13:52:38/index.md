---
title: 运维 - 浪潮服务器切换UEFI到Legacy模式
categories: 运维
tags:
  - 运维
  - 浪潮
---

## 概述

重启服务器，进入BIOS

* 进入到BIOS中，选中`Advanced`选项。
* 在下面找到`CSM Configuration`选项。
* 按下回车展开该选项。

![001](/images/008.png)


## 切换Boot Mode

* 将Boot Mode切换到`Legacy Mode`。
* 包括下面的几个选项一起设置：

![002](/images/009.png)


## 最后长这样

修改完成后别忘记保存BIOS设置，然后重启服务器即可！

![003](/images/010.png)


