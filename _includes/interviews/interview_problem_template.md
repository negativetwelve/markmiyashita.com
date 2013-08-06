{% assign base = 'interviews/problems/' %}
{% assign problem_title = page.title | replace ',', ''| downcase | split: ' ' | join: '_' %}
{% capture path %}{{ base }}{{ problem_title }}/{{ problem_title }}{% endcapture %}


{% capture python %}{{ path }}_python.py{% endcapture %}
{% capture ruby %}{{ path }}_ruby.rb{% endcapture %}
{% capture java %}{{ path }}_java.java{% endcapture %}
{% capture javascript %}{{ path }}_javascript.js{% endcapture %}


## {{ page.title }}

{{ description | markdownify }}

Write your solution in any language you like. We have solutions below for the
following languages:

{% for language in page.languages %}<span>[{{ language | capitalize }}](#{{ language }}){: .button_link .load_solution}</span>{% endfor %}

{% if page.languages contains 'python' %}
### Python Solution [(download)](/{{ python }}) {#python}

{% highlight python %}
{% include python %}
{% endhighlight %}
{% endif %}


{% if page.languages contains 'ruby' %}
### Ruby Solution [(download)](/{{ ruby }}) {#ruby}

{% highlight ruby %}
{% include ruby %}
{% endhighlight %}
{% endif %}


{% if page.languages contains 'java' %}
### Java Solution [(download)](/{{ java }}) {#java}

{% highlight java %}
{% include java %}
{% endhighlight %}
{% endif %}


{% if page.languages contains 'javascript' %}
### Javascript Solution [(download)](/{{ javascript }}) {#javascript}

{% highlight javascript %}
{% include javascript %}
{% endhighlight %}
{% endif %}
