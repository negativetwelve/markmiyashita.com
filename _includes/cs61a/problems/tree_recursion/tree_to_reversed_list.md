{% capture question %}
This problem uses the [Tree Class](http://markmiyashita.com/cs61a/code/tree_recursion/tree.py) and the template for this file can be downloaded [here](http://markmiyashita.com/cs61a/code/tree_recursion/tree_to_reversed_list.py).

In this problem, the input is a binary tree and the output is a list. The list is formed by getting the rightmost entry first. If you haven't already, the traversal questions located [here](http://markmiyashita.com/cs61a/sp13/problems/trees_trees_everywhere/) may help you.

    def tree_to_reversed_list(tree):
        """
        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> tree_to_reversed_list(t)
        [8, 7, 6, 5, 4, 1]
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def tree_to_reversed_list(tree):
        """
        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> tree_to_reversed_list(t)
        [8, 7, 6, 5, 4, 1]
        """
        lst = []
        if tree is not None:
            if tree.right:
                lst.extend(tree_to_reversed_list(tree.right))
            lst.append(tree.entry)
            if tree.left:
                lst.extend(tree_to_reversed_list(tree.left))
        return lst
{% endcapture %}

{% include cs61a/problem_template.md %}