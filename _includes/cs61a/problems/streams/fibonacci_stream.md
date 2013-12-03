{% capture question %}
Write a function that returns a stream that represents the fibonacci series. Your implementation should be pretty short!

    def make_fibonacci_stream():
        """
        >>> fib = make_fibonacci_stream()
        >>> fib.first
        0
        >>> fib.rest.first
        1
        >>> fib.rest.rest.first
        1
        """
        "***YOUR CODE HERE***"

{% endcapture %}

{% capture solution %}
    def make_fibonacci_stream():
        """
        >>> fib = make_fibonacci_stream()
        >>> fib.first
        0
        >>> fib.rest.first
        1
        >>> fib.rest.rest.first
        1
        """
        "***YOUR CODE HERE***"
        def make_fib_helper(prev, current):
            def compute_rest():
                return make_fib_helper(current, prev + current)
            return Stream(prev, compute_rest)
        return make_fib_helper(0, 1)

Remember, we're making a stream! That means that we need at least three components. We need to define a `compute_rest` function that takes in `zero arguments` and the function should return a `Stream` object. With these three components in mind, we get to work. First, we realize that we need to keep track of two variables, `prev` and `current`. In order to keep track of these variables, we create a helper function that takes in two values. From there, we define our `compute_rest` function that returns a new `Stream`. Then, all that's left is defining the starting values of the `make_fib_helper` stream. This should be quite natural, we just need to remember the first two elements of the `fibonacci` sequence!
{% endcapture %}

{% include cs61a/problem_template.md %}
