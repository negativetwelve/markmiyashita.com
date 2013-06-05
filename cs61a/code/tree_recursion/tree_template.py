# Tree class defined for CS61A at UC Berkeley
# Edited by Mark Miyashita
# http://markmiyashita.com/cs61a

class Tree(object):
    """A tree with internal values."""

    def __init__(self, entry, left=None, right=None):
        self.entry = entry
        self.left = left
        self.right = right

    def __repr__(self):
        args = repr(self.entry)
        if self.left or self.right:
            args += ', {0}, {1}'.format(repr(self.left), repr(self.right))
        return 'Tree({0})'.format(args)

    def print(self):
        def print_helper(tree, depth):
            if tree.right:
                print_helper(tree.right, depth + 1)
            print("{0}{1}".format("\t" * depth, tree.entry))
            if tree.left:
                print_helper(tree.left, depth + 1)
        print_helper(self, 0)


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


def in_order_traversal(tree):
    """
    >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
    >>> in_order_traversal(t)
    1
    4
    5
    6
    7
    8
    """
    "***YOUR CODE HERE***"


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


def tree_to_reversed_list(tree):
    """
    >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
    >>> tree_to_reversed_list(t)
    [8, 7, 6, 5, 4, 1]
    """
    "***YOUR CODE HERE***"


def flip_tree(tree):
    """ Swaps the left and right branches of a tree.
    Does not create a new tree and mutates the original.

    >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
    >>> flip_tree(t)
    >>> t
    Tree(5, Tree(7, Tree(8), Tree(6)), Tree(1, Tree(4), None))
    """
    "***YOUR CODE HERE***"


def insert(item, tree):
    """
    >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
    >>> insert(2, t)
    >>> t
    Tree(5, Tree(1, None, Tree(4, Tree(2), None)), Tree(7, Tree(6), Tree(8)))
    """
    "***YOUR CODE HERE***"


