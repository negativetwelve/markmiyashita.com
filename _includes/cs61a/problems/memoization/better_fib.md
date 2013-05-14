<p>
  Remember <code>fib</code>, the function that we created a while ago to find the nth fibonacci number and to show tree recursion? The function was really slow on large inputs because at each level of recursion, it would make two recursive calls to itself AND it would recompute numbers that it already knew. For example, calling <code>fib(3)</code> computes <code>fib(2)</code> once and <code>fib(1)</code> twice. We don't need to compute out <code>fib(1)</code> twice. Using a dictionary, your job is to re-write the function <code>fib</code> so that it only computes a certain recursive call once. (i.e. it only computes <code>fib(1)</code> once) Remember that a dictionary is able to store and look up items using a key-value system. If you want a hint, the idea that we are implementing is called <i>memoization</i>.
</p>

<pre>
  <code class="prettyprint">
def better_fib(n):
    """
    Takes in a number, n, and computes the nth fibonacci
    number recursively. To save time, it will only compute
    each value once and store it in a dictionary. We will
    define better_fib(0) = 0 and better_fib(1) = 1.
      
    >>> better_fib(3)
    2
    >>> better_fib(100)
    354224848179261915075   # this should take less than a second
    """
    "***YOUR CODE HERE***"
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
def better_fib(n):
    """
    Takes in a number, n, and computes the nth fibonacci
    number recursively. To save time, it will only compute
    each value once and store it in a dictionary. We will
    define better_fib(0) = 0 and better_fib(1) = 1.
      
    >>> better_fib(3)
    2
    >>> better_fib(100)
    354224848179261915075   # this should take less than a second
    """
    d = {}
    def fib_helper(n):
        if n in d:
            return d[n]
        if n <= 1:
            d[n] = n
            return n
        d[n] = fib_help(n - 1) + fib_help(n - 2)
        return d[n]
    return fib_helper(n)
    </code>
  </pre>
  
  <p>
    There are several main ideas being tested in this problem. First, the overarching idea is <b>memoization</b>. We want to be able to quickly compute the nth fibonacci number and to do this, we will memoize, or remember, what the previous values that we computed were. To implement this, we will use a dictionary. Now, we could have passed the dictionary through our helper function, but then we would start having multiple copies of the dictionary floating around our function calls. To avoid that, we will be using the final main idea, a mutable data structure. In this problem, by creating the dictionary outside of the inner function, we only have to create one. That dictionary is is accessible by every single recursive call. That means that if we compute <code>fib(7)</code> in one recursive call, but we need it later when evaluating <code>fib(8)</code>, then we can evaluate it immidiately.
  </p>
  <p>
    The function first checks to see if the item is currently in the dictionary. If it is, it returns the value of it immidiately and goes onto the next recursive call. If not, it computes the number, then stores it directly into the dictionary for future access. This saves unnecessary computations that might occur later on.
  </p>
</div>
{% endif %}
