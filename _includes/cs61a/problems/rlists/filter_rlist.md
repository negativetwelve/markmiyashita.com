<p>
  We want to define a function <code>filter_rlist</code> that takes in a function and an rlist and returns a new rlist that keeps all the items that satisfy the given input function. For this, we will be using the functional representation of our rlists using tuples and we will have the following constructors and selectors to use:
</p>

<pre>
  <code class="prettyprint">
empty_rlist = None

def rlist(first, rest):
    return (first, rest)

def first(r):
    return r[0]

def rest(r):
    return r[1]
  </code>
</pre>

<pre>
  <code class="prettyprint">
def filter_rlist(fn, r):
    """
    Takes in a function, fn, and an rlist, r.
    Returns a new rlist that keeps all the elements
    that satisfy the given function.

    >>> r = rlist(1, rlist(4, rlist(5, rlist(3, rlist(9, empty_rlist)))))
    >>> filter_rlist(lambda x: x % 2 == 0, r)
    (4, None)
    """
    "***YOUR SOLUTION HERE***"
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
def filter_rlist(fn, r):
    """
    Takes in a function, fn, and an rlist, r.
    Returns a new rlist that keeps all the elements
    that satisfy the given function.

    >>> r = rlist(1, rlist(4, rlist(5, rlist(3, rlist(9, empty_rlist)))))
    >>> filter_rlist(lambda x: x % 2 == 0, r)
    (4, None)
    """
    if r == empty_rlist:
        return r
    if fn(first(r)):
        return rlist(first(r), filter_rlist(fn, rest(r)))
    return filter_rlist(fn, rest(r))
    </code>
  </pre>
  
  <p>
    Bsically, we want to check to see if the first element of our rlist satisfies the input function. If it does, then we need construct a new rlist, keeping the first element, and recursively applying the filter on the rest. If it does not satisfy the function, then we can just recurse on the rest and that will disregard the current element. Finally, our base case is when we have the <code>empty_rlist</code>. When we have an <code>empty_rlist</code>, we don't have to filter anything else out because we've already filtered everything!
  </p>
</div>
{% endif %}
