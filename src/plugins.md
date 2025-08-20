---
title: Plugins
nav_order: 100
has_children: true
permalink: /plugins/
layout: default
draft: true
nav_exclude: true
---

# {{ page.title }}

<ul>
  {% for p in site.plugins %}
    <li><a href="{{ p.url }}">{{ p.title }}</a></li>
  {% endfor %}
</ul>
