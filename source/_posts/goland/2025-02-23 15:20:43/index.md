---
title: Go - 随机字符串生成
categories: Go
tags:
  - Go
---



## 代码示例

代码可以直接CV使用，最终`generateRandomString`函数会输出一个指定长度的随机字符串

```go
package main

import (
    "fmt"
    "math/rand"
    "time"
)

// 生成指定长度的随机字符串
func generateRandomString(length int) string {
    // 设置随机种子
    rand.NewSource(time.Now().UnixNano())

    // 定义包含字母和数字的字符集 (例如你只要想生成数字，可以把字母全部删掉)
    charSet := "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    result := make([]byte, length)
    for i := range result {
        result[i] = charSet[rand.Intn(len(charSet))]
    }

    return string(result)
}

func main() {
    for i := 1; i < 5; i++ {
        s := generateRandomString(i * 5)
        fmt.Println(s)
    }
}
```