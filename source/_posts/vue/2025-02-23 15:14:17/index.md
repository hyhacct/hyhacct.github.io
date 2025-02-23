---
title: Vue - 从对象中取值
categories: Vue
tags:
  - Vue
---



## 代码示例

只传入一个row参数，如果row等于1，返回"Success"，等于2，返回"Warning"，等于3，返回"Error"，否则返回"Unknown"。

```js
const IterateState = (row) => {
    const state = {
        "1": "Success",
        "2": "Warning",
        "3": "Error",
    };
    return state[row] || "Unknown"; // 如果 row 不在对象中，返回 "Unknown"
}
```
