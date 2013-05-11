---
layout: note
title: "Tail Recursion and Tail Optimized Calls"
tags: [tail recursion]
categories: [cs61a, sp13, notes]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
---

Frist off, I think this is an excellent article to read about tail recursion and tail calls in Python: <a href="http://paulbutler.org/archives/tail-recursion-in-python/">http://paulbutler.org/archives/tail-recursion-in-python/</a>

Basically, you can write tail recursive functions in any language. Tail recursion, in one sentence, is where you return the answer in the final frame instead of following the frames back up to the original frame. For example, we have factorial which is normally not tail recursive:

<pre>
  <code class="prettyprint">
def factorial(n):
    if n == 1:
        return 1
    return n * factorial(n - 1)
  </code>
</pre>

because it needs to keep track of the <code>n *</code> at each level of recursion.

The following implementation of <code>factorial</code>, is tail recursive because at the end of the last frame, it can return the answer, instead of going back up through all the frames to multiply and compute the answer:

<pre>
  <code class="prettyprint">
def factorial(n):
    def helper(n, total):
        if n == 1:
            return total
        return helper(n - 1, total * n)
    return helper(n, 1)
  </code>
</pre>

You can't have tail optimized calls in Python -- at least, not like the code that we defined above. You can define your own sort of tail optimized way of evaluating the functions by using lambdas, and I believe the article linked at the top of this post goes into detail about how to implement this if you are interested. In Scheme, the language detects when you have something like the helper function in the example above where your return statement consists of only the recursive call. In the first example, we have the <code>n *</code> and the recursive call which means it cannot be tail optimized because it needs to keep track of all of the frames that it creates. In a tail optimized call, Scheme will get rid of the frames that are no longer necessary.

<b>tl;dr</b> -- Tail recursion can be done in any language where the basic idea is that you return the answer in the final frame of recursion. Tail optimized calls are a Scheme (and some other languages, not including Python) feature where it will get rid of the frames above, if certain conditions are met -- such as where the return statement is only the recursive call and nothing else. The cases in which Scheme uses a tail optimized call are located on the lecture slides located <a href="http://www-inst.eecs.berkeley.edu/~cs61a/sp13/slides/35-TailCalls_6pp.pdf">here.</a>