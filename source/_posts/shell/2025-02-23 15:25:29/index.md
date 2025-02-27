---
title: Shell - 三剑客awk篇
categories: Shell
tags:
  - Shell
---

## AWK 简介

AWK 是一个强大的文本处理工具，也是一门编程语言。它得名于其创始人 Alfred Aho、Peter Weinberger 和 Brian Kernighan 的姓氏首字母。AWK 主要用于：
- 文本处理
- 数据提取
- 报表生成
- 数据分析

## 基本语法

```bash
awk [选项] 'pattern {action}' 输入文件
```

## AWK 工作原理

AWK 按行处理文本：
1. 读入一行内容
2. 将行按分隔符分割成字段
3. 对每个字段执行指定操作

## 内置变量

常用内置变量：
- `$0`: 当前整行内容
- `$1`-`$n`: 当前行的第n个字段
- `NF`: 当前行的字段数
- `NR`: 当前处理的行号
- `FS`: 输入字段分隔符（默认是空格）
- `OFS`: 输出字段分隔符
- `RS`: 输入记录分隔符（默认是换行符）
- `ORS`: 输出记录分隔符

## 基础示例

### 1. 打印特定列
```bash
# 文件内容 (data.txt)：
# name age salary
# Tom 25 5000
# Jerry 30 6000

# 打印第1和第3列
awk '{print $1, $3}' data.txt
# 输出：
# name salary
# Tom 5000
# Jerry 6000
```

### 2. 使用自定义分隔符
```bash
# 文件内容 (data.csv)：
# name,age,salary
# Tom,25,5000

# 使用逗号作为分隔符
awk -F',' '{print $1, $3}' data.csv
# 输出：
# name salary
# Tom 5000
```

### 3. 条件过滤
```bash
# 打印工资大于5500的记录
awk '$3 > 5500 {print $0}' data.txt
# 输出：
# Jerry 30 6000
```

## 进阶用法

### 1. BEGIN 和 END 块
```bash
# 添加表头和汇总信息
awk 'BEGIN {
    print "工资报表"
    print "--------"
}
{
    total += $3
}
END {
    print "--------"
    print "总工资:", total
}' data.txt
```

### 2. 内置函数使用

#### 字符串函数
```bash
# length(): 计算字符串长度
awk '{print $1, length($1)}' data.txt

# substr(): 字符串截取
awk '{print substr($1, 1, 3)}' data.txt

# toupper()/tolower(): 大小写转换
awk '{print toupper($1)}' data.txt
```

#### 数学函数
```bash
# int(): 取整
awk '{print int($3/1000)}' data.txt

# rand(): 随机数
awk 'BEGIN {print rand()}'
```

### 3. 条件和循环

#### if 语句
```bash
awk '{
    if ($3 >= 6000)
        print $1 "的工资很高"
    else if ($3 >= 5000)
        print $1 "的工资一般"
    else
        print $1 "的工资较低"
}' data.txt
```

#### for 循环
```bash
# 计算每行各个字段的和
awk '{
    sum = 0
    for (i=1; i<=NF; i++)
        sum += $i
    print "行"NR"的和:", sum
}' numbers.txt
```

### 4. 数组使用
```bash
# 统计每个工资等级的人数
awk '{
    if ($3 >= 6000) level="高"
    else if ($3 >= 5000) level="中"
    else level="低"
    count[level]++
}
END {
    for (level in count)
        print "工资"level"级别的人数:", count[level]
}' data.txt
```

## 实用示例

### 1. 日志分析
```bash
# 分析 Apache 访问日志，统计访问量最大的 IP
awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -n 5
```

### 2. CSV 文件处理
```bash
# 计算 CSV 文件中某列的平均值
awk -F',' '{ sum += $3 } END { print "平均值:", sum/NR }' data.csv
```

### 3. 文本格式化
```bash
# 格式化输出表格
awk 'BEGIN {
    printf "%-15s %-8s %-10s\n", "姓名", "年龄", "工资"
    print "--------------------------------"
}
{
    printf "%-15s %-8s %-10s\n", $1, $2, $3
}' data.txt
```

### 4. 数据提取和转换
```bash
# 将数据转换为 JSON 格式
awk -F',' 'BEGIN {print "["}
{
    printf "  {\"name\": \"%s\", \"age\": %s, \"salary\": %s}%s\n",
        $1, $2, $3, (NR==NR ? "" : ",")
}
END {print "]"}' data.csv
```

## 性能优化技巧

1. 使用 `next` 语句跳过不需要处理的行
```bash
awk '$3 < 5000 { next } { print $0 }' data.txt
```

2. 预编译正则表达式
```bash
awk 'BEGIN { pattern = "^[A-Z]" }
$1 ~ pattern { print $0 }' data.txt
```

## 注意事项

1. 字段分隔符设置要注意转义
2. 大文件处理时注意内存使用
3. 复杂运算考虑使用其他工具配合
4. 注意数据类型的隐式转换

## 总结

AWK 是一个强大的文本处理工具，它的优势在于：
- 简洁的语法
- 强大的文本处理能力
- 灵活的编程特性
- 丰富的内置函数

掌握 AWK 可以大大提高文本处理效率，特别是在处理日志、数据分析等场景下。


