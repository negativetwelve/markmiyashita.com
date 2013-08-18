---
layout: post
title: "Python *args and **kwargs"
tags: [python]
categories: [blog]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239
date: 2013-03-14 15:38:00 -7

published: true
---

In Python, there are two special symbols that you can use when defining functions to allow them to take in a variable number of arguments. The syntax is to use the symbol `*` to take in a variable number of arguments; by convention, it is often used with the word `args`. What `*args` allows you to do is take in more arguments than the normal of formal arguments that you previously defined. With `*args`, any number of extra arguments can be tacked on to your current formal parameters (including zero extra arguments). Here's an example which should make this clear:

    def func_with_two(one, two):
        """
        This function only takes in two arguments because we explicitly
        defined two formal parameters. Any more or any less will cause an
        error.
        """

    def func_with_start_args(*args):
        """
        This function can take in any number of arguments, including zero!
        """

    def func_with_both(one, two, *args):
        """
        This function requires <i>at least</i> two arguments. The *args at the end
        says that it can take just two arguments or any number of arguments as long
        as there are at least two.
        """

What can this be used for? Plenty of things. Say we wanted to make a multiply function that took in a any number of arguments and was able to multiply them all together. We could do this using *args. Here's another example:

    from operator import mul
    from functools import reduce

    def multiply(*args):
        return reduce(mul, args)

    >>> multiply(3, 5, 1, 5)
    75

Using the `*`, the variable that we associate with the `*` becomes an iterable meaning you can do things like iterate over it, run some higher order functions such as `map` and `filter`, etc.

One last thing, you can also use the `*` syntax to break up an iterable into it's individual elements. Here's an example:

    def print_three(a, b, c):
        print(a, b, c)

    >>> r = [1, 2, 3]
    >>> print_three(*r)   # notice that the list gets broken up into three arguments
    1 2 3

So, what does the `**` stand for then? For starters, by convention, we use the name `kwargs` with the double star. The reason is because the double star allows us to pass through keyword arguments (and any number of them too!). A keyword argument is where you provide a name to the variable as you pass it into the function. Here's an exmaple which should make it more clear:

    def print_table(**kwargs):
        for key, value in kwargs.items():
            print(key, value)

    >>> print_table(a = 5, b = 6, c = 7)
    b 6
    c 7
    a 5

Whoa, what just happened? Notice the syntax, within `print_table(a = 5, b = 6, c = 7)`, `a = 5`, `b = 6`, and `c = 7` are all keyword arguments. You can think of the `kwargs` as being a dictionary that maps each keyword to the value that you pass alongside it. That is why when we iterate over the `kwargs` there doesn't seem to be any order in which they were printed out.

I hope that this short article helped clarify what `*args` and `**kwargs` can be used for! Leave any questions or comments in the section below!
