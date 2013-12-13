{% capture question %}
Write an iterator that outputs the value `n` number of times. If there is no `n` specified in the input arguments, then your iterator should act as an infinite iterator, always outputting the same element.

    class Repeat(object):
        """
        >>> r = Repeat(3, 5) # Will output 3, 5 times.
        >>> s = Repeat(3) # Will output 3 an infinite number of times.
        """
        "***YOUR CODE HERE***"

{% endcapture %}

{% capture solution %}
    class Repeat(object):

        def __init__(self, elem, n=None):
            self.elem = elem
            self.n = n
            self.index = 0

        def __iter__(self):
            return self

        def __next__(self):
            if self.n is not None and self.index >= self.n:
                raise StopIteration
            self.index += 1
            return self.elem

The important thing to note in this question is the possibility of two different cases. On one hand, the iterator might be finite in which case you'd have to raise a `StopIteration`. On the other hand, the iterator might be infinite in which case you don't have to raise the `StopIteration`.
{% endcapture %}

{% include cs61a/problem_template.md %}
