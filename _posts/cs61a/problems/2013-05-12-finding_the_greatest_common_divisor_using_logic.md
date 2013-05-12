---
layout: problem
title: "Finding the Greatest Common Divisor Using Logic"
type: Challenge
tags: [logic programming]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: false
---
<p>
  Using the result of Homework 13 and after implmenting <code>modulus</code> <a href="http://markmiyashita.com/cs61a/sp13/problems/modulus_in_logic/">here</a>, you should be able to take those and write a fact for the greatest common divisor. I would recommending reading the Wikipedia article about using Euclid's method for finding the GCD of two numbers. The link can be found <a href="http://en.wikipedia.org/wiki/Greatest_common_divisor#Using_Euclid.27s_algorithm">here.</a> Post in the comments if you have any questions.
</p>

<pre>
  <code class="prettyprint">
(fact (gcd ***YOUR CODE HERE*** ))


(query (gcd (1 1 1 1) (1 1) ?what))
; expect Success! ; what: (1 1)
  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
    
    </code>
  </pre>
  
  <p>
    
  </p>
</div>
{% endif %}
