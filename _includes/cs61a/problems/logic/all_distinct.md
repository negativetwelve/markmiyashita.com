{% capture question %}
This problem uses the Logic starter file located [here.]({% code logic_starter %})

Write facts to define `all-distinct`. You may use anything already included in the starter file as well as other facts defined in previous questions. `all-distinct` relates any number of elements and displays `Success!` if all of the elements in the rest of the list are unique. Again, this only works for numbers.

    (fact (all-distinct ; YOUR CODE HERE))

    (query (all-distinct 5 1))
    ; expect Success!

    (query (all-distinct 3 2 4 5 6 3))
    ; expect Failed.
{% endcapture %}

{% capture solution %}
    (fact (all-distinct))
    (fact (all-distinct ?a))

    (fact (all-distinct ?first ?second . ?rest)
          (not-equal ?first ?second)
          (all-distinct ?first . ?rest)
          (all-distinct ?second . ?rest))

If there are no elements, then the list is entirely unique. If there is only one element, we're also guaranteed that it is unique. So, in our recursive fact, we're guaranteed that there are at least two elements. We break up the elements into three parts. Then, we want to check to make sure that the `first` and `second` elements are not equal, then we want to compare the `first` elements against all of the `rest` as well as comparing the `second` element against the `rest`.
{% endcapture %}

{% include cs61a/problem_template.md %}
