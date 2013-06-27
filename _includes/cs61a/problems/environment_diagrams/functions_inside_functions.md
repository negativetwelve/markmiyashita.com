{% capture question %}
Here we have some functions defined below. Run through and figure out what the two calls at the bottom output and then draw the environment diagram.

    def f(g, f):
        return g(f)

    def foo(g, h):
        return h * g(h)

    def h(i):
        return 5

    f(h, foo)       #1

    f(h, foo(h, 3)) #2


{% endcapture %}

{% capture solution %}
1. 5
2. 5

{% endcapture %}

{% include cs61a/problem_template.md %}
