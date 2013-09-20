{% capture question %}
Write a function that computes the greatest common divisor between `x` and `y`. Hint: Use `mod`. If you want another hint, check out [Euclid's Algorithm](http://en.wikipedia.org/wiki/Euclidean_algorithm).

    def gcd(x, y):
        """
        >>> gcd(20, 4)
        4
        >>> gcd(21, 81)
        3
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def gcd(x, y):
        if y == 0:
            return x
        return gcd(y, x % y)

This problem takes a little bit of math intuition. If you pay close attention, you'll notice that the `mod` operator actually helps us find the greatest common divisor. The reason is because when `mod` returns `0`, we've successfully found out that those two numbers are divisible by one another. That means that they are in fact divisors. Since we're taking the modulo each time, we're getting closer and closer to zero. Any integer mod 1 is zero so we can use that as our base case. When I've exhasuted all of the numbers except 1, I know that there won't be able possible values that are smaller than 1 and are the `gcd` of any positive number, so I've reached my base case.
{% endcapture %}

{% include cs61a/problem_template.md %}
