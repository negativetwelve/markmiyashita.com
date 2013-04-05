---
layout: problem
title: "Orders of Growth Practice"
type: Warmup
tags: [orders of growth]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: false
---
<p>
  Given the functions below, analyze the run time of each in Big Theta notation.
</p>

<pre>
  <code class="prettyprint">
def factorial(n):
    if n < 2:
        return 1
    return n * factorial(n - 1)

def fib(n):
    if n < 2:
        return 1
    return fib(n - 1) + fib(n - 2)

def foo(n):
    while n > 1:
        print(n)
        n = n // 2

def bar(n):
    while n > 1:
        x = n
        while x > 1:
            print(n, x)
            x -= 1
        n -= 1

def baz(n):
    while n > 1:
        x = n
        while x > 1:
            print(n, x)
            x = x // 2
        n -= 1

def buffalo(n):
    while n > 0:
        if n % 7 == 0:
            return n
        n -= 1

def tricycle(n):
    sum = 0
    for i in range(n):
        for j in range(n):
          sum += j
    return sum

def yoyo(n):
    total, counter = 0, 0
    for i in range(n):
        while counter == 0:
            total += (i + counter)
            counter += 1
        return total

def toilet(n):
    i = n
    def boss(n):
        nonlocal i
        print(n)
        if i > 0:
            i -= 1
            boss(i)
        return i
    return boss(n // 2)
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
