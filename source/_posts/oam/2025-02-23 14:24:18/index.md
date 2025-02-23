---
title: 运维 - MySQL8.0开启多线程优化
categories: 运维
tags:
  - 运维
  - MySQL
---


## 概述

记录一下MySQL8.0开启多线程优化的过程。

## 修改配置文件

> 不要一次性将所有参数设置得过高，以免对系统造成不稳定。


MySQL 8.0开启多核多线程主要通过以下几个参数来配置：

`innodb_parallel_read_threads`: 这个参数控制InnoDB引擎并行读取线程的数量。增加这个值可以提高并行查询的性能。

`innodb_parallel_write_threads`: 这个参数控制InnoDB引擎并行写入线程的数量。增加这个值可以提高并行写入的性能。

`innodb_parallel_dml_threads`: 这个参数控制InnoDB引擎并行DML（数据操作语言）操作线程的数量。增加这个值可以提高并行更新、删除等操作的性能。


比如我的配置文件路径如下：

```
/etc/mysql/mysql.conf.d/mysqld.cnf
```

在配置文件中添加或修改以下内容：

```ini
[mysqld]
# ...其他配置
innodb_parallel_read_threads = 8
innodb_parallel_write_threads = 4
innodb_parallel_dml_threads = 2
```


## 重启MySQL服务

```zsh
systemctl restart mysqld
```
