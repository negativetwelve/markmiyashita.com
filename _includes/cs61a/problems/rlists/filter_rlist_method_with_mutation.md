{% capture question %}
This problem uses the Rlist Class defined [here.]({% code rlist %})

Let's write a __method__ `filter` that is part of the `Rlist` class. It takes in a function and keeps all of the elements
that satisfy the function. This method should __mutate__ the rlist that this method is called on. You may assume that the rlist
that this is being called on has at least one element that will remain in the list after it has been filtered. In other words,
this `Rlist` cannot magically turn into an `EmptyRlist`.

    def filter(self, fn):
        """ Mutates the rlist and modifies it such that the elements that
        do not satisfy the function are removed.

        >>> s = Rlist(1, Rlist(2, Rlist(3)))
        >>> s.filter(lambda x: x%2 == 1)
        >>> s
        Rlist(1, Rlist(3))
        >>> r = Rlist(2, Rlist(1))
        >>> r.filter(lambda x: x%2 == 1)
        >>> r
        Rlist(1)
        >>> x = Rlist(1)
        >>> x.filter(lambda x: x%2 == 1)
        >>> x
        Rlist(1)
        >>> y = Rlist(1, Rlist(2, Rlist(2)))
        >>> y.filter(lambda x: x%2 == 1)
        >>> y
        Rlist(1)
        >>> z = Rlist(2, Rlist(1, Rlist(2)))
        >>> z.filter(lambda x: x%2 == 1)
        >>> z
        Rlist(1)
        >>> q = Rlist(2, Rlist(2, Rlist(1)))
        >>> q.filter(lambda x: x%2 == 1)
        >>> q
        Rlist(1)
        >>> p = Rlist(2, Rlist(2, Rlist(1, Rlist(3, Rlist(2)))))
        >>> p.filter(lambda x: x%2 == 1)
        >>> p
        Rlist(1, Rlist(3))

        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def filter(self, fn):
        """
        >>> s = Rlist(1, Rlist(2, Rlist(3)))
        >>> s.filter(lambda x: x%2 == 1)
        >>> s
        Rlist(1, Rlist(3))
        >>> r = Rlist(2, Rlist(1))
        >>> r.filter(lambda x: x%2 == 1)
        >>> r
        Rlist(1)
        >>> x = Rlist(1)
        >>> x.filter(lambda x: x%2 == 1)
        >>> x
        Rlist(1)
        >>> y = Rlist(1, Rlist(2, Rlist(2)))
        >>> y.filter(lambda x: x%2 == 1)
        >>> y
        Rlist(1)
        >>> z = Rlist(2, Rlist(1, Rlist(2)))
        >>> z.filter(lambda x: x%2 == 1)
        >>> z
        Rlist(1)
        >>> q = Rlist(2, Rlist(2, Rlist(1)))
        >>> q.filter(lambda x: x%2 == 1)
        >>> q
        Rlist(1)
        >>> p = Rlist(2, Rlist(2, Rlist(1, Rlist(3, Rlist(2)))))
        >>> p.filter(lambda x: x%2 == 1)
        >>> p
        Rlist(1, Rlist(3))
        """
        if not fn(self.first):
            self.first = self.rest.first
            self.rest = self.rest.rest
            self.filter(fn)
        elif self.rest is Rlist.empty:
            return
        elif not fn(self.rest.first):
            if self.rest.rest is Rlist.empty:
                self.rest = Rlist.empty
            else:
                self.rest.first = self.rest.rest.first
                self.rest.rest = self.rest.rest.rest
                self.filter(fn)
        else:
            self.rest.filter(fn)

This problem was really difficult so definitely don't feel discouraged if you weren't able
to come up with a solution. Here is my thought process for when I tried to solve the problem:

I looked at many different cases (as seen by my doctests) and determined several things. You
need to make sure that both the current element, and the next element are both valid (meaning that
they are either valid because of the function or they are the empty rlist).

First, we check to see if the first element is __not__ valid. If it's not, we need to adjust some
pointers such that we can check the next value. After reassigning the first and rest, we can simply call
`self.filter(fn)` again since we have reduced the length of the rlist by 1. Because of this, we won't reach
infinite recursion because our rlist is getting smaller.

In the second case, I check to see if the next item is valid. If it isn't and the next, next item is the empty,
then I can simply set my `rest` to be the empty list and be done. If there are more elements after the next, next
item, then we reassign the next element, and recursively call `self.filter(fn)` again.

Finally, if the first and second elements are both valid, we can move on and call `filter` on the rest of the list
which we see in the final `else` clause.
{% endcapture %}

{% include cs61a/problem_template.md %}
