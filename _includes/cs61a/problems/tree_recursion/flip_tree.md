<p>
  This problem uses the <a href="http://markmiyashita.com/cs61a/code/tree_recursion/tree.py">Tree class</a> and the template for this file can be downloaded <a href="http://markmiyashita.com/cs61a/code/tree_recursion/flip_tree.py">here.</a>
</p>

<p>
  In this problem, we want to swap the left and right branches of our tree. Take a look at the doctests and leave comments below if anything is confusing/you want a hint.
</p>

<pre>
  <code class="prettyprint">
def flip_tree(tree):
    """ Swaps the left and right branches of a tree.
    Does not create a new tree and mutates the original.

    >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
    >>> flip_tree(t)
    >>> t
    Tree(5, Tree(7, Tree(8), Tree(6)), Tree(1, Tree(4), None))
    """
    "***YOUR CODE HERE***"
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
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
    </code>
  </pre>
  
  <p>
    
  </p>
</div>
{% endif %}
