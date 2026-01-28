---
title: News
nav_order: 7
---

# {{ page.title }}

<ul>
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_long_string }}</span> <a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

Be up to date with the <a href="/feed.xml">RSS feed</a>
