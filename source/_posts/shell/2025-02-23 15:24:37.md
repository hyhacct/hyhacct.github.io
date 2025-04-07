---
title: Shell - glances命令选项介绍
categories: Shell
tags:
  - Shell
---

# 概述

`glances` 命令是一个开源的跨平台系统监视工具，可以提供系统整体的资源使用情况、进程信息、网络流量、磁盘 I/O、内存使用情况等。


## 安装

> 请注意，如果使用的是系统的默认源可能是没有这个软件包的，可以尝试`更换清华源`或者其他源来搜索安装。

工具本身使用的是Python开发，安装使用也比较简单，如果需要安装，请按照如下操作：

```bash [CentOS]
yum install -y glances
```

```bash [Ubuntu/Debian]
apt install -y glances
```


## 使用

使用 `glances` 命令非常简单，只需要在命令行中输入 `glances` 即可，默认情况下，`glances` 会显示系统的整体信息，包括 CPU、内存、网络、磁盘、进程等。

但是这肯定不够的，我们需要更深入的了解这个工具，肯定要了解他有哪些选项，并且哪些选项的作用是什么，对吧？

下面来介绍下选项：


| 选项        |  用途 |
| ------------- | ----: |
| `-h` , `--help` | 显示帮助信息，列出所有可用的选项。 |
| `-V` , `--version` | 显示 glances 的版本信息。 |
| `-d` , `--debug` | 启用调试模式。 |
| `-t` , `--time` | 设置最小刷新间隔，单位为秒。 |
| `-w` , `--webserver` | 启用 Web UI 模式。 |
| `-p` , `--port` | 设置 Web UI 监听的端口。 |
| `-q` , `--quiet` | | 启用安静模式。 |
| `--disable-webui` | 禁用 Web 界面。 |
| `--disable-plugin` | 禁用指定的插件。 |
| `--enable-plugin` | 启用指定的插件。 |
| `--disable-process` | 禁用进程模块。 |
| `--disable-history` | 禁用历史记录模块。 |
| `--sort-processes` | 指定进程列表排序的标准。 |
| `--programs` | 以程序为单位累积进程信息。 |
| `--export` | 启用导出模块。 |
| `--export-json-file` | 将统计数据导出为 JSON 文件。 |
| `--stdout` | 将指定的统计信息输出到标准输出。 |
| `--stdout-csv` | 将指定的统计信息输出为 CSV 格式。 |
| `--hide-kernel-threads` | 隐藏内核线程。 |
| `--theme-white` | 启用白色主题。 |
| `--disable-check-update` | 禁用在线版本检查。 |
| `--disable-unicode` | 禁用 Unicode 字符。 |
| `--disable-left-sidebar` | 禁用左侧的侧边栏模块。 |
| `--disable-irq` | 禁用 IRQ 模块。 |
| `--disable-cursor` | 禁用 UI 中的光标。 |
| `--disable-bg` | 禁用背景颜色。 |
| `--disable-quicklook` | 禁用快速查看模块。 |
