---
layout: problem
title: "Map and Filter Rlist (Object Version)"
type: Warmup
tags: [rlists, oop, higher order functions]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: true
---
<p>
  We've already seen how to implement <code>map</code> and <code>filter</code> using our tuple/functional abstraction for rlists, now let's implement the same functions using the class version. You should be able to write these from scratch but here are the previous implementations of <a href="http://markmiyashita.com/cs61a/sp13/problems/map_rlist/">map</a> and <a href="http://markmiyashita.com/cs61a/sp13/problems/filter_rlist/">filter</a>. Here is the class Rlist that we will be using as our abstraction.
</p>

<pre>
  <code class="prettyprint">
class Rlist(object):
    """A recursive list consisting of a first element and the rest.

    >>> s = Rlist(1, Rlist(2, Rlist(3)))
    >>> len(s)
    3
    >>> s[0]
    1
    >>> s[1]
    2
    >>> s[2]
    3
    """
    class EmptyList(object):
        def __len__(self):
            return 0
    empty = EmptyList()

    def __init__(self, first, rest=empty):
        self.first = first
        self.rest = rest

    def __repr__(self):
        f = repr(self.first)
        if self.rest is Rlist.empty:
            return 'Rlist({0})'.format(f)
        else:
            return 'Rlist({0}, {1})'.format(f, repr(self.rest))

    def __len__(self):
        return 1 + len(self.rest)

    def __getitem__(self, i):
        if i == 0:
            return self.first
        return self.rest[i - 1]
  </code>
</pre>

<p>
  Let's write our functions <code>map</code> and <code>filter</code> that work for the Rlist class. Here are some blank functions to fill in:
</p>

<pre>
  <code class="prettyprint">
def map_rlist(fn, s):
    """ Return an Rlist resulting from mapping fn over the elements of s.

    >>> s = Rlist(1, Rlist(2, Rlist(3)))
    >>> map_rlist(lambda x: x * x, s)
    Rlist(1, Rlist(4, Rlist(9)))
    """
    "***YOUR CODE HERE***"

def filter_rlist(fn, s):
    """ Return an Rlist that removes all of the elements that do not satisfy
    the input function.

    >>> s = Rlist(1, Rlist(2, Rlist(3)))
    >>> filter_rlist(lambda x: x%2==0, s)
    Rlist(2)
    """
    "***YOUR CODE HERE***"
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
def map_rlist(fn, s):
    """ Return an Rlist resulting from mapping fn over the elements of s.

    >>> s = Rlist(1, Rlist(2, Rlist(3)))
    >>> map_rlist(lambda x: x * x, s)
    Rlist(1, Rlist(4, Rlist(9)))
    """
    if s is Rlist.empty:
        return s
    return Rlist(fn(s.first), map_rlist(fn, s.rest))

def filter_rlist(fn, s):
    """ Return an Rlist that removes all of the elements that do not satisfy
    the input function. 

    >>> s = Rlist(1, Rlist(2, Rlist(3)))
    >>> filter_rlist(lambda x: x%2==0, s)
    Rlist(2)
    """
    if s is Rlist.empty:
        return s
    if fn(s.first):
        return Rlist(s.first, filter_rlist(fn, s.rest))
    return filter_rlist(fn, s.rest)
    </code>
  </pre>
  
  <p>
    Our implementations for the functions remain the same as before when we had a different abstraction. The only thing that has changed is the fact that we now call our first and rest in different ways. Previously, we used <code>first(r)</code>, now we call <code>r.first</code>.
  </p>

  <p>
    For map, we still want to return the empty rlist when the input is the empty rlist. Then, we want to apply the function to the first item of our rlist and recursively call map on the rest of our rlist.
  </p>

  <p>
    For filter, we want to check if the first item satisfies our input function. If it does satisfy the function, then we can keep that item and recursively call filter on the rest of our rlist. If it does not, then we can ignore the first item entirely and recursively call filter on the rest of the rlist.
  </p>
</div>
{% endif %}
