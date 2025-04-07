---
title: Go - Xorm框架名称映射
categories: Go
tags:
  - Go
  - Xorm
---




## 概述

记录下`Xorm框架`的名称映射规则，便于理解。


## 函数包安装

跟名称相关的函数包含在 `xorm.io/xorm/names` 下，可能需要单独安装。

```bash
go get -u xorm.io/xorm/names
```


## 名称映射规则

名称映射规则主要负责结构体名称到表名和结构体 field 到表字段的名称映射。

由 names.Mapper 接口的实现者来管理，xorm 内置了三种 Mapper 实现：

- `SnakeMapper` 支持struct为驼峰式命名，表结构为下划线命名之间的转换，这个是默认的Maper；
- `SameMapper` 支持结构体名称和对应的表名称以及结构体field名称与对应的表字段名称相同的命名；
- `GonicMapper` 和SnakeMapper很类似，但是对于特定词支持更好，比如ID会翻译成id而不是i_d。


> [!TIP]
> 注意下，SnakeMapper 是默认值，如果要改掉，在创建数据库初始化实例后
> 使用函数`Engine.SetMapper(xxx)`来修改


## 如何修改？

我一般喜欢使用`GonicMapper`，名称映射看起来比较正常，比如字段名字叫UserId，他会翻译为`user_id`，还有UUID会翻译为`uuid`。

在初始化`Engine`后即可设置，如下：

```go
package main

import (
	"xorm.io/xorm"
	"xorm.io/xorm/names"
)

func main() {
	var err error
    var Engine *xorm.Engine

	Engine, err = xorm.NewEngine("sqlite3", "./test.db")
	if err != nil {
		fmt.Println("实例化失败" + err.Error())
	}

	// 名称映射
	Engine.SetMapper(names.GonicMapper{})
}
```
