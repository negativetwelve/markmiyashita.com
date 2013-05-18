{% capture question %}
This problem uses the [Tree Class](http://markmiyashita.com/cs61a/code/tree_recursion/tree.py) and the template for this file can be downloaded [here](http://markmiyashita.com/cs61a/code/tree_recursion/pre_order_traversal.py).

This problem is a challenge problem and might touch on some concepts taught mainly in CS61B. However, as a CS61A student who has learned all about tree recursion, you should be able to complete a problem like this.

We like to be able to traverse our trees in order to get all of the elements back into some sort of list. We can traverse the tree in many different ways. Pre Order Traversal is one of them and the algorithm goes like this. First, we will print out or current value, then, we will recursively print out all the values to our left, then recursively print out all the values on the right. Take a look at the doctests below if you are still confused. Post in the comments section if you are still confused after reading the doctests.

    def pre_order_traversal(tree):
        """
        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> pre_order_traversal(t)
        5
        1
        4
        7
        6
        8
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def pre_order_traversal(tree):
        """
        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> pre_order_traversal(t)
        5
        1
        4
        7
        6
        8
        """
        if tree is None:
            return
        print(tree.entry)
        pre_order_traversal(tree.left)
        pre_order_traversal(tree.right)
{% endcapture %}

{% include cs61a/problem_template.md %}