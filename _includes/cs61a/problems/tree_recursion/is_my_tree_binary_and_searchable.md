{% capture question %}
This problem uses the [Tree Class](http://markmiyashita.com/cs61a/code/tree_recursion/tree.py) and the template for this file can be downloaded [here](http://markmiyashita.com/cs61a/code/tree_recursion/is_binary_search_tree.py).

Given an input tree, we want to test if the tree is a binary search tree. A tree is a binary search tree if for each of its branches, all of the values on the left subtree are less than the entry and all of the values on the right subtree are greater than the entry.

    def is_binary_search_tree(tree):
        """
        >>> t = Tree(3, Tree(2), Tree(4))
        >>> is_binary_search_tree(t)
        True
        >>> t = Tree(5, Tree(1, Tree(3)), Tree(6, Tree(10)))
        >>> is_binary_search_tree(t)
        False
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def is_binary_search_tree(tree):
        """
        >>> t = Tree(3, Tree(2), Tree(4))
        >>> is_binary_search_tree(t)
        True
        >>> t = Tree(5, Tree(1, Tree(3)), Tree(6, Tree(10)))
        >>> is_binary_search_tree(t)
        False
        """
        if tree is None:
            return True
        if tree.left and tree.left.entry > tree.entry:
            return False
        if tree.right and tree.right.entry < tree.entry:
            return False
        return is_binary_search_tree(tree.left) and is_binary_search_tree(tree.right)
{% endcapture %}

{% include cs61a/problem_template.md %}