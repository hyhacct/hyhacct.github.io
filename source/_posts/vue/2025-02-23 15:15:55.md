---
title: Vue - 实现本地存储localStorage
categories: Vue
tags:
  - Vue
---



## 代码示例

简单写了一下，主要看script代码块部分即可，localStorage的操作。

```vue
<script setup>

// 存储localStorage
localStorage.setItem('name', "1");
localStorage.setItem('value', "2");

// 获取localStorage
const name = localStorage.getItem('name');
const value = localStorage.getItem('value');

</script>
```