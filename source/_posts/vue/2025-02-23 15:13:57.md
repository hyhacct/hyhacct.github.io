---
title: Vue - Vue二次封装Axios
categories: Vue
tags:
  - Vue
---


## 官方文档

- [Axios](https://www.axios-http.cn/docs/intro)



## 操作步骤

1. cd到项目根目录下，安装Axios包。

```bash [npm]
npm install axios
```

```bash [yarn]
yarn add axios
```

1. 在项目根目录下创建`api`目录(名字请随意)，并在其中创建`index.js`文件，用于进行二次封装。
2. 在`index.js`文件中，引入Axios包，并进行封装，如下所示

```js
import axios from "axios";
import router from "@/router/index";


// 二次封装axios;
const service = axios.create({
    baseURL: "http://localhost:9099/api/v1", // 基础 URL
    timeout: 5000, // 请求超时时间
});


// const service = axios.create({
//     baseURL: "/api/v50", // 基础 URL
//     timeout: 5000, // 请求超时时间
// });


// 添加响应拦截器
service.interceptors.response.use(function (response) {
    // 2xx 范围内的状态码都会触发该函数。
    // 对响应数据做点什么
    return response;
}, function (error) {

    console.log(error);

    // 超出 2xx 范围的状态码都会触发该函数。
    // 对响应错误做点什么
    // if (error.response.status === 401) {
    //     // 401 未授权
    //     router.push('/');
    //     message.error(error.response.data.msg);
    // }

    return Promise.reject(error);
});



export default service;
```

