{% capture question %}
Write a function that takes in an Rlist and mutates it such that it removes the last item (not including the empty Rlist at the end). You can assume that the rlist has at least one element in it.

    def delete_last_item(rlist):
        """
        Removes the last item from an rlist.
        >>> r = Rlist(4, Rlist(3, Rlist(6, Rlist(1))))
        >>> delete_last_item(r)
        >>> r
        Rlist(4, Rlist(3, Rlist(6)))
        """
        "***YOUR CODE HERE***"
{% endcapture %}
{% capture solution %}
    def delete_last_item(rlist):
        """
        Removes the last item from an rlist.
        >>> r = Rlist(4, Rlist(3, Rlist(6, Rlist(1))))
        >>> delete_last_item(r)
        >>> r
        Rlist(4, Rlist(3, Rlist(6)))
        """
        if rlist.rest.rest is Rlist.empty:
            rlist.rest = Rlist.empty
        else:
            delete_last_item(rlist.rest)

Since we can assume that the rlist has at least one element in it, we can safely check to see if the `rlist.rest.rest` is empty or not. If it is, we want to mutate our input rlist and set it's current `rest` to be `Rlist.empty`. If we're not near the end of the `Rlist`, we want to iterate through by recursively calling `delete_last_item` on the rest of the rlist.
    


{% endcapture %}

{% include cs61a/problem_template.md %}