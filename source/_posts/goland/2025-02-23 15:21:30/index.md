---
title: Go - Base64编码解码
categories: Go
tags:
  - Go
---


## 代码示例

```go
package main

import (
	"encoding/base64"
	"fmt"
)

func main() {
	// 原始数据
	data := "Hello, Golang!"

	// base64 编码
	encoded := base64.StdEncoding.EncodeToString([]byte(data))
	fmt.Printf("Base64 编码: %s\n", encoded)

	// base64 解码
	decoded, err := base64.StdEncoding.DecodeString(encoded)
	if err != nil {
		fmt.Println("解码失败:", err)
		return
	}
	fmt.Printf("Base64 解码: %s\n", decoded)
}

```