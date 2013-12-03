{% capture question %}
Write a generator that returns the fibonacci series. Your implementation should be pretty short!

    def fib_generator():
        """
        >>> fib = fib_generator()
        >>> next(fib)
        0
        >>> next(fib)
        1
        >>> next(fib)
        1
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def fib_generator():
        """
        >>> fib = fib_generator()
        >>> next(fib)
        0
        >>> next(fib)
        1
        >>> next(fib)
        1
        """
        "***YOUR CODE HERE***"
        prev, current = 0, 1
        while True:
            yield prev
            prev, current = current, prev + current

In this problem, we note that we are making a generator so we're going to need a `yield` statement somewhere in our function. We also note that the `fibonacci` sequence is infinite. With that in mind, we know that we're going to need a `while True` loop somewhere in our generator. To fill in the last part, we just remember the formula for computing the next fibonacci number and add that in as the way to compute our next value!
{% endcapture %}

{% include cs61a/problem_template.md %}