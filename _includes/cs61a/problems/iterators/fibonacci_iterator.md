{% capture question %}
Write an iterator that returns the fibonacci series. Your implementation should be pretty short!

    class FibIterator(object):
        "***YOUR CODE HERE***"

{% endcapture %}

{% capture solution %}
    class FibIterator(object):

        def __init__(self):
            self.prev, self.current = 0, 1

        def __next__(self):
            current = self.prev
            self.prev, self.current = self.current, self.prev + self.current
            return current

        def __iter__(self):
            return self

In this problem, we note that we are making an iterator so we're going to need at least two elements, maybe three. We for sure will need an `__init__` method to set up our problem. We also need an `__iter__` method that returns an object that implements the `__next__` method. In our `__init__` function, we are simply initializing our variables so that we have values to work with. In our `__iter__` method, we're following the rules and returning an object that implements the `__next__` method. Since the object that we're creating has the `__next__` method, we're good to go! Lastly, we create the `__next__` method that stores the current value, updates our variables, then returns that value that we stored from the beginning.
{% endcapture %}

{% include cs61a/problem_template.md %}
