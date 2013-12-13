{% capture question %}
This problem uses the Logic starter file located [here.]({% code logic_starter %})

Write facts to define `not-equal`. You may use anything already included in the starter file as well as other facts defined in previous questions. `not-equal` relates two numbers and displays `Success!` if the first number is not equal to the second number. Currently, not equal only works with numbers.

    (fact (not-equal ; YOUR CODE HERE))

    (query (not-equal 5 1))
    ; expect Success!

    (query (not-equal 3 3))
    ; expect Failed.
{% endcapture %}

{% capture solution %}
    (fact (not-equal ?x ?y)
          (sub ?x ?y ?num)
          (greater-than-or-equal ?num 1))

    (fact (not-equal ?x ?y)
          (sub ?y ?x ?num)
          (greater-than-or-equal ?num 1))

There are two possible cases that two numbers are not equal. Either the first number is greater than the second or the second is greater than the first. So, we must define two facts to account for each of these cases. In both cases, we subtract one from the other and if that result is greater than or equal to 1, then they are different and we should display `Success!`.
{% endcapture %}

{% include cs61a/problem_template.md %}
