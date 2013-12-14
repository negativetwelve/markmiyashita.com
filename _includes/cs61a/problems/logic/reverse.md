{% capture question %}
This problem uses the Logic starter file located [here.]({% code logic_starter %})

Write facts to define `reverse`. You may use anything already included in the starter file as well as other facts defined in previous questions. `reverse` relates two lists with the second being the reversed of the first.

    (fact (reverse ; YOUR CODE HERE ))

    (query (reverse (1 2 3) (3 2 1)))
    ; expect Success!

    (query (reverse (1 2 3) ?what))
    ; expect Success! ; what: (3 2 1)
{% endcapture %}

{% capture solution %}
    (fact (reverse () ()))

    (fact (reverse (?first . ?rest) ?result)
          (reverse ?rest ?new-rest)
          (append ?new-rest (?first) ?result))

We start with the base case. The reverse of the empty list is the empty list.

Moving on to the recursive case, we split up the original list into `first` and `rest`. From there, we need to find the `reverse` of the `rest`, store that as a new value, in this case `new-rest`, and then appending `first` to the end of `new-rest` to get the `result` that we originally wanted.
{% endcapture %}

{% include cs61a/problem_template.md %}
