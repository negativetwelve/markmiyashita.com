---
layout: interview_problem
title: "Merge Sort"
categories: [interviews, problems]
tags: [beginner]
languages: [python, ruby]
---

{% capture description %}

Merge sort is a popular conquer and divide sorting algorithm. If you haven't
heard of it before, you should check out the Wikipedia page
[here](http://en.wikipedia.org/wiki/Merge_sort). It has a nice visualization of
the algorithm in action.

A basic outline of the algorithm is as follows:

1. Divide the input list into two sublists until you have `n` lists of one item
each.
2. Repeatedly merge the two sublists together until you obtain the sorted list.

{% endcapture %}

{% include interviews/interview_problem_template.md %}
