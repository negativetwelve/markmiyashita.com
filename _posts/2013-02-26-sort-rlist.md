---
layout: problem
title: "Sort Rlist"
type: Challenge
tags: [rlists, recursion]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
---
<div class="description">
  Write a function that sorts an rlist. You might want to look up the <a href="http://en.wikipedia.org/wiki/Insertion_sort">Wikipedia article on Insertion Sort</a> although you are more than welcome to implement any kind of sort you want! Use the <code>first</code> and <code>rest</code> functions that we have defined for rlists and used in class. You may want to define a helper function...
</div>

<pre class="brush: python;">
  def sort_rlist(r):
      """
      >>> r = rlist(4, rlist(3, rlist(6, rlist(8, rlist(1, empty_rlist)))))
      >>> sort_rlist(r)
      (1, (3, (4, (6, (8, None)))))
      """
      "***YOUR CODE HERE***"
</pre>