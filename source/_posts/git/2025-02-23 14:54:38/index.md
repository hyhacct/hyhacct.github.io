---
title: Git - 初始化远程仓库
categories: Git
tags:
  - Git
---




# 概述

其实这个命令在新建仓库的时候就会提供给你，不过放在这里我感觉更好找


## 简单的脚本

可以直接运行

```bash
#!/usr/bin/env bash

# shellcheck disable=SC2162

{
    # 仓库地址
    while true; do
        read -p "git address: " _input_git_address
        [ -n "$_input_git_address" ] && break
    done

    # 分支
    while true; do
        read -p "git branch: " _input_git_branch
        [ -n "$_input_git_branch" ] && break
    done

    touch README.md
    git init
    git checkout -b "$_input_git_branch"
    git add README.md
    git commit -m "first commit"
    git remote add origin "$_input_git_address"
    git push -u origin "$_input_git_branch"
}
```


## ssh

从命令行创建一个新的仓库

```bash
touch README.md
git init
git checkout -b main
git add README.md
git commit -m "first commit"
git remote add origin ssh://git@demo.com/shell.git
git push -u origin main
```

从命令行推送已经创建的仓库

```bash
git remote add origin ssh://git@demo.com/shell.git
git push -u origin main
```



## http

从命令行创建一个新的仓库

```bash
touch README.md
git init
git checkout -b main
git add README.md
git commit -m "first commit"
git remote add origin https://demo.com/shell.git
git push -u origin main
```


从命令行推送已经创建的仓库

```bash
git remote add origin https://demo.com/shell.git
git push -u origin main
```