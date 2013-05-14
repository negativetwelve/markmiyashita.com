<p>
  In this problem, our input is an item and a sorted list. We want to see if the item exists in the list, but we want to do this search in &#920;(log n). That means that we cannot create copies of the list, we can't slice the list, and we can't just simply iterate through the list. Instead, we will use a technique called binary search. You can find more information about the algorithm <a href="http://en.wikipedia.org/wiki/Binary_search_algorithm">here.</a> 
</p>

<p>
  The idea is that we will first check the middle item. Based off of the middle item, we will decide if we want to go left or right in the tree. If the middle item is less than our input item, then we will go right. If not, we will go left. Note: a helper function may be useful.
</p>

<pre>
  <code class="prettyprint">
def binary_search(item, lst):
    """
    >>> l = [1, 4, 5, 8, 10, 12]
    >>> binary_search(4, l)
    True
    >>> binary_search(9, l)
    False
    """
    "***YOUR CODE HERE***"
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
def binary_search(item, lst):
    """
    >>> l = [1, 4, 5, 8, 10, 12]
    >>> binary_search(4, l)
    True
    >>> binary_search(9, l)
    False
    """
    def helper(item, lst, low, high):
      if low >= high:
          return False
      mid = (low + high) // 2
      if item == lst[mid]:
          return True
      if item < lst[mid]:
          return helper(item, lst, low, mid - 1)
      if item > lst[mid]:
          return helper(item, lst, mid + 1, high)
    return helper(item, lst, 0, len(lst))
    </code>
  </pre>
  
  <p>
    
  </p>
</div>
{% endif %}
