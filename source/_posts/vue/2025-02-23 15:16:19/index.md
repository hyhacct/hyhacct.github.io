---
title: Vue - vite.config.js配置介绍
categories: Vue
tags:
  - Vue
---



## 概述

vite.config.js 是 Vite 的配置文件，它是一个 CommonJS 模块，导出一个函数，接收一个参数 `defineConfig`，返回一个配置对象。

它可以配置许多选项，下面将列出每个选项的使用方法和注释。

```js
import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import path from 'path';

// https://vitejs.dev/config/
export default defineConfig({
  // 定义项目的根目录，通常是包含 index.html 的目录
  root: path.resolve(__dirname, './'),

  // 定义环境模式，可以是 'development' 或 'production'
  mode: 'development',

  // 定义基础路径，用于开发和生产环境
  base: '/',

  // 定义开发服务器的配置
  server: {
    // 定义开发服务器监听的端口，默认是 3000
    port: 3000,
    // 定义开发服务器监听的主机名，默认是 'localhost'
    host: 'localhost',
    // 是否开启 HTTPS，默认为 false
    https: false,
    // 开启代理，用于开发环境的 API 代理
    proxy: {
      '/api': {
        target: 'http://backend.server.com',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, '')
      }
    },
    // 是否开启服务器的热模块替换功能，默认为 true
    hmr: true
  },

  // 定义构建配置
  build: {
    // 定义输出目录
    outDir: 'dist',
    // 定义静态资源的输出目录
    assetsDir: 'assets',
    // 是否生成 source map 文件
    sourcemap: true,
    // 是否压缩输出的文件
    minify: 'terser',
    // 定义构建完成时的钩子函数
    onFinish: () => console.log('Build finished.'),
    // 定义构建过程中的钩子函数
    rollupOptions: {
      // Rollup 配置项，例如外部依赖
      external: ['react', 'react-dom']
    }
  },

  // 定义插件列表
  plugins: [
    vue({
      // Vue 插件的配置项
    })
  ],

  // 定义 CSS 相关配置
  css: {
    // 定义 CSS 预处理器的配置
    preprocessorOptions: {
      scss: {
        additionalData: `@import "@/styles/variables.scss";`
      }
    }
  },

  // 定义模块解析的配置
  resolve: {
    // 定义模块的别名
    alias: {
      '@': path.resolve(__dirname, './src')
    },
    // 定义模块解析时的扩展名
    extensions: ['.mjs', '.js', '.ts', '.jsx', '.tsx', '.json'],
    // 定义模块解析时的条目
    mainFields: ['browser', 'module', 'main']
  },

  // 定义环境变量的配置
  define: {
    'import.meta.env.VITE_APP_TITLE': 'My App'
  },

  // 定义优化配置
  optimizeDeps: {
    // 是否启用依赖预加载
    preload: true,
    // 手动指定需要预加载的依赖
    entries: ['react', 'react-dom']
  },

  // 定义实验性功能配置
  experimental: {
    // 启用或禁用某些实验性功能
    topLevelAwait: true
  },

  // 定义预配置的插件列表
  presets: [
    {
      // 预配置的名称
      name: 'my-preset',
      // 预配置的选项
      options: {
        // 预配置的详细选项
      }
    }
  ],

  // 定义预配置的插件列表
  extends: [
    {
      // 预配置的路径
      path: 'path/to/preset.js',
      // 预配置的选项
      options: {
        // 预配置的详细选项
      }
    }
  ],

  // 定义环境变量的目录
  envDir: path.resolve(__dirname, './env')
});
```
