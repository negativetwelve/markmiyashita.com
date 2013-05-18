{% capture question %}
  This problem uses the [Tree Class](http://markmiyashita.com/cs61a/code/tree_recursion/tree.py) and the template for this file can be downloaded [here](http://markmiyashita.com/cs61a/code/tree_recursion/post_order_traversal.py).

This problem is a challenge problem and might touch on some concepts taught mainly in CS61B. However, as a CS61A student who has learned all about tree recursion, you should be able to complete a problem like this.

We like to be able to traverse our trees in order to get all of the elements back into some sort of list. We can traverse the tree in many different ways. Post Order Traversal is one of them and the algorithm goes like this. First, we will recursively print out all the values to our left, then, we will recursively print out all the values on the right, finally, we will print out the current node's entry. Take a look at the doctests below if you are still confused. Post in the comments section if you are still confused after reading the doctests.

    def post_order_traversal(tree):
        """
        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> post_order_traversal(t)
        4
        1
        6
        8
        7
        5
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def post_order_traversal(tree):
        """
        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> post_order_traversal(t)
        4
        1
        6
        8
        7
        5
        """
        if tree is None:
            return
        post_order_traversal(tree.left)
        post_order_traversal(tree.right)
        print(tree.entry)
{% endcapture %}

{% include cs61a/problem_template.md %}