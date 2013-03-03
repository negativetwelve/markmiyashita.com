---
layout: problem
title: "Longest Length of the Same Character in a String"
type: Challenge
tags: [recursion, strings]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
---
<div class="description">Write a function that finds the length of the longest contiguous string of the same character and returns that length. Implement it recursively (you probably don't want to do it iteratively but you're free to try!) You may use the functions <code>first</code> and <code>rest</code> defined below.

<h5>Hint #1: You might want to use a helper function...</h5>
<h5>Hint #2: Your helper function might want to include the following information (maybe more):</h5>

<pre class="brush: python;">
  def helper(word, prev_char, curr_count, curr_max):
      "***YOUR CODE HERE***"
</pre>

Make sure that your function works on all inputs, including the empty string! Here are the functions <code>first</code> and <code>rest</code> that we have been working with in class.
</div>
        
<pre class="brush: python;">
  def first(word):
      return word[0]
    
  def rest(word):
      return word[1:]
</pre>

<pre class="brush: python;">
  def find_longest_run(word):
      """ Finds the length of the longest contiguous string of a single character and returns the length.
      >>> find_longest_run("hello")
      2
      >>> find_longest_run("helloooo")
      4
      """
      "***YOUR CODE HERE***"
</pre>
