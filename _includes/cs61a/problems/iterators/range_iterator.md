{% capture question %}
Write an iterator that acts as the built-in `range` iterator in Python. You should account for all different cases:

1. When there is only one input, the argument acts as the ending value with 0 as the start value.
2. When there is only two inputs, the arguments act as the start and end, respectively.
3. When there are three inputs, they act as the start, end, and step values.

Also, remember that `range` starts from `start` and goes up to, but not including `end`.

    class Range(object):
        """
        >>> r = Range(3) # 0, 1, 2
        >>> s = Range(1, 5) # 1, 2, 3, 4
        >>> t = Range(1, 5, 2) # 1, 3
        """
        "***YOUR CODE HERE***"

{% endcapture %}

{% capture solution %}
    class Range(object):

        def __init__(self, start, end=None, step=1):
            if end is None:
                end = start
                start = 0

            self.start = start
            self.end = end
            self.step = step

        def __iter__(self):
            return self

        def __next__(self):
            if self.start >= self.end:
                raise StopIteration
            current = self.start
            self.start += self.step
            return current

The tricky part about this question is the `__init__` method. As long as you pay particular attention to the different ways of creating a `Range` object, you should be good to go.
{% endcapture %}

{% include cs61a/problem_template.md %}
