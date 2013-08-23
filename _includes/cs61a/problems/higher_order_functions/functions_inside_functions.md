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

The important thing to note here is the order of evaluation. Remember that you don't pay attention to the body of a function until you actually call the function AND that you need to evaluate all of your operands before you can apply your operator.


{% endcapture %}

{% include cs61a/problem_template.md %}
