{% capture question %}
Draw out the following environment diagram:

    x = 6
    def x(x):
        return x + y(x)

    def y(x):
        return x

    y(x)(4)
{% endcapture %}

{% capture solution %}
Here's a visualization of the environment diagram. If you are stuck, remember the [rules of environment diagrams]({% link_to_note rules_of_environment_diagrams %}).

<iframe width="800" height="500" frameborder="0" src="http://pythontutor.com/iframe-embed.html#code=x+%3D+6%0Adef+x(x)%3A%0A++++return+x+%2B+y(x)%0A%0Adef+y(x)%3A%0A++++return+x%0A%0Ay(x)(4)&mode=edit&cumulative=true&heapPrimitives=&drawParentPointers=&textReferences=&showOnlyOutputs=&py=3"></iframe>

{% endcapture %}

{% include cs61a/problem_template.md %}
