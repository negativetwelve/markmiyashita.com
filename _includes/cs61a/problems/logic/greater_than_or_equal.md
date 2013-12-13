{% capture question %}
This problem uses the Logic starter file located [here.]({% code logic_starter %})

Write facts to define `greater-than-or-equal`. You may use anything already included in the starter file as well as other facts defined in previous questions. `greater-than-or-equal` relates two numbers and displays `Success!` if the first number is greater than or equal the second the number.

    (fact (greater-than-or-equal ; YOUR CODE HERE))

    (query (greater-than-or-equal 5 1))
    ; expect Success!

    (query (greater-than-or-equal 1 3))
    ; expect Failed.

    (query (greater-than-or-equal ?what 1))
    ; expect Success! ; what: 1 ; what: 2 ; what: 3 ; what: 4 ; what: 5 ; what: 6 ; what: 7 ; what: 8 ; what: 9 ; what: 10 ; what: 11 ; what: 12 ; what: 13
{% endcapture %}

{% capture solution %}
    (fact (greater-than-or-equal ?x ?y)
          (add ?y ?something ?x))

There are multiple ways to solve this problem and here's one of those solutions. First, we note that there isn't an explicit base case! This is because we have defined the number 0 and the relation `add`. `x` is greater than or equal to `y` if you can find something to `add` to `y` to get `x`. If they are equal, you can add `zero` to make this relation true.

Here's an alternate solution (watch out for hitting the infinite recursion depth):

    (fact (greater-than-or-equal ?a ?a))

    (fact (greater-than-or-equal ?x ?y)
          (increment ?y ?y+1)
          (greater-than-or-equal ?x ?y+1))

This solution explicitly defines a base case of when the two numbers are equal. From there, the recursive fact keeps incrementing the second number until it is equivalent to the first. Using this solution, you might not get all of the answers because the logic interpreter might hit the maximum recursion depth, so watch out for that.
{% endcapture %}

{% include cs61a/problem_template.md %}
