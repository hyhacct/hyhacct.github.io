---
title: Git - 多密钥管理多个仓库
categories: Git
tags:
  - Git
---



## 概述

如果是使用的ssh而不是https，那么我们就需要为不同的仓库单独生成ssh key。

但是在使用GitHub时，如果有多个仓库，并且这些仓库中的项目都在我本地同一台设备上，那么这样的后果是无法使用同一个ssh key来管理这些仓库。

出于GitHub的安全考虑，它并不允许我们使用同一份ssh key来管理多个仓库。那么这篇文章就来介绍一下如何为不同的仓库单独生成ssh key，来解决这个问题。


## 步骤

1. 准备你的开发环境(我这里是使用的Linux)。
2. 在本地终端中，输入以下命令生成一份新的ssh key：

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f ~/.ssh/github_repo1
```
其中，`your_email@example.com`是你邮箱，`github_repo1`是你要创建的仓库或者秘钥的名字。

3. 然后，你会看到一系列的提示，全程回车就完事：

4. 然后，你会在`~/.ssh`目录下看到两个文件：`github_repo1`和`github_repo1.pub`。

5. 打开`github_repo1.pub`文件，复制里面的内容。

6. 登录GitHub，进入你的仓库，在仓库的 `Setings > Deploy keys > Add deploy key` 中填写你的公钥信息。

7. 点击 `Add key` 按钮，完成部署密钥的添加。

8. 回到我们的开发环境中，编辑 `~/.ssh/config` 文件，添加以下内容：

```
Host github_repo1
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_repo1
```

9. 保存并关闭 `~/.ssh/config` 文件。

那么现在，我们就可以使用 `git clone git@github_repo1:your_username/your_repo.git` 来克隆我们需要的仓库了，注意哦，克隆时要指定`github_repo1`

## 注意事项
- 请不要把你的私钥上传到任何地方，包括GitHub。
- 请不要把你的公钥上传到任何地方，包括GitHub。
- 请不要把你的私钥泄露给任何人。
- 请不要把你的公钥泄露给任何人。
