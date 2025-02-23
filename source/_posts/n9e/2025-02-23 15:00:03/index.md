---
title: 夜莺 - 自定义上报数据
categories: 夜莺
tags:
  - 夜莺
---




# 概述

简单说下，夜莺自带的插件非常全面，并且非常容易上手，这一点非常棒。

但是夜莺自带的插件和指标不一定就完全可以满足我们的需求，也许我们希望自己开发采集器，或者使用脚本来采集一些数据并且上报为指标来满足自己的需求。

很巧的是夜莺有一个插件支持这个玩法，就是 `input.exec` ，支持执行本地脚本获取数据，并且上报为指标。

## input.exec 插件

这是一个非常强大的插件，它可以指定本地的一个或者多个脚本文件，并且周期性的执行这些脚本获取脚本的输出，然后上报为指标。

来看下配置文件内容先：

```ini
# # collect interval
# interval = 15

[[instances]]
# # commands, support glob
commands = [
#     "/opt/categraf/scripts/*.sh"
]

# # timeout for each command to complete
timeout = 5

# # interval = global.interval * interval_times
interval_times = 1

# # choices: influx prometheus falcon
# # influx stdout example: mesurement,labelkey1=labelval1,labelkey2=labelval2 field1=1.2,field2=2.3
data_format = "falcon"
```

我来介绍下这里面的参数

1. `commands`：指定脚本文件路径，可以是绝对路径，也可以是相对路径，支持通配符，并且可以写多个脚本。
2. `timeout`：指定每个脚本的执行超时时间，默认是 5 秒。
3. `interval_times`：指定脚本执行的间隔次数，默认是 1 次。
4. `data_format`：指定上报数据的格式，目前支持 `influx` 和 `prometheus` 以及 `falcon` 三种格式。
5. `interval`：指定插件的采集间隔，默认是 15 秒。


> 需要注意一下，这里的`data_format`数据格式是有说法的，具体参考一下官网提供的说明。[> 传送门 <](https://flashcat.cloud/docs/content/flashcat-monitor/categraf/plugin/exec/)


## 数据示例

作为示例，我来操作一下如何使用`falcon格式`上报数据。

假设我们有一个脚本文件 `test.sh` 内容如下：

```bash
#!/usr/bin/env bash

{
    # 采集标签（事实上你应该用命令去采集，我这做演示就先随便填充了）
    _item_sn="abcd"                   # 设备序列号
    _item_model="Dell R740"           # 设备型号
    _item_cpu="Intel Xeon E5-2650 v4" # CPU型号

    # 构建tags标签组
    _item_tags="sn=$_item_sn,model=$_item_model,cpu=$_item_cpu"

    _metric="m_system_info"

    # 构建子结构
    _json_item='
    {
        "endpoint": "line_info",
        "metric": "'"$_metric"'",
        "value": 1,
        "tags": "'"$_item_tags"'"
    }'

    # 定义主结构，并且将item结构加入其中
    _json_body="[]"
    _json_body=$(echo "$_json_body" | jq -c --argjson item "$_json_item" '. + [$item]')

    echo "$_json_body" | jq
}
```


脚本输出内容如下：

```json
[
  {
    "endpoint": "line_info",
    "metric": "m_system_info",
    "value": 1,
    "tags": "sn=abcd,model=Dell R740,cpu=Intel Xeon E5-2650 v4"
  }
]
```

那么这个时候，`m_system_info`就已经作为一个指标上报到你的夜莺了。

你可以前往夜莺的`时序指标`的`即时查询`里面去搜索这个指标，然后就可以看到这个指标的具体数据了。

## 总结

通过 `input.exec` 插件，我们可以通过自己编写脚本采集本地数据，并且自定义输出上报指标，这样就可以很方便的监控到我们的服务器的一些状态信息。

这对于我们自己开发一些监控脚本或者采集脚本来说，是非常有用的。
