{% capture question %}
Write a function `rotate_by_k` that takes in an rlist and a number k and rotates the input rlist, k times. One rotation involves taking the first item of the rlist and moving it to the end. This function should mutate the input meaning that it does not return anything and instead modifies the input rlist.

    def rotate_by_k(rlist, k):
        """
        >>> r = Rlist(1, Rlist(2, Rlist(3, Rlist(4))))
        >>> rotate_by_k(r, 2)
        >>> r
        Rlist(3, Rlist(4, Rlist(1, Rlist(2))))
        """
        "***YOUR CODE HERE***"
{% endcapture %}
{% capture solution %}
    def rotate_by_k(rlist, k):
        """
        >>> r = Rlist(1, Rlist(2, Rlist(3, Rlist(4))))
        >>> rotate_by_k(r, 2)
        >>> r
        Rlist(3, Rlist(4, Rlist(1, Rlist(2))))
        """
        if rlist is not Rlist.empty and k > 0:
            item = rlist.first
            rlist.first = rlist.rest.first
            rlist.rest = rlist.rest.rest
            add_to_end(rlist, item)
            rotate_by_k(rlist, k - 1)

    def add_to_end(rlist, item):
        """
        >>> r = Rlist(1, Rlist(2, Rlist(3)))
        >>> add_to_end(r, 6)
        >>> r
        Rlist(1, Rlist(2, Rlist(3, Rlist(6))))
        """
        if rlist.rest is Rlist.empty:
            rlist.rest = Rlist(item)
        else:
            add_to_end(rlist.rest, item)

The general idea here is to take off the first item, modify the rlist to remove that item, and then add that item to the end of the rlist. To help us out, we made a helper function `add_to_end` that takes in an rlist and an item and adds the item to the end of the rlist. Once we have this function, we can simply pop off the first item and then call this function to add it to the end.

Each time we call rotate, we decrease `k` by 1 until it is eventually 0.
{% endcapture %}

{% include cs61a/problem_template.md %}