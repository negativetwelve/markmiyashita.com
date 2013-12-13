{% capture question %}
This problem uses the Logic starter file located [here.]({% code logic_starter %})

Write facts to define `includes`. You may use anything already included in the starter file as well as other facts defined in previous questions. `includes` checks to see if the first item is contained within the second item which is a list.

    (fact (includes ; YOUR CODE HERE ))

    (query (includes 1 (1 2 3)))
    ; expect Success!

    (query (includes ?item (1 2 3 4)))
    ; expect Success! ; item: 1 ; item: 2 ; item: 3 ; item: 4
{% endcapture %}

{% capture solution %}
    (fact (includes ?item (?item . ?anything)))

    (fact (includes ?item (?something . ?rest))
          (includes ?item ?rest))

Our base fact checks to see if the item that we're looking for is the first item of the list. If it is, we're good to go and should see a `Success!`. On the other hand, if the first item isn't what we're looking for, then we should check the rest of the list. So, in our recursive fact, we break up the list into `something` and `rest` and check to see if `item` is located in the `rest`.
{% endcapture %}

{% include cs61a/problem_template.md %}
