# Tree class defined for CS61A at UC Berkeley
# Edited by Mark Miyashita
# http://markmiyashita.com/cs61a

class Tree(object):
    """ A tree with internal values. """

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

def insert(item, tree):
    """
    >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
    >>> insert(2, t)
    >>> t
    Tree(5, Tree(1, None, Tree(4, Tree(2), None)), Tree(7, Tree(6), Tree(8)))
    """
    "***YOUR CODE HERE***"
    