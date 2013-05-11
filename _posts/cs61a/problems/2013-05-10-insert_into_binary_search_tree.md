---
layout: problem
title: "Insert Into Binary Search Tree"
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
  This problem uses the <a href="http://markmiyashita.com/cs61a/code/tree_recursion/tree.py">Tree class</a> and the template for this file can be downloaded <a href="http://markmiyashita.com/cs61a/code/tree_recursion/insert.py">here.</a>
</p>

<p>
  In this problem we are going to be inserting an item into a binary search tree. Recall that a binary search tree means that all items on the left of the tree are less than the current entry and all items on the right of the tree are greater than the current entry. Note: We cannot insert into an empty tree because of our implementation. Since we are using None as our empty tree, we can't add a <code>.entry</code> to None because it is not an object. This function should still work for all other trees though.
</p>

<pre>
  <code class="prettyprint">
def insert(item, tree):
    """
    >>> t = Tree(5, Tree(1, None, Tree(4)), Tree(7, Tree(6), Tree(8)))
    >>> insert(2, t)
    >>> t
    Tree(5, Tree(1, None, Tree(4, Tree(2), None)), Tree(7, Tree(6), Tree(8)))
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
