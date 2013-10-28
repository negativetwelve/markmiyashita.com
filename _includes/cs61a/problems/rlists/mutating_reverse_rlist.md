{% capture question %}
Write a function `mutating reverse` that takes in an Rlist and mutates it by reversing the elements in the rlist. The function should not return anything and the original input rlist should be mutated. Hint: You might want to make one, possibly two helper functions. If you're stuck, check out [mutating reverse list]({% link_to_problem recursion/mutable_reverse_list %}) for the same sort of function, except over regular lists instead of rlists.

    def mutating_reverse(rlist):
        """
        >>> r = Rlist(1, Rlist(2, Rlist(3)))
        >>> mutating_reverse(r)
        >>> r
        Rlist(3, Rlist(2, Rlist(1)))
        """
        "***YOUR CODE HERE***"
{% endcapture %}
{% capture solution %}
    def mutating_reverse(rlist):
        """
        >>> r = Rlist(1, Rlist(2, Rlist(3)))
        >>> mutating_reverse(r)
        >>> r
        Rlist(3, Rlist(2, Rlist(1)))
        """
        if rlist is Rlist.empty:
            return
        if rlist.rest is not Rlist.empty:
            item = pop(rlist)
            mutating_reverse(rlist)
            insert_beginning(item, rlist)

    def insert_beginning(item, rlist):
        """
        >>> r = Rlist(1, Rlist(2, Rlist(3)))
        >>> insert_beginning(6, r)
        >>> r
        Rlist(6, Rlist(1, Rlist(2, Rlist(3))))
        """
        if rlist is not Rlist.empty:
            rlist.rest = Rlist(rlist.first, rlist.rest)
            rlist.first = item

    def pop(rlist):
        """Removes the last item from the rlist and returns it.
        >>> r = Rlist(1, Rlist(2, Rlist(3)))
        >>> pop(r)
        3
        >>> r
        Rlist(1, Rlist(2))
        """
        if rlist.rest.rest is Rlist.empty:
            item = rlist.rest.first
            rlist.rest = Rlist.empty
            return item
        return pop(rlist.rest)

That's a lot of code. Let's break this problem down. Our general approach to the `mutating_reverse` function is to `pop` off the last item of the rlist (which mutates the rlist), reverse the rest of the rlist. Then insert the item that we popped off into the beginning of the reversed rlist.

To do this, we write up two helper functions, `insert_beginning` and `pop` which work with rlists to do exactly that. For `insert_beginning`, we're going to take in an `item`, and an `rlist` and mutate the input rlist by adding `item` to the beginning of it.

For `pop`, we're going to iterate over the rlist until we reach the second to last item. From there, we're going to grab the item that we want to return, and then mutate the rlist such that it no longer contains that item. Then we are going to return that item.

{% endcapture %}

{% include cs61a/problem_template.md %}