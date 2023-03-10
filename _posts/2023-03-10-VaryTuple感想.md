---
layout: post
title:  VaryTuple感想
date:   2023-03-10 21:53:32 +0800
categories: cpp
---

对于 `std::tuple<Ts...>` ，似乎c++17无法以
`template <class Tuple>` 捕捉并解出 `Ts...`。

进而影响对tuple的forward转发。在`vary_tuple`结果类型必须用`Ts...`
定义时，只能使用**函数重载**，不能模版forward转发。
