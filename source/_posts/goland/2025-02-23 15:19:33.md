---
title: Go - 彩色日志
categories: Go
tags:
  - Go
---




# 准备工作

在使用Go语言进行开发时，我们经常需要打印一些信息，比如成功、失败、警告、提示等等，Go语言内置的`fmt`包提供了一些打印信息的方法，但是这些方法并不能很好地显示颜色，因此我们需要自己实现一些打印颜色的方法。

下面是我自己实现的一些打印颜色的方法，可以根据需要选择使用。但是需要依赖于 `"github.com/gookit/color"` 包，需要先安装。

```zsh
$ go get -u github.com/gookit/color
```


安装完成后，我们可以定义一个 `ui` 包，里面包含一些打印颜色的方法。

# 目录结构

具体目录结构如下：

```text
╭─root@master /temp/go 
╰─# tree
.
├── cmd
│   └── main.go
├── demo.txt
├── go.mod
├── go.sum
└── ui
    └── print.go

3 directories, 5 files
╭─root@master /temp/go 
╰─# 
```


# 文件内容

我们首先在ui目录下新建一个 `print.go` 文件，其内容如下：

```go
package ui

import (
	"fmt"

	"github.com/gookit/color"
)

// PrintSuccess 输出成功色字体
func PrintSuccess(msg string) {
	outPut(msg, color.FgGreen.Render("Success"))
}

// PrintError 输出失败色字体
func PrintError(msg string) {
	outPut(msg, color.FgRed.Render("Error"))
}

// PrintWarning 输出警告色字体
func PrintWarning(msg string) {
	outPut(msg, color.FgYellow.Render("Warning"))
}

// PrintInfo 输出提示色字体
func PrintInfo(msg string) {
	outPut(msg, color.FgCyan.Render("Info"))
}

// 最终输出
func outPut(msg string, header string) {
	normal := color.FgDefault.Render

	color.Println(fmt.Sprintf("[%s] %s", header, normal(msg)))
}

```

接着在需要输出彩色日志的相关文件中引入 `ui` 包，然后调用相关方法打印颜色字体即可，例如我在 `main.go` 文件中引入 `ui` 包，并调用相关方法打印颜色字体，具体内容如下：

```go
package main

import "test/ui"

func main() {
	ui.PrintInfo("Hello World!")
	ui.PrintSuccess("Hello World!")
	ui.PrintError("Hello World!")
	ui.PrintWarning("Hello World!")
}

```

以上代码运行后，即可正常输出彩色日志。
