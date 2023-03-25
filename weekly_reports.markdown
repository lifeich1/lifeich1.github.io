---
layout: post
---

{% for cate in site.categories %}
{% if cate.first == "WeeklyReport" %}
{% for i in cate.last %}
- [{{ i.title }}]({{ i.url }})
{% endfor %}
{% endif %}
{% endfor %}
