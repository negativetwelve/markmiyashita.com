{% capture question %}
Note: this problem is quite long. It's very good practice though and if you can successfully complete this problem, you are pretty csolid on environment diagrams! Draw out the following environment diagram:

    def f(x):
        def y(f):
            return f(x)
        return y

    def g(x):
        return f(x)

    def h(x):
        return x * 2

    def z(s):
        return s + 2

    y = g(5)
    z = y(z)

{% endcapture %}

{% capture solution %}
Here's a visualization of the environment diagram. If you are stuck, remember the [rules of environment diagrams]({% link_to_note rules_of_environment_diagrams %}).

The number one thing to remember is that when you __call__ a function, you always need to make a new frame! And, also remember that functions have to keep track of their parent frames when they are not defined in the global frame. What that means is the nested function `y(f)` has a parent frame because it's defined inside of the `f` frame.


<iframe width="800" height="1020" frameborder="0" src="http://pythontutor.com/iframe-embed.html#code=def+f(x)%3A%0A++++def+y(f)%3A%0A++++++++return+f(x)%0A++++return+y%0A%0Adef+g(x)%3A%0A++++return+f(x)%0A%0Adef+h(x)%3A%0A++++return+x+*+2%0A%0Adef+z(s)%3A%0A++++return+s+%2B+2%0A%0Ay+%3D+g(5)%0Az+%3D+y(z)%0Ap+%3D+y(h)&mode=edit&cumulative=true&heapPrimitives=&drawParentPointers=&textReferences=&showOnlyOutputs=&py=3"></iframe>

{% endcapture %}
{% include cs61a/problem_template.md %}
