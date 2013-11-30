{% for problem in site.categories.interviews %}
{% if problem.categories contains 'problems' and problem.tags contains interview_level %}
* <a href="{{ problem.url }}">{{ problem.title }}</a> - {% for language in problem.languages %}`{{ language }}`{% endfor %}
{% endif %}
{% endfor %}

{% for class in site.custom_posts %}
{% for semester in class[1] %}
{% for topic in semester[1] %}
{% for problem in topic[1].problems %}
{% if problem.interview_problem and interview_level == problem.interview_level %}
* <a href="{{ problem.clean_url }}">{{ problem.name }}</a> - {% for language in problem.interview_languages %}`{{ language }}`{% endfor %}
{% endif %}
{% endfor %}
{% endfor %}
{% endfor %}
{% endfor %}
