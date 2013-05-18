Here are a series of Tree Recursion practice problems! For all of these problems, I will be using the Tree class that can be found [here](http://markmiyashita.com/cs61a/code/tree_recursion/tree.py).

If you want a template of all of the problems (without solutions), you can download it here: [tree_template.py](http://markmiyashita.com/cs61a/code/tree_recursion/tree_template.py)

{% for problem in site.categories.problems %}
  {% if problem.tags contains "tree recursion" %}
    {% if problem.published and problem.url != page.url %}
      * [{{ problem.title }}]({{ problem.url }})
    {% endif %}
  {% endif %}
{% endfor %}