{% capture question %}
This problem uses the [Tree Class](http://markmiyashita.com/cs61a/code/tree_recursion/tree.py) and the template for this file can be downloaded [here](http://markmiyashita.com/cs61a/code/tree_recursion/insert.py).

In this problem we are going to be inserting an item into a binary search tree. Recall that a binary search tree means that all items on the left of the tree are less than the current entry and all items on the right of the tree are greater than the current entry. Note: We cannot insert into an empty tree because of our implementation. Since we are using None as our empty tree, we can't add a `.entry` to None because it is not an object. This function should still work for all other trees though.

    def insert(item, tree):
        """
        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> insert(2, t)
        >>> t
        Tree(5, Tree(1, None, Tree(4, Tree(2), None)), Tree(7, Tree(6), Tree(8)))
        """
        "***YOUR CODE HERE***"
{% endcapture %}

{% capture solution %}
    def insert(item, tree):
        """
        >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
        >>> insert(2, t)
        >>> t
        Tree(5, Tree(1, None, Tree(4, Tree(2), None)), Tree(7, Tree(6), Tree(8)))
        """
        if tree is None:
            return
        elif item < tree.entry:
            if tree.left:
                insert(item, tree.left)
            else:
                tree.left = Tree(item)
        else:
            if tree.right:
                insert(item, tree.right)
            else:
                tree.right = Tree(item)
{% endcapture %}

{% include cs61a/problem_template.md %}