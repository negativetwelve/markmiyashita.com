<p>
  We want to define a function <code>merge_sort</code> that produces a new, sorted list. The algorithm goes as follows: we will take in a list and then split it into two sublists, left and right. We will then recursively call <code>merge_sort</code> on each of the lists so that they are sorted. Once they are sorted, we will iterate through both of the sublists, both sorted, and reconstruct a single sorted list that we will return. You want to define two functions, <code>merge_sort</code> and <code>merge</code>. Merge sort is the outer function that splits the lists and thenrecursively calls itself. Merge is the function that takes in two sorted lists and returns a single sorted list.
</p>

<pre>
  <code class="prettyprint">
def merge_sort(lst):
    """
    Takes in a list and returns the sorted version of it.

    >>> p = [1, 34, 2, 5, 3]
    >>> merge_sort(p)
    [1, 2, 3, 5, 34]
    """
    "***YOUR CODE HERE***"

def merge(l1, l2):
    """
    Takes in two sorted lists and returns a single sorted
    list by merging the elements of both lists together.

    >>> r = [1, 3, 5, 6]
    >>> l = [1, 2, 4, 5]
    >>> merge(l, r)
    [1, 1, 2, 3, 4, 5, 5, 6]
    """
    "***YOUR CODE HERE***"
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
def merge_sort(lst):
    """
    Takes in a list and returns the sorted version of it.

    >>> p = [1, 34, 2, 5, 3]
    >>> merge_sort(p)
    [1, 2, 3, 5, 34]
    """
    "***YOUR CODE HERE***"
    if len(lst) <= 1:
        return lst
    mid = len(lst) // 2
    left = merge_sort(lst[:mid])
    right = merge_sort(lst[mid:])
    return merge(left, right)

def merge(l1, l2):
    """
    Takes in two sorted lists and returns a single sorted
    list by merging the elements of both lists together.

    >>> r = [1, 3, 5, 6]
    >>> l = [1, 2, 4, 5]
    >>> merge(l, r)
    [1, 1, 2, 3, 4, 5, 5, 6]
    """
    "***YOUR CODE HERE***"
    if len(l1) == 0:
        return l2
    if len(l2) == 0:
        return l1
    if l1[0] < l2[0]:
        return [l1[0]] + merge(l1[1:], l2)
    return [l2[0]] + merge(l1, l2[1:])
    </code>
  </pre>
  
  <p>
    In <code>merge_sort</code> we just follow the description of the problem and add in our base case. If we have list that has only one item or zero items, it is already sorted. Then, we split up our elements into a sorted left list and sorted right list and call the merge function on them.
  </p>

  <p>
    The <code>merge</code> function is farily simple. If <code>l1</code> is empty, then merging <code>l2</code> with an empty list is just <code>l2</code>. The same applies to <code>l2</code> being empty. Then, we just need to figure out which element is less, and take that element, place it in front, then recurse on the same two list except one is now one item shorter. The result is a single sorted list!
  </p>
  
</div>
{% endif %}
