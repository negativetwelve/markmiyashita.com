{% capture question %}
This problem uses the Tree Class defined [here.]({% code tree %})

Given an input tree, we want to test if the tree is a binary search tree. A tree is a binary search tree if for each of its branches, all of the values on the left subtree are less than the entry and all of the values on the right subtree are greater than the entry.

    def is_binary_search_tree(tree):
        """
        >>> t = Tree(3, Tree(2), Tree(4))
        >>> is_binary_search_tree(t)
        True
        >>> t = Tree(5, Tree(1, Tree(3)), Tree(6, Tree(10)))
        >>> is_binary_search_tree(t)
        False
        >>> s = Tree(10, Tree(5, Tree(3, None, Tree(4))), Tree(20, Tree(15), Tree(30, None, Tree(40, Tree(31)))))
        >>> is_binary_search_tree(s)
        True
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
        >>> s = Tree(10, Tree(5, Tree(3, None, Tree(4))), Tree(20, Tree(15), Tree(30, None, Tree(40, Tree(31)))))
        >>> is_binary_search_tree(s)
        True
        """
        def is_bst_helper(tree, min_value, max_value):
            if tree is None:
                return True
            check_left = is_bst_helper(tree.left, min_value, tree.entry)
            check_right = is_bst_helper(tree.right, tree.entry, max_value)
            if tree.entry > min_value and tree.entry <= max_value and check_left and check_right:
                return True
            return False
        return is_bst_helper(tree, -float('inf'), float('inf'))
{% endcapture %}

{% include cs61a/problem_template.md %}
