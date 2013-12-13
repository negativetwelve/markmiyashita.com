{% capture question %}
Write an iterator that continues to iterate over a list, infinitely. Once you iterate over an entire list, you should start back at the first element of the input list.

    class ListCycle(object):
        """
        >>> m = ListCycle([1, 2, 3])
        >>> for i in m:
        ...     print(i)
        ...
        1
        2
        3
        1
        2
        3
        1
        2
        3
        ...
        ...
        ...
        """
        "***YOUR CODE HERE***"

{% endcapture %}

{% capture solution %}
    class ListCycle(object):

        def __init__(self, lst):
            self.lst = lst
            self.index = 0

        def __iter__(self):
            return self

        def __next__(self):
            item = self.lst[self.index]
            self.index = (self.index + 1) % len(self.lst)
            return item
{% endcapture %}

{% include cs61a/problem_template.md %}
