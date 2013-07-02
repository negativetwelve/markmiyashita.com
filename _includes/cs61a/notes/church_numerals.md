* Table of Contents
{:toc}

#### What are Church Numerals?

[Church numerals](http://en.wikipedia.org/wiki/Church_encoding#Computation_with_Church_numerals) come from [lambda calculus](http://en.wikipedia.org/wiki/Lambda_calculus) and are based upon the idea that you can represent numbers by using a series of nested functions. At the most basic level, we have zero which can be defined as:

    def zero(f):
        return lambda x: x

Or simply, the function for zero does not depend on the input function. It simply returns a function that takes in an argument and returns the same value. Now let's take a look at one.

    def one(f):
        return lambda x: f(x)

What's going on here? We note that one is simply the same function as zero except with `f` applied once. As we look at two, we start to see a pattern:

    def two(f):
        return lambda x: f(f(x))

A church numeral is basically just a funtion that takes in a value which we call `x`, it then takes the input function, `f` and applies it to the value `x`, `n` times. In this case, `n` is the number that we are representing.

#### Add One

So this is pretty easy, huh? Let's take it to another level. Let's define a function that can add 1 to a church numberal. If I call this function on the church numeral, `one`, I should get back a function that is similar to the function `two` that we defined above.

    def add_one(n):
        """Returns the church numeral that is one more than the input n."""
        "***YOUR CODE HERE***"

Here's what we came up with:

    def add_one(n):
        return lambda f: lambda x: f(n(f)(x))

Why and how does this work? Let's break it down. First, let's call this on our church numeral `one` that we defined earlier.

    add_one(one)

The return value looks something like this:

    lambda f: lambda x: f(one(f)(x))

Which also looks like:

    lambda f: lambda x: f((lambda g: lambda y: g(y))(f)(x))

This may look a little confusing at first, but let's examine what we did here. I substituted the function `one` with `lambda g: lambda y: g(y)`. If you remember the lecture from lambdas, we can call lambdas as soon as we define them and that is exactly what is going on here. We're calling `(lambda g: lambda y: g(y))` on `f` immediately after it's defined. This means that we can replace every `g` with `f`. Basically, we've stated that the function call `(lambda g: lambda y: g(y))(f)` reduces to `(lambda y: f(y))`. We can do the same thing for the `x` that is also tacked onto the end of the function call. This time, we see that `(lambda y: f(y))(x)` reduces to `f(x)`. So, we finally see that the complex lambda expression that resulted from calling `add_one(one)` reduces all the way down to the following:

    lambda f: lambda x: f(f(x))

Which, if we look up above, is the same as the function two! Looks like it worked! 

#### Add

We can even make this more general, instead of only adding one to our church numberal, we can extend this to adding two church numerals together. Let's take a look at how that would work.

    def add(m, n):
        """Return the church numeral for m + n where m and n are Church Numerals."""
        "***YOUR CODE HERE***"

Here's what we came up with:

    def add(m, n):
        return lambda f: lambda x: m(f)(n(f)(x))

Well what do we see here? We notice that the only difference between this function and the `add_one` function that we defined above is in this one, we're calling `m(f)` wheras in the other one, we simply has `f`. Say that `m` is `one` and `n` is also `one`, we can follow the same evaluation rules as before and we see that the exact same result comes out of `(n(f)(x))`. Now, we have `lambda f: lambda x: m(f)f(x)`. Let's reduce the `m(f)` call, substituting the function `one` for `m`, we get:

    one(f)

    lambda x: f(x)

Plugging that into the previous simplified `f(x)`, we see that we end up with the following lambda:

    lambda f: lambda x: (lambda y: f(y))(f(x))

Which reduces down to:

    lambda f: lambda x: f(f(x))

because the `y` value can be substituted with `f(x)`. If we look at this, we see that again, we added the two church numerals `one` and `one` and got `two`! Yay, we can do math again! 

The same ideas can be applied to multiplication and the power functions. Just remember to reduce your lambda calls as soon as you have all of the parameters to call them. Then you can start simplifying the return statements and getting it down to something you can visualize.

Post any questions or comments in the comments below!