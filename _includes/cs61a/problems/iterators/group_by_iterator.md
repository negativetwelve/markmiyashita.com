{% capture question %}
Write an iterator that takes in an `iterable` and an optional `key_func` where the key function is responsible for computing the key value for each element. If a `key_func` is not specified, then the identity function is used.

The `iterable` is assumed to be sorted by the `key_func`. Take a look at the following example:

    >>> g = GroupBy('AAAABBBCCDEFFF')
    >>> for key, value_iterator in g:
    ...     print(key, list(value_iterator))
    ...
    A ['A', 'A', 'A', 'A']
    B ['B', 'B', 'B']
    C ['C', 'C']
    D ['D']
    E ['E']
    F ['F', 'F', 'F']

Remember MapReduce? You don't need to in order to solve this problem; however, if you remember the phrase before the reduce stage where the inputs are all grouped together by the key...that's what you're implementing here. So, after solving this problem, you can say you know how that phase of MapReduce works! Pretty cool!

    class GroupBy(object):

        def __init__(self, iterable, key_func=lambda x: x):
            "***YOUR CODE HERE***"

        "***ADD MORE METHODS AS NECESSARY***"
{% endcapture %}
{% capture solution %}
    class GroupBy(object):

        def __init__(self, iterable, key_func=lambda x: x):
            self.iterable = iter(iterable)
            self.key_func = key_func
            self.current_key = None
            self.target_key = None
            self.current_value = None

        def __iter__(self):
            return self

        def __next__(self):
            while self.current_key == self.target_key:
                self.current_value = next(self.iterable)
                self.current_key = self.key_func(self.current_value)
            self.target_key = self.current_key
            return (self.current_key, self.grouper(self.target_key))

        def grouper(self, target_key):
            while self.current_key == target_key:
                yield self.current_value
                self.current_value = next(self.iterable)
                self.current_key = self.key_func(self.current_value)

This problem is really, really hard so don't be discouraged if you didn't get it. We mainly have three variables to keep track of, we have the `current_key` which is the key that we're currently on, we have the `target_key` which is the key that we're looking for, and we have the `current_value` which, after finding the matching key, we want to yield out the current values.

In our `__next__` method, we're doing two things. First, we're searching for the current key that does not match the target key. As soon as we find a current key that's not the target key, we update the target key so that we can use it in our helper function and then we output the `current_key` and the grouped up values based on that `target_key` that we just found.

The `grouper` method is searching for the `target_key` in the next keys. Essentially, it is looking through the input to try to find the next key that does not match the key that we're looking for. As soon as that's true, it exits the while loop and stops yielding values to the `__next__` method. The result is that the `grouper` function yields all values that match the `target_key` and then updates the `current_key` to be the next key that appears in the iterable.
{% endcapture %}

{% include cs61a/problem_template.md %}
