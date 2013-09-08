{% assign base = 'interviews/problems/' %}
{% assign problem_title = page.title | replace: ',', ' '| downcase | split: ' ' | join: '_' %}
{% capture path %}{{ base }}{{ problem_title }}/{{ problem_title }}{% endcapture %}


{% capture python_file %}{{ path }}_python.py{% endcapture %}
{% capture ruby_file %}{{ path }}_ruby.rb{% endcapture %}
{% capture java_file %}{{ path }}_java.java{% endcapture %}
{% capture javascript_file %}{{ path }}_javascript.js{% endcapture %}


## {{ page.title }}

{{ description | markdownify }}

Write your solution in any language you like. We have solutions below for the
following languages:

{% for language in page.languages %}
[{{ language | capitalize }}](#{{ language }})
{% endfor %}

{% if page.languages contains 'python' %}
### Python Solution [(download)](/{{ python_file }}) {#python}

{% highlight python %}
{% include python_file %}
{% endhighlight %}
{% endif %}


{% if page.languages contains 'ruby' %}
### Ruby Solution [(download)](/{{ ruby_file }}) {#ruby}

{% highlight ruby %}
{% include ruby_file %}
{% endhighlight %}
{% endif %}


{% if page.languages contains 'java' %}
### Java Solution [(download)](/{{ java_file }}) {#java}

{% highlight java %}
{% include java_file %}
{% endhighlight %}
{% endif %}


{% if page.languages contains 'javascript' %}
### Javascript Solution [(download)](/{{ javascript_file }}) {#javascript}

{% highlight javascript %}
{% include javascript_file %}
{% endhighlight %}
{% endif %}
