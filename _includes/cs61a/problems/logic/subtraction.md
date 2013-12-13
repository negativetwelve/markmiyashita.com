{% capture question %}
This problem uses the Logic starter file located [here.]({% code logic_starter %})

Write facts to define subtraction. You may use anything already included in the starter file linked above.

    (fact (sub ; YOUR CODE HERE ))
{% endcapture %}

{% capture solution %}
    (fact (sub ?x ?y ?z)
          (add ?z ?y ?x))

Here, we only need to define one fact because the base case is caught by in `add`. Subtraction is just addition with the arguments switched around so instead of x - y = z, we just manipulate it such that we have z + y = x.

{% endcapture %}

{% include cs61a/problem_template.md %}
