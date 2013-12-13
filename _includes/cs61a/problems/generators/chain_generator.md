{% capture question %}
Write a generator that takes in any number of iterables and returns the elements of all the iterables in order, starting with the first item of the first iterable.

    def chain(        ):
        """
        >>> c = chain([1, 2, 3], [4, 5], [6, 7])
        >>> for i in c:
        ...     print(i)
        ...
        1
        2
        3
        4
        5
        6
        7
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def chain(*iterables):
        """
        >>> c = chain([1, 2, 3], [4, 5], [6, 7])
        >>> for i in c:
        ...     print(i)
        ...
        1
        2
        3
        4
        5
        6
        7
        """
        for iterable in iterables:
            for item in iterable:
                yield item

The first thing to note in this problem is that the `chain` function can take in any number of arguments. Therefore, we must recall that thei `*` syntax allows us to do that. In this problem, if we remember that a `for` loop implicitly calls the `iter` method on the object that it iterates over, then we know that each iterable will become an interator. From there, we just need to iterate over the iterator to get the individual elements of the list and yield them in order.
{% endcapture %}

{% include cs61a/problem_template.md %}
