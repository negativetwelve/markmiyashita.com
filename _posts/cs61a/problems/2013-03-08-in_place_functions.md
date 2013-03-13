---
layout: problem
title: "In-Place Functions"
type: Challenge
tags: [iteration, in-place]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: false
---
<p>
  This weeks homework had a lot of problems where we wanted you to solve them in-place (meaning without creating a new list). Instead, we wanted you to swap the items in the list and directly modify the input list. Here are a few more practice problems to make sure that you understand how in-place functions work. Write two functions (unrelated to one another) called <code>map_in_place</code> and <code>sort_in_place</code> that each take in a list. <code>map_in_place</code> will modify the original list by mapping the input function over each of the elements of the list. <code>sort_in_place</code> can use any sorting algorithm you want and will modify the original list so that it is sorted after calling this function on it. 
</p>

<pre>
  <code class="prettyprint">
def map_in_place(fn, lst):
    """ Takes in a function, fn, and maps it over each item of the input list, lst.
    Returns None and instead modifies the input list.
    >>> l = [1, 2, 3, 4]
    >>> map_in_place(lambda x: x * x, l)
    >>> l
    [1, 4, 9, 16]
    """
    "***YOUR CODE HERE***"
      
def sort_in_place(lst):
    """ Takes in a list and sorts it in-place, just like the builtin .sort() method does.
    >>> l = [1, 4, 3, 2]
    >>> sort_in_place(l)
    >>> l
    [1, 2, 3, 4]
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
