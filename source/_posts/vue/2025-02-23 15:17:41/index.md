---
title: Vue - Pinia状态管理
categories: Vue
tags:
  - Vue
---


# 概述

如下


## 安装

安装软件

```bash [npm]
npm install pinia
```

```bash [yarn]
yarn add pinia
```


## 基本配置

```js
import { defineStore } from "pinia";

export const useStoreUser = defineStore("useStoreUser", {
    state: () => {
        return {
            loading: false,
            form: {
                username: '',
                password: '',
            }
        };
    },
});
```
