{% capture question %}
Write a generator that takes in any number of iterables and zips them together. It should output a series of lists, each containing the nth items of each iterable. It should stop when the smallest iterable runs out of elements. For example:

    def zip(     ):
        """
        >>> z = zip([1, 2, 3], [4, 5, 6], [7, 8])
        >>> for i in z:
        ...     print(i)
        ...
        [1, 4, 7]
        [2, 5, 8]
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def zip(*iterables):
        """
        >>> z = zip([1, 2, 3], [4, 5, 6], [7, 8])
        >>> for i in z:
        ...     print(i)
        ...
        [1, 4, 7]
        [2, 5, 8]
        """
        iterators = [iter(iterable) for iterable in iterables]
        while True:
            yield [next(iterator) for iterator in iterators]

There were several concepts that were tested in this problem. The first was the * syntax most commonly associated with `*args`. Remember that `args` is just the name of the list of arguments, but the variable can be named anything. For this problem, we're going to call it `iterables` because it's going to be a list of iterables. Since they are iterables, we need to make them all into iterators so the best way to do this is call `iter` on each of the iterables to make iterators. This can also be done using `map`. Next, we need a loop that runs to the end of the shortest iterator, however, we note that when we reach the end of the shortest iterator, we need to raise a `StopIteration`. We then note that when calling `next` on an iterator that is out of elements, it raises a `StopIteration`! So, our job is mainly complete and we can just yield the next items of each iterator. When one iterator runs out of elements, it will raise a `StopIteration` which in turn will make the `zip` function return a `StopIteration` as well.
{% endcapture %}

{% include cs61a/problem_template.md %}
