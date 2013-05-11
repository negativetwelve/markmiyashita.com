---
layout: problem
title: "Pre Order Traversal (Binary Tree)"
type: Challenge
tags: [recursion, tree recursion]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: false
---
<p>
  This problem uses the <a href="http://markmiyashita.com/cs61a/code/tree_recursion/tree.py">Tree class</a> and the template for this file can be downloaded <a href="http://markmiyashita.com/cs61a/code/tree_recursion/pre_order_traversal.py">here.</a>
</p>

<p>
  This problem is a challenge problem and might touch on some concepts taught mainly in CS61B. However, as a CS61A student who has learned all about tree recursion, you should be able to complete a problem like this.
</p>

<p>
  We like to be able to traverse our trees in order to get all of the elements back into some sort of list. We can traverse the tree in many different ways. Pre Order Traversal is one of them and the algorithm goes like this. First, we will print out or current value, then, we will recursively print out all the values to our left, then recursively print out all the values on the right. Take a look at the doctests below if you are still confused. Post in the comments section if you are still confused after reading the doctests.
</p>

<pre>
  <code class="prettyprint">
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
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
    
    </code>
  </pre>
  
  <p>
    
  </p>
</div>
{% endif %}
