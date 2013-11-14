{% capture question %}
Write a function that appends two Rlists together and returns a new Rlist. The resulting Rlist should be a copy meaning that the input Rlists should not be modified AND modifying the resulting Rlist should not modify the two input Rlists.

    def append_rlist_iter(a, b):
        """
        >>> r = Rlist(1, Rlist(2))
        >>> s = Rlist(3, Rlist(4))
        >>> result = append_rlist_iter(r, s)
        >>> result
        Rlist(1, Rlist(2, Rlist(3, Rlist(4))))
        >>> result.first = 5
        >>> result
        Rlist(5, Rlist(2, Rlist(3, Rlist(4))))
        >>> r
        Rlist(1, Rlist(2))
        >>> s
        Rlist(3, Rlist(4))
        """
        "*** YOUR CODE HERE ***"

Here's what my second discussion came up with. There's a small bug causing the test to not pass, but a few of you wanted me to post what we came up with so that you guys can debug it on your own. Here it is:

    def append_rlist_iter(a, b):
        """
        >>> r = Rlist(1, Rlist(2))
        >>> s = Rlist(3, Rlist(4))
        >>> result = append_rlist_iter(r, s)
        >>> result
        Rlist(1, Rlist(2, Rlist(3, Rlist(4))))
        >>> result.first = 5
        >>> result
        Rlist(5, Rlist(2, Rlist(3, Rlist(4))))
        >>> r
        Rlist(1, Rlist(2))
        >>> s
        Rlist(3, Rlist(4))

        *** Here's what my second discussion came up with. There's a bug! Try and find it ***
        """
        result = Rlist.empty
        final_result = result
        if a is not Rlist.empty:
            result = Rlist(a.first)
            a = a.rest
            while a is not Rlist.empty:
                result.rest = Rlist(a.first)
                a = a.rest
                result = result.rest
        
        if b is not Rlist.empty:
            if result is Rlist.empty:
                result = Rlist(b.first)
                b = b.rest
            while b is not Rlist.empty:
                result.rest = Rlist(b.first)
                b = b.rest
                result = result.rest
        return final_result

My solution will be posted later (along with the recursive and tail-recursive solutions).


{% endcapture %}

{% capture solution %}

{% endcapture %}

{% include cs61a/problem_template.md %}