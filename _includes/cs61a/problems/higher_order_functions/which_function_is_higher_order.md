{% capture question %}
Here we have some functions defined below. Run through and figure out what the following expressions evaluate to. If you have time, draw the environment diagram (it might make the problem easier to solve!) If the expression raises an error, just write ERROR. If the expression returns a function, just write FUNC.

    x = 3
    y = 5

    def f(x):
        def g(y):
            return x * y
        return g

    def h(f, g):
        return g(x)(y)

    def g(x):
        def f(y):
            return x
        return f(x)

    >>> g(5)          #1

    >>> f(5)          #2

    >>> f(6)(7)       #3

    >>> h(g, f)       #4

    >>> g = f(5)
    >>> g(4)          #5

    >>> h(f, f)       #6


{% endcapture %}

{% capture solution %}
1. 5
2. FUNC
3. 42
4. 15
5. 20
6. 15

Remember to label the parent frames when drawing the environment. Also remember that a function's intrinsic name and the variables that point to it may have differing values.

{% endcapture %}

{% include cs61a/problem_template.md %}
