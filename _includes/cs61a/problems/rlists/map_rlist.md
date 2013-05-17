Write a function that emulates the fucntionality of `map` but for our implementation of rlists. You may use the functions we have been working with: `first` and `rest`.

    def map_rlist(fn, r):
        """
        Takes in a function, fn, and applies it to all
        items in the input rlist, r.
        
        >>> r = rlist(1, rlist(2, rlist(3, empty_rlist)))
        >>> map_rlist(lambda x: x*x, r)
        (1, (4, (9, None)))
        """
        "***YOUR CODE HERE***"

{% if page.solution %}
[Toggle Solution](#solution){: .solution_toggle}

<div class="solution" markdown="1">
    def map_rlist(fn, r):
        """
        Takes in a function, fn, and applies it to all
        items in the input rlist, r.
        
        >>> r = rlist(1, rlist(2, rlist(3, empty_rlist)))
        >>> map_rlist(lambda x: x*x, r)
        (1, (4, (9, None)))
        """
        if r == empty_rlist
            return r
        return rlist(fn(first(r)), map_rlist(fn, rest(r)))

We want to apply the function, fn, to each item of the rlist so we're going to need to access eah element individually. To do this, we will use recursion to recursively map over the rest of the rlist. We will return the newly created rlist by using the constructor `rlist` which takes in a first and a rest. The first element will be the original first element with the function applied to it.
</div>
{% endif %}