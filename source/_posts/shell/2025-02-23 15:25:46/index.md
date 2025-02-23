---
title: Shell - 三剑客grep篇
categories: Shell
tags:
  - Shell
---

# 概述

发明grep的人真是个天才。


## 用法介绍

现在假设我们有这么一个文件，叫`file.txt`，内容如下：

```
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.9  0.0  23444 10740 ?        Ss    2024 273:27 /sbin/init noats splash
root           2  0.0  0.0      0     0 ?        S     2024   0:09 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<    2024   0:00 [rcu_gp]
root           4  0.0  0.0      0     0 ?        I<    2024   0:00 [rcu_par_gp]
root           6  0.0  0.0      0     0 ?        I<    2024   0:00 [kworker/0:0H-events_highpri]
root           9  0.0  0.0      0     0 ?        I<    2024   0:00 [mm_percpu_wq]
root          10  0.0  0.0      0     0 ?        S     2024   0:00 [rcu_tasks_rude_]
root          11  0.0  0.0      0     0 ?        S     2024   0:00 [rcu_tasks_trace]
root          12  3.8  0.0      0     0 ?        S     2024 1117:46 [ksoftirqd/0]
```

## 正则表达式

正则
