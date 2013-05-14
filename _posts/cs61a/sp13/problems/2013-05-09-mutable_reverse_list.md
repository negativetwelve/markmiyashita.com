---
layout: problem
title: "Mutable Reverse List"
type: Challenge
tags: [recursion, mutable]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: true
---
<p>
  In this problem, we want to do several things and we want to do them all at once. First, we want to reverse the input list; however, we also want to mutate the input list. In addition, we add the restriction that we want to do this recursively. 
</p>

<pre>
  <code class="prettyprint">
def mutable_reverse(lst):
    """
    >>> l = [1, 4, 5, 1, 4]
    >>> mutable_reverse(l)
    >>> l
    [4, 1, 5, 4, 1]
    >>> l = [1, 4, 5, 1, 4, 5]
    >>> mutable_reverse(l)
    >>> l
    [5, 4, 1, 5, 4, 1]
    """
    "***YOUR CODE HERE***"
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <p>
    There are several solutions to this problem. Some are more efficient, some have fewer lines, but all work. Here are a few that you guys came up with during the review session today. Send me an email if this was your solution and I'll include your name here!
  </p>

  <pre>
    <code class="prettyprint">
def mutable_reverse(lst):
    """
    >>> l = [1, 4, 5, 1, 4]
    >>> mutable_reverse(l)
    >>> l
    [4, 1, 5, 4, 1]
    >>> l = [1, 4, 5, 1, 4, 5]
    >>> mutable_reverse(l)
    >>> l
    [5, 4, 1, 5, 4, 1]
    """
    def helper(index, lst):
        if len(lst) % 2 == 0 and index == len(lst) // 2 or len(lst) % 2 == 1 and index == len(lst) // 2 + 1:
            return
        lst[index], lst[len(lst) - 1 - index] = lst[len(lst) - 1 - index], lst[index]
        helper(index + 1, lst)
    helper(0, lst)

def mutable_reverse(lst):
    """
    >>> l = [1, 4, 5, 1, 4]
    >>> mutable_reverse(l)
    >>> l
    [4, 1, 5, 4, 1]
    >>> l = [1, 4, 5, 1, 4, 5]
    >>> mutable_reverse(l)
    >>> l
    [5, 4, 1, 5, 4, 1]
    """
    if len(lst) > 0:
        item = lst.pop()
        mutable_reverse(lst)
        lst.insert(0, item)
    </code>
  </pre>
  
  <p>
    The first keeps track of an index of which values it has returned. When it reaches halfway, it stops.
  </p>

  <p>
    The second solution is very elegant and it takes advantage of using recursion as an implicit stack. Don't worry if you don't know what that it, you'll learn all about stacks in CS61B. Basically, when drawing out the environment diagram, we're keeping the variable <code>item</code> at each level and then inserting it at the beginning as we traverse back up the frames. 
  </p>
</div>
{% endif %}
