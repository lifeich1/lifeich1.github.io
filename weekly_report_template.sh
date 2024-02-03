#!/bin/bash

. env.sh

thesec() {
  if [ -n "$2" ]; then
    cat << END
### $1

#### log
\`\`\`
$2
\`\`\`
END
  fi
}

u=$(date +%V)
if [ "$1" = "-b" ]; then
  u=$(($u-1))
fi
name=$(date +%y)_$u
f=_drafts/Weekly_Report_$name.md
cat > $f << END
---
layout: post
title:  Weekly report $name
date:   $(date "+%Y-%m-%d %T") +0800
categories: WeeklyReport
---

### 健

$(thesec 数学 "$(math_log)")
$(thesec 画 "$(draw_log)")
$(thesec "Coding compete" "$(code_log)")

$(./utils/wp-getlog.pl)

## 下周加强排序

END

git add $f
echo opening: $f
emacsclient -n $f
