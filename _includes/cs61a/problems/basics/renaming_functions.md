{% capture question %}
Remember, variables are just names of things. Things can be anything -- integers, strings, even functions. Let's play around with some variables, renaming them, and changing their value. Then we'll predict what they output.
What would the following output in Python?

    >>> f = min
    >>> def f(x):
    ...     return x + 1
    ...
    >>> max = f
    >>> f, min = min, f
    >>> min(4)
                #1
    >>> max(4)
                #2

{% endcapture %}

{% capture solution %}
1. 5
2. 5

The tricky part here is the line:

    >>> f, min = min, f

In Python, we __always__ evaluate the right side of an assignment before the left. In this case, we evaluate both the function `min` and the function `f`. We keep track of what those two variables are pointing to, then we reassign them. In this case, `f` now points to where `min` used to point to and `min` now points to where `f` points to. So, when we call both `min` and `max`, we're actually just calling the original function `f`. The original function `f` simply returns 1 + the value of the input which in this case was four.

{% endcapture %}

{% include cs61a/problem_template.md %}
