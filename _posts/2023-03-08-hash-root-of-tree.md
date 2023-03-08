---
layout: post
title:  hash-root-of-tree
date:   2023-03-08 20:30:41 +0800
categories: algorithm
---

算法备忘：

### 直接映射到数字

应当用非线性算式，如 h(node)=sum{h(child)^2+c1*h(child)}+c0；并注意子
结点顺序不影响哈希。

### 防碰撞

1. 将加入到集合的次序作为最终哈希。
2. 记录子结点映射数字为快速哈希，加速集合对比。
