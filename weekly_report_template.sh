#!/bin/bash

. env.sh

f=_drafts/Weekly_Report_$(date +%y_%U).md
cat > $f << END
---
layout: post
title:  Weekly report $(date +%y-%U)
date:   $(date "+%Y-%m-%d %T") +0800
categories: WeeklyReport
---

### 健

### 数学

#### log
\`\`\`
$(math_log)
\`\`\`

### 画

#### log
\`\`\`
$(draw_log)
\`\`\`

### Coding compete

#### log
\`\`\`
$(code_log)
\`\`\`

### 音乐 (auto log todo)

## 下周加强排序

END

git add $f
echo ready: $f
