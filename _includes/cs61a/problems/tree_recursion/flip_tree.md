{% capture question %}
This problem uses the [Tree Class](http://markmiyashita.com/cs61a/code/tree_recursion/tree.py) and the template for this file can be downloaded [here](http://markmiyashita.com/cs61a/code/tree_recursion/flip_tree.py).

In this problem, we want to swap the left and right branches of our tree. Take a look at the doctests and leave comments below if anything is confusing/you want a hint.

    def flip_tree(tree):
        """ Swaps the left and right branches of a tree.
        Does not create a new tree and mutates the original.

        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> flip_tree(t)
        >>> t
        Tree(5, Tree(7, Tree(8), Tree(6)), Tree(1, Tree(4), None))
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def flip_tree(tree):
        """ Swaps the left and right branches of a tree.
        Does not create a new tree and mutates the original.

        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> flip_tree(t)
        >>> t
        Tree(5, Tree(7, Tree(8), Tree(6)), Tree(1, Tree(4), None))
        """
        if tree is None:
            return
        tree.left, tree.right = tree.right, tree.left
        flip_tree(tree.left)
        flip_tree(tree.right)  
{% endcapture %}

{% include cs61a/problem_template.md %}