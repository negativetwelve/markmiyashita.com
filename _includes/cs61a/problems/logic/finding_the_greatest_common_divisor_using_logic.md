{% capture question %}
Using the result of Homework 13 and after implmenting `modulus` [here](http://markmiyashita.com/cs61a/sp13/problems/modulus_in_logic/), you should be able to take those and write a fact for the greatest common divisor. I would recommending reading the Wikipedia article about using Euclid's method for finding the GCD of two numbers. The link can be found [here](http://en.wikipedia.org/wiki/Greatest_common_divisor#Using_Euclid.27s_algorithm). Post in the comments if you have any questions.

    (fact (gcd ***YOUR CODE HERE*** ))


    (query (gcd (1 1 1 1) (1 1) ?what))
    ; expect Success! ; what: (1 1)
{% endcapture %}

{% capture solution %}

{% endcapture %}

{% include cs61a/problem_template.md %}