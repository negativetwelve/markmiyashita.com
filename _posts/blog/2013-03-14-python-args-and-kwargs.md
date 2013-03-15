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

In Python, there are two special symbols that you can use when defining functions to allow them to take in a variable number of arguments. The syntax is to use the symbol <code>\*</code> to take in a variable number of arguments; by convention, it is often used with the word <code>args</code>. What <code>\*args</code> allows you to do is take in more arguments than the normal of formal arguments that you previously defined. With <code>\*args</code>, any number of extra arguments can be tacked on to your current formal parameters (including zero extra arguments). Here's an example which should make this clear:


<pre>
  <code class="prettyprint">
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
  </code>
</pre>

What can this be used for? Plenty of things. Say we wanted to make a multiply function that took in a any number of arguments and was able to multiply them all together. We could do this using *args. Here's another example:

<pre>
  <code class="prettyprint">
from operator import mul
from functools import reduce

def multiply(*args):
    return reduce(mul, args)

>>> multiply(3, 5, 1, 5)
75
  </code>
</pre>

Using the <code>\*</code>, the variable that we associate with the <code>\*</code> becomes an iterable meaning you can do things like iterate over it, run some higher order functions such as <code>map</code> and <code>filter</code>, etc.

One last thing, you can also use the <code>\*</code> syntax to break up an iterable into it's individual elements. Here's an example:

<pre>
  <code class="prettyprint">
def print_three(a, b, c):
    print(a, b, c)

>>> r = [1, 2, 3]
>>> print_three(*r)   # notice that the list gets broken up into three arguments
1 2 3
  </code>
</pre>


So, what does the <code>\*\*</code> stand for then? For starters, by convention, we use the name <code>kwargs</code> with the double star. The reason is because the double star allows us to pass through keyword arguments (and any number of them too!). A keyword argument is where you provide a name to the variable as you pass it into the function. Here's an exmaple which should make it more clear:

<pre>
  <code class="prettyprint">
def print_table(**kwargs):
    for key, value in kwargs.items():
        print(key, value)

>>> print_table(a = 5, b = 6, c = 7)
b 6
c 7
a 5
  </code>
</pre>

Whoa, what just happened? Notice the syntax, within <code>print_table(a = 5, b = 6, c = 7)</code>, <code>a = 5</code>, <code>b = 6</code>, and <code>c = 7</code> are all keyword arguments. You can think of the <code>kwargs</code> as being a dictionary that maps each keyword to the value that you pass alongside it. That is why when we iterate over the <code>kwargs</code> there doesn't seem to be any order in which they were printed out.

I hope that this short article helped clarify what <code>\*args</code> and <code>\*\*kwargs</code> can be used for! Leave any questions or comments in the section below!
