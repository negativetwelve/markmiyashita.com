Write a function that sorts an rlist. You might want to look up the [Wikipedia article on Insertion Sort](http://en.wikipedia.org/wiki/Insertion_sort) although you are more than welcome to implement any kind of sort you want! Use the `first` and `rest` functions that we have defined for rlists and used in class. You may want to define a helper function...

    def sort_rlist(r):
        """
        Sort an rlist in ascending order.
        
        >>> r = rlist(4, rlist(3, rlist(6, rlist(8, rlist(1, empty_rlist)))))
        >>> sort_rlist(r)
        (1, (3, (4, (6, (8, None)))))
        """
        "***YOUR CODE HERE***"

{% if page.solution %}
[Toggle Solution](#solution){: .solution_toggle}

<div class="solution" markdown="1">
    def sort_rlist(r):
        """
        Sort an rlist in ascending order.
        
        >>> r = rlist(3, rlist(5, rlist(1, rlist(9, rlist(7, None)))))
        >>> sort_rlist(r)
        (1, (3, (5, (7, (9, None)))))
        """
        if r == empty_rlist:
            return r
        return insert(first(r), sort_rlist(rest(r)))

    def insert(item, r):
        """
        Inserts item into r in sorted order.
        
        >>> r = rlist(4, rlist(6, rlist(8, None)))
        >>> insert(5, r)
        (4, (5, (6, (8, None))))
        """
        if r == empty_rlist:
            return rlist(item, empty_rlist)
        if item <= first(r):
            return rlist(item, r)
        return rlist(first(r), insert(item, rest(r)))

First off, I want to state that this problem was very challenging. If you didn't get it, don't fret!
    
Let's take a look at what this function is doing and how the `insert` function works. The `insert` function takes in an item and an rlist and inserts it as soon as it finds a number in the list that is bigger than it. This means that it assumes that everything before it is already sorted. For example, if our list was (1, (3, (6, (7, None)))) and we want to insert 4, it will first compare itself to 1, then 3, then 6. When it gets to 6, it realizes that it is less than that value and inserts itself just before the 6.

Now let's take a look at the actual `sort_rlist` function. This function will continue to sort the rest of the rlist until it is equal to the empty rlist. At each recursive call, it is inserting the first of the rlist (in the doctest above, it first tries to insert 3) into the correct position _of the already sorted rlist_. This is the most important fact here. The `sort_rlist` function does not return the rlist until it has completely finished sorting what it currently has. That means that at each iteration, we are inserting the current item into an already sorted list AND if we correctly insert the current item then the rlist remains sorted. The output if the final sorted rlist.
</div>
{% endif %}
