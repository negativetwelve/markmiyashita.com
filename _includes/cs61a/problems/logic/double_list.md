{% capture question %}
This problem uses the Logic starter file located [here.]({% code logic_starter %})

Write facts to define `double-length`. You may use anything already included in the starter file as well as other facts defined in previous questions. `double-length` releates two lists with the second list being a copy of the first list with every element repeated twice.

    (fact (double-list ; YOUR CODE HERE ))

    (query (double-list (1 2 3) (1 1 2 2 3 3)))
    ; expect Success!

    (query (length (1 2) ?what))
    ; expect Success! ; what: (1 1 2 2)
{% endcapture %}

{% capture solution %}
    (fact (double-list () ()))

    (fact (double-list (?first . ?rest) (?first ?first . ?new-rest))
          (double-list ?rest ?new-rest))

In our base fact, we note that the `double-list` of the empty list is just the empty list. In our recursive case, we focus on breaking up our first list into `first` and `rest`, then we note that the second list is just the same as the original with an extra item, `first` added in the middle.
{% endcapture %}

{% include cs61a/problem_template.md %}
