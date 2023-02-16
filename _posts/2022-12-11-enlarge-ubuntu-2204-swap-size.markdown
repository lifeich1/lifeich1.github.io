---
layout: post
title:  "扩大 Ubuntu 22.04.1 LTS 的 swap 空间"
date:   2022-12-11 22:00:02 +0800
categories: ubuntu
---
## 扩大 Ubuntu 22.04.1 LTS 的 swap 空间

```sh
sudo swapoff -a
sudo fallocate -l 16G /swapfile
sudo mkswap /swapfile
sudo swapon -a
```

### 解释

1. 关闭当前使用的swapfile
2. 扩大默认使用的swapfile至16G大小
3. *（或可不用？）* 刷新swapfile设置
4. 启用swapfile
