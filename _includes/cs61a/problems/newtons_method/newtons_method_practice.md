{% capture question %}
Recall the following definitions from Newton's Method from discussion:

    def approx_deriv(fn, x, dx=0.00001):
        return (fn(x+dx)-fn(x))/dx

    def newtons_method(fn, guess=1, max_iterations=100):
        ALLOWED_ERROR_MARGIN = 0.0000001
        i = 1
        while abs(fn(guess)) > ALLOWED_ERROR_MARGIN and i <= max_iterations:
            guess = guess - fn(guess) / approx_deriv(fn, guess)
            i += 1
        return guess

If you don't understand Newton's Method at all, be sure to ask your TA during office hours or ask on Piazza.

We want to write a function that will help us find the roots of the following mathematical equation:

    f(x) = x^3 + x + 1

Write a function, `f` that can find the root(s) of the function above.

    def f():
        """Returns at least one root of the equation x^3 + x + 1."""
        "***YOUR CODE HERE***"

Now, we want to make this function more general. How can we write a new function `g` that takes in an argument `y` and finds the roots of:

    f(x, y) = x^3 + y + 1

For any `y` value.

    def g(y):
        """Returns at least one root of the equation x^3 + y + 1.

        >>> round(g(5), 3)
        -1.817
        """
        "***YOUR CODE HERE***"

{% endcapture %}

{% capture solution %}

    def f():
        return newtons_method(lambda x: x**3 + x + 1

    def g(y):
        return newtons_method(lambda x: x**3 + y + 1

{% endcapture %}

{% include cs61a/problem_template.md %}
