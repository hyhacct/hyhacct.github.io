---
title: Shell - 三剑客grep篇
categories: Shell
tags:
  - Shell
---

## Grep 命令简介

grep (Global Regular Expression Print) 是一个强大的文本搜索工具，用于在文件中搜索指定的字符串或正则表达式。它的主要功能包括：
- 文本搜索
- 模式匹配
- 正则表达式搜索
- 多文件搜索

## 基本语法

```bash
grep [选项] 模式 [文件...]
```

## 常用选项详解

### 1. 匹配控制选项

- `-i`: 忽略大小写
  ```bash
  grep -i "hello" file.txt  # 匹配 hello、Hello、HELLO 等
  ```

- `-w`: 匹配整个单词
  ```bash
  grep -w "test" file.txt  # 只匹配 test，不匹配 testing
  ```

- `-x`: 匹配整行
  ```bash
  grep -x "hello world" file.txt  # 只匹配完整的 "hello world" 行
  ```

### 2. 输出控制选项

- `-n`: 显示行号
  ```bash
  grep -n "error" log.txt  # 显示包含 error 的行及其行号
  ```

- `-c`: 只显示匹配行数量
  ```bash
  grep -c "warning" log.txt  # 显示包含 warning 的行数
  ```

- `-l`: 只显示包含匹配的文件名
  ```bash
  grep -l "TODO" *.txt  # 列出所有包含 TODO 的txt文件
  ```

- `-L`: 只显示不包含匹配的文件名
  ```bash
  grep -L "error" *.log  # 列出所有不包含 error 的日志文件
  ```

### 3. 上下文控制选项

- `-A n`: 显示匹配行及后n行
  ```bash
  grep -A 2 "error" log.txt  # 显示错误行及其后2行
  ```

- `-B n`: 显示匹配行及前n行
  ```bash
  grep -B 2 "error" log.txt  # 显示错误行及其前2行
  ```

- `-C n`: 显示匹配行及前后各n行
  ```bash
  grep -C 2 "error" log.txt  # 显示错误行及其前后各2行
  ```

### 4. 正则表达式选项

- `-E`: 使用扩展正则表达式
  ```bash
  grep -E "^(Error|Warning):" log.txt  # 匹配以Error或Warning开头的行
  ```

- `-P`: 使用Perl正则表达式
  ```bash
  grep -P "\d{3}-\d{2}-\d{4}" file.txt  # 匹配类似 123-45-6789 的格式
  ```

### 5. 递归搜索选项

- `-r` 或 `-R`: 递归搜索目录
  ```bash
  grep -r "TODO" ./src/  # 递归搜索src目录下所有包含TODO的文件
  ```

## 高级用法

### 1. 使用正则表达式

```bash
# 匹配邮箱地址
grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" file.txt

# 匹配IP地址
grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" file.txt

# 匹配URL
grep -E "https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}[a-zA-Z0-9./?=_%&-]*" file.txt
```

### 2. 组合使用

```bash
# 查找不包含特定字符串的行
grep -v "error" file.txt

# 同时匹配多个模式
grep -E "error|warning|critical" log.txt

# 使用或操作
grep 'pattern1\|pattern2' file.txt
```

### 3. 文件过滤

```bash
# 只搜索特定类型文件
find . -type f -name "*.py" -exec grep "import" {} \;

# 排除特定目录
grep -r --exclude-dir={node_modules,dist} "TODO" .
```

## 实用示例

### 1. 日志分析
```bash
# 提取错误信息
grep -i "error" app.log | grep -v "debug"

# 统计错误类型
grep -o "ERROR:[^ ]*" app.log | sort | uniq -c
```

### 2. 代码审查
```bash
# 查找可能的安全问题
grep -r "eval(" ./src/

# 查找TODO注释
grep -r -n "TODO:" ./src/
```

### 3. 系统管理
```bash
# 查看系统登录记录
grep "Failed password" /var/log/auth.log

# 检查系统服务状态
grep "Started" /var/log/syslog
```

## 性能优化技巧

1. 使用 `--exclude` 和 `--include` 过滤文件
```bash
grep --include=\*.{php,html} -r "function" .
```

2. 使用 `-F` 进行固定字符串搜索
```bash
grep -F "exact string" file.txt  # 比正则表达式搜索更快
```

## 注意事项

1. 正则表达式中特殊字符需要转义
2. 大文件搜索考虑使用其他工具（如 ripgrep）
3. 递归搜索时注意文件权限
4. 注意编码问题，可能需要使用 `-P` 选项

## 总结

grep 是一个强大的文本搜索工具，它的优势在于：
- 灵活的模式匹配
- 强大的正则表达式支持
- 丰富的输出控制选项
- 良好的系统集成能力

熟练掌握 grep 可以大大提高文本处理和日常运维效率。

