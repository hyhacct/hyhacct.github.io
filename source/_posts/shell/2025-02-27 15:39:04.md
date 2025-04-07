---
title: Shell - 三剑客sed篇
categories: Shell
tags:
  - Shell
---

## Sed 命令简介

sed (Stream Editor) 是一个强大的流式文本编辑器，它可以对文本进行增删改查等操作。主要特点：
- 逐行处理文本
- 支持正则表达式
- 支持多种编辑命令
- 可以直接修改文件

## 基本语法

```bash
sed [选项] '命令' 文件
```

## 常用选项

- `-n`: 仅显示处理后的行
- `-i`: 直接修改文件内容
- `-e`: 执行多个命令
- `-f`: 从文件读取命令
- `-r`: 使用扩展正则表达式

## 基础命令详解

### 1. 查看命令 (p)

```bash
# 打印第2行
sed -n '2p' file.txt

# 打印2-5行
sed -n '2,5p' file.txt

# 打印包含"error"的行
sed -n '/error/p' file.txt
```

### 2. 删除命令 (d)

```bash
# 删除第3行
sed '3d' file.txt

# 删除2-5行
sed '2,5d' file.txt

# 删除空行
sed '/^$/d' file.txt

# 删除包含"error"的行
sed '/error/d' file.txt
```

### 3. 替换命令 (s)

```bash
# 基本替换
sed 's/old/new/' file.txt  # 替换每行第一个匹配
sed 's/old/new/g' file.txt # 替换所有匹配

# 指定行替换
sed '3s/old/new/' file.txt # 只替换第3行
sed '2,5s/old/new/g' file.txt # 替换2-5行

# 使用正则表达式
sed 's/[0-9]\+/number/g' file.txt # 将数字替换为"number"
```

### 4. 插入和追加命令 (i/a)

```bash
# 在第3行前插入
sed '3i\新行内容' file.txt

# 在第3行后追加
sed '3a\新行内容' file.txt

# 在匹配行后追加
sed '/pattern/a\新行内容' file.txt
```

### 5. 修改命令 (c)

```bash
# 替换第3行
sed '3c\新行内容' file.txt

# 替换2-5行
sed '2,5c\新行内容' file.txt
```

## 高级用法

### 1. 多命令组合

```bash
# 使用分号分隔多个命令
sed 's/old/new/g; s/foo/bar/g' file.txt

# 使用 -e 选项
sed -e 's/old/new/g' -e 's/foo/bar/g' file.txt
```

### 2. 使用地址范围

```bash
# 从匹配行到文件末尾
sed '/start/,$s/old/new/g' file.txt

# 在两个模式之间的行执行命令
sed '/start/,/end/s/old/new/g' file.txt
```

### 3. 保持空间操作

```bash
# 交换模式空间和保持空间
sed 'h;n;H;x' file.txt

# 将当前行追加到保持空间
sed 'H;$!d;x' file.txt
```

### 4. 条件分支

```bash
# 使用标签和分支
sed ':a;N;$!ba;s/\n/ /g' file.txt  # 将多行合并为一行
```

## 实用示例

### 1. 文本处理

```bash
# 删除注释和空行
sed -e '/^#/d' -e '/^$/d' config.txt

# 格式化 JSON
sed 's/,/,\n/g' data.json

# 转换 Windows 换行符
sed 's/\r$//' file.txt
```

### 2. 配置文件修改

```bash
# 修改配置值
sed -i 's/^PORT=.*/PORT=8080/' config.conf

# 添加配置项
sed -i '/^#END/i\NEW_OPTION=value' config.conf
```

### 3. 日志处理

```bash
# 提取时间戳
sed -n 's/.*\[\([^]]*\)\].*/\1/p' access.log

# 清理日志中的敏感信息
sed 's/password=[^&]*/password=****/g' app.log
```

## 性能优化技巧

1. 使用 `-i` 选项时创建备份
```bash
sed -i.bak 's/old/new/g' file.txt
```

2. 处理大文件时使用流式处理
```bash
cat largefile.txt | sed 's/old/new/g' > newfile.txt
```

## 注意事项

1. Mac OS 上需要使用 `-i ''` 进行原地修改
2. 正则表达式中的特殊字符需要转义
3. 默认情况下 sed 使用基本正则表达式
4. 修改文件前建议先备份

## 调试技巧

1. 使用 `-n` 选项查看处理结果
```bash
sed -n 's/old/new/p' file.txt
```

2. 在复杂操作前先测试
```bash
sed --debug 's/pattern/replacement/' file.txt
```

## 总结

sed 是一个强大的文本处理工具，它的优势在于：
- 流式处理文本
- 强大的正则表达式支持
- 丰富的编辑命令
- 适合自动化处理

掌握 sed 可以大大提高文本处理效率，特别是在需要批量修改文件时。
