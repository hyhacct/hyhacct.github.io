---
title: Go - Wails无边框窗口移动
categories: Go
tags:
  - Go
  - Wails
---


## 概述

在Wails开发中，有时候需要开发无边框的窗口，这会导致一个问题，就是窗口似乎没办法让他移动了。

## 解决

其实解决这个问题很简单，在官网的文档中有记录，只需要在需要移动的html元素上添加`--wails-draggable:drag`样式即可。

参考官网文档：[Wails - 无边框应用](https://wails.io/zh-Hans/docs/next/guides/frameless/)

代码示例：

```html
<template>

    <n-config-provider :theme="darkTheme">
        <n-dialog-provider>
            <div>
                <n-layout>
                    <n-layout-header style="--wails-draggable:drag">
                        <Header />
                    </n-layout-header>

                    <n-layout-content content-style=" padding: 24px;">
                        <router-view></router-view>
                    </n-layout-content>
                </n-layout>
            </div>
        </n-dialog-provider>
    </n-config-provider>

</template>
```


如上所示，我在`<n-layout-header>`元素上添加了`--wails-draggable:drag`样式，这样就可以实现窗口的移动了。

## 总结

其实解决这个问题很简单，只需要在需要移动的html元素上添加`--wails-draggable:drag`样式即可。
