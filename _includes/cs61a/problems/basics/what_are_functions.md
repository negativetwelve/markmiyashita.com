---
layout: cs_problem
title: What Are Functions?
type: Warmup
category: basics
tags: [functions]
semesters: [base, su13, fa13]
include: cs61a/problems/basics/what_are_functions.md

published: true
solution: [su13, fa13]
---

{% capture question %}
So far, we've been experimenting with variables, functions, and some basic Python. Here are some questions to help test your knowledge so far. Don't worry if these are hard at first, they will get easier throughout the semester!

What would the following output in Python?

    >>> a = 5
    >>> b = a
    >>> a = 6
    >>> a       #1

    >>> b       #2

    >>> def square(x):
    ...     print(x * x)
    ...     return x
    ...
    >>> a = square(a)
                #3 - what is printed here?
    >>> a       #4

    >>> b = square(square(a))
                #5 - what is printed here?

    >>> b       #6


{% endcapture %}

{% capture solution %}
1. 6
2. 5
3. 36 (printed)
4. 6
5. 36 (printed) <br/>
   36 (printed)
6. 6

{% endcapture %}

{% include cs61a/problem_template.md %}
