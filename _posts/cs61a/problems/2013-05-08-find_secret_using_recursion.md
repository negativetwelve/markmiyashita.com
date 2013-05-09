---
layout: problem
title: "Find Secret (Using Recursion)"
type: Challenge
tags: [recursion, strings]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: true
---
<p>
  We want to see if the letters within out "secret" can be found, in order, in the given sentence. If it is, we will return back a list of indices that we will use as a secret code. If the secret word's letters cannot be found within the sentence, then we have failed and should return False. Yes, this problem can be done using iteration instead of recursion, but let's stick to practicing recursion. Hint: You might want to use a helper.
</p>

<pre>
  <code class="prettyprint">
def find_secret(secret, sentence):
    """
    If the individual letters of the secret are in order within the sentence,
    then the function reutrns the list of indices of those letters. If not, it returns False.

    >>> secret = "mark"
    >>> sentence = "hi my name is ridiculously karl."
    >>> find_secret(secret, sentence)
    [3, 7, 14, 27]
    >>> find_secret("hello", sentence)
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
def find_secret(secret, sentence):
    """
    If the individual letters of the secret are in order within the sentence,
    then the function reutrns the list of indices of those letters. If not, it returns False.

    >>> secret = "mark"
    >>> sentence = "hi my name is ridiculously karl."
    >>> find_secret(secret, sentence)
    [3, 7, 14, 27]
    >>> find_secret("hello", sentence)
    False
    """
    def helper(secret, sentence, indices, index):
        if len(secret) == 0:
            return indices
        if len(sentence) == 0:
            return False
        if secret[0] == sentence[0]:
            return helper(secret[1:], sentence[1:], indices + [index], index + 1)
        return helper(secret, sentence[1:], indices, index + 1)
    return helper(secret, sentence, [], 0)
    </code>
  </pre>
  
  <p>
    If we have a secret that is the empty string, then that automatically exists in our sentence so we return the indices that we have accumulated. If the sentence itself is empty and the secret is not empty, then we have failed and must return False.
  </p>

  <p>
    In our recursive cases, we have either found the letter or we have not. If we have found the letter, then we reduce our secret and our sentence by cutting off the first letter. We also increase our index by 1 to move to the next position in the sentence and we also add the current index to our list of indices. 
  </p>
  
  <p>
    If we did not find the letter, we just pass through the same secret and we reduce our sentence by one character, keep the indices the same because we didn't find anything and increase our index by 1. The index just helps us keep track of where we are within the sentence. 
  </p>
</div>
{% endif %}
