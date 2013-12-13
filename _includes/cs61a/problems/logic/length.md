{% capture question %}
This problem uses the Logic starter file located [here.]({% code logic_starter %})

Write facts to define `length`. You may use anything already included in the starter file as well as other facts defined in previous questions.

    (fact (length ; YOUR CODE HERE ))

    (query (length (1 2 3) 3))
    ; expect Success!

    (query (length (1 2 3 4 5) ?length))
    ; expect Success! ; length: 5
{% endcapture %}

{% capture solution %}
    (fact (length () 0))

    (fact (length (?first . ?rest) ?num)
        (increment ?some-num ?num)
        (length ?rest ?some-num))

First we define our base fact. The length of the empty list is 0. Then, in our recursive fact, we break up the list into `first` and `rest`. The length of the entire list is the length of the `rest` incremented by 1. So, we create a temporary variable `some-num` that relates the length of the `rest` with the length of the entire list.
{% endcapture %}

{% include cs61a/problem_template.md %}
