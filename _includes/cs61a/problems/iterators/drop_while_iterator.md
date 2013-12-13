{% capture question %}
Write an iterator that takes in two arguments, a function and a list. The iterator should return all elements starting from the first item that *fails* the predicate function. This means that you should eliminate all items from the beginning of the list that *do* satisfy the predicate. Here's an example:

    >>> d = DropWhile(lambda x: x < 5, [1, 4, 6, 4, 1])
    >>> for i in d:
    ...     print(i)
    ...
    6
    4
    1

<!-- -->

    class DropWhile(object):
        "***YOUR CODE HERE***"
{% endcapture %}
{% capture solution %}
    class DropWhile(object):

        def __init__(self, pred, sequence):
            self.pred = pred
            self.sequence = sequence

        def __iter__(self):
            while self.sequence and self.pred(self.sequence[0]):
                self.sequence.pop(0)
            return iter(self.sequence)

There are many ways to solve this problem. Basically, since we're using a list, all we need to do is get rid of the elements at the beginning of the list that satisfy the predicate. Then, we just return the normal list iterator over the rest of the items in the list.

{% endcapture %}

{% include cs61a/problem_template.md %}
