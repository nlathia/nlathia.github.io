---
layout: default
title:  "Neal's Blog"
author: N. Lathia
---

# Blog Posts

I usually blog about research, projects that I've worked on, and other random things about building machine learning systems. I've blogged in various places:
<ul>
	<li><a href="https://medium.com/@neal_lathia">Medium</a></li>
	<li><a href="https://urbanmining.wordpress.com/">Wordpress</a> (Until 2015)</li>
	<li><a href="http://mobblog.cs.ucl.ac.uk/">UCL Mob Blog</a> (Until 2010)</li>
</ul>

{% for category in site.categories %}
  {% if category[0] != "blog" %}
  <h3>{{ category[0] }}</h3>
  <p>
    {% for post in category[1] %}
      <p><a href="{{ post.url }}">{{ post.title }}</a>
      <br>{{ post.date | date: "%d %B %Y" }}
      </p>
    {% endfor %}
  </p>
  {% endif %}
{% endfor %}
