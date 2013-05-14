<p>
  Here are a series of Tree Recursion practice problems! For all of these problems, I will be using the Tree class that can be found <a href="http://markmiyashita.com/cs61a/code/tree_recursion/tree.py">here.</a>
</p>

<p>
  If you want a template of all of the problems (without solutions), you can download it here: <a href="http://markmiyashita.com/cs61a/code/tree_recursion/tree_template.py">tree_template.py</a>
</p>

<ul>
  {% for problem in site.categories.problems %}
  {% if problem.tags contains "tree recursion" %}
    {% if problem.published and problem.url != page.url %}
    <li><a href="{{ problem.url }}">{{ problem.title }}</a></li>
    {% endif %}
  {% endif %}
{% endfor %}
</ul>
