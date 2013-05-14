<p>
  Write a function that finds the length of the longest contiguous string of the same character and returns that length. Implement it recursively (you probably don't want to do it iteratively but you're free to try!) You may use the functions <code>first</code> and <code>rest</code> defined below.
</p>

<h5>Hint #1: You might want to use a helper function...</h5>
<h5>Hint #2: Your helper function might want to include the following information (maybe more):</h5>

<pre>
  <code class="prettyprint">
def helper(word, prev_char, curr_count, curr_max):
    "***YOUR CODE HERE***"
  </code>
</pre>

Make sure that your function works on all inputs, including the empty string! Here are the functions <code>first</code> and <code>rest</code> that we have been working with in class.
</div>

<pre>
  <code class="prettyprint">
def first(word):
    return word[0]
    
def rest(word):
    return word[1:]
  </code>
</pre>

<pre>
  <code class="prettyprint">
def find_longest_run(word):
    """
    Finds the length of the longest contiguous string
    of a single character and returns the length.
    
    >>> find_longest_run("hello")
    2
    >>> find_longest_run("helloooo")
    4
    """
    "***YOUR CODE HERE***"
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
def helper(word, prev_char, curr_count, curr_max):
    if len(word) == 0:
        return curr_max
    elif first(word) == prev_char:
        return helper(rest(word), first(word), curr_count + 1, max(curr_count + 1, curr_max))
    return helper(rest(word), first(word), 1, curr_max)

def find_longest_run(word):
    """
    Finds the length of the longest contiguous string
    of a single character and returns the length.
    
    >>> find_longest_run("hello")
    2
    >>> find_longest_run("helloooo")
    4
    """
    return helper(word, "", 0, 0)
    </code>
  </pre>
  
  <p>
    We need to keep track of some information between each recursive call so to make our lives easier, we will implement a helper function that takes in 4 arguments. We will analyze the rest of the word, we will need to compare against the previous character, and we will need to keep track of how long our current run is as well as our current longest run. Once we have that, we can figure out what our base case(s) are. For one, if the word that we are checking doesn't have any letters left, then there can't be any characters left to check so we return the curr_max (longest length) that we have found so far. Then, we have two different situations, whether or not the previous character was eqaul to our current character. If it is, then we just add 1 to our curr_count and then compare to see if that new curr_count is greater than our curr_max. If it is, we take the new value. In our other recursive call, we just recurse on the input, but we also set our curr_count to 1 because the characters were not the same so the streak starts over.
  </p>
</div>
{% endif %}