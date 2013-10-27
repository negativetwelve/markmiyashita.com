{% capture question %}
Write a function that sorts an rlist. You might want to look up the [Wikipedia article on Insertion Sort](http://en.wikipedia.org/wiki/Insertion_sort) although you are more than welcome to implement any kind of sort you want! Use the Rlist class that we have been using in class. You may want to define a helper function...

    def sort_rlist(r):
        """
        Sort an rlist in ascending order.
        
        >>> r = Rlist(4, Rlist(3, Rlist(6, Rlist(8, Rlist(1)))))
        >>> sort_rlist(r)
        Rlist(1, Rlist(3, Rlist(4, Rlist(6, Rlist(8)))))
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def sort_rlist(r):
        """
        Sort an rlist in ascending order.
        
        >>> r = Rlist(4, Rlist(3, Rlist(6, Rlist(8, Rlist(1)))))
        >>> sort_rlist(r)
        Rlist(1, Rlist(3, Rlist(4, Rlist(6, Rlist(8)))))
        """
        if r is Rlist.empty:
            return r
        return insert(r.first, sort_rlist(r.rest))

    def insert(item, r):
        """
        Inserts item into r in sorted order.
        
        >>> r = Rlist(4, Rlist(6, Rlist(8)))
        >>> insert(5, r)
        Rlist(4, Rlist(5, Rlist(6, Rlist(8))))
        """
        if r is Rlist.empty:
            return Rlist(item)
        if item <= r.first:
            return Rlist(item, r)
        return Rlist(r.first, insert(item, r.rest))

First off, I want to state that this problem was very challenging. If you didn't get it, don't fret!
    
Let's take a look at what this function is doing and how the `insert` function works. The `insert` function takes in an item and an rlist and inserts it as soon as it finds a number in the list that is bigger than it. This means that it assumes that everything before it is already sorted. For example, if our list was (1, (3, (6, (7, None)))) and we want to insert 4, it will first compare itself to 1, then 3, then 6. When it gets to 6, it realizes that it is less than that value and inserts itself just before the 6.

Now let's take a look at the actual `sort_rlist` function. This function will continue to sort the rest of the rlist until it is equal to the empty rlist. At each recursive call, it is inserting the first of the rlist (in the doctest above, it first tries to insert 3) into the correct position _of the already sorted rlist_. This is the most important fact here. The `sort_rlist` function does not return the rlist until it has completely finished sorting what it currently has. That means that at each iteration, we are inserting the current item into an already sorted list AND if we correctly insert the current item then the rlist remains sorted. The output if the final sorted rlist.
{% endcapture %}

{% include cs61a/problem_template.md %}