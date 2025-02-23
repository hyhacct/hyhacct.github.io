---
title: Shell - 三剑客awk篇
categories: Shell
tags:
  - Shell
---

# 概述

发明awk的人真是个天才。


## 用法介绍


现在假设我们有这么一个文件，叫`file.txt`，内容如下：

然后我们来使用awk处理他，实现各种功能。

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


## 取指定列及最后一列

关键在于`$2`和`$NF`，`$2`表示第二列，`$NF`表示最后一列。

```bash
awk '{print $2,$NF}' file.txt
```

```txt
PID COMMAND
1 splash
2 [kthreadd]
3 [rcu_gp]
4 [rcu_par_gp]
6 [kworker/0:0H-events_highpri]
9 [mm_percpu_wq]
10 [rcu_tasks_rude_]
11 [rcu_tasks_trace]
12 [ksoftirqd/0]
```

## 条件匹配

我们只需要过滤出带有`rcu`关键字的行，并且取PID和COMMAND列。

```bash
awk '/rcu/ {print $1,$NF}' file.txt
```
```txt
root [rcu_gp]
root [rcu_par_gp]
root [rcu_tasks_rude_]
root [rcu_tasks_trace]
```


## 求和

使用awk的变量`sum`来累加PID列的值，并且使用`END`关键字来输出结果。

```bash
awk '{sum+=$2} END {print sum}' file.txt
```
```txt
58
```


## 条件判断

这里我们做个简单的判断，只输出CPU占用为0的进程

```bash
awk '{ 
    if ($3 <= 0) { 
        print $0
    } 
}' file.txt
```

```txt
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           2  0.0  0.0      0     0 ?        S     2024   0:09 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<    2024   0:00 [rcu_gp]
root           4  0.0  0.0      0     0 ?        I<    2024   0:00 [rcu_par_gp]
root           6  0.0  0.0      0     0 ?        I<    2024   0:00 [kworker/0:0H-events_highpri]
root           9  0.0  0.0      0     0 ?        I<    2024   0:00 [mm_percpu_wq]
root          10  0.0  0.0      0     0 ?        S     2024   0:00 [rcu_tasks_rude_]
root          11  0.0  0.0      0     0 ?        S     2024   0:00 [rcu_tasks_trace]
```


## 循环输出

```bash
awk '{
    for (i = 1; i <= NF; i++) {
        for (j = 1; j <= NF; j++) {
            print "Element at (" i "," j "): " $i
        }
    }
}' file.txt
```

```txt
内容太长，不做展示，可以尝试自行执行看看效果
```
