{% capture question %}
Here are a series of functions, what would Python do? Draw the environment diagram that this produces.

    def f(x, y):
        x, y = y, x
        def x(x):
            return y(x)
        return x

    def y(x):
        return 6 + x

    def z(y):
        return 4

    g = f(y, z)
    h = g(5)


{% endcapture %}
{% capture solution %}
Remember, when you __call__ a function, you always need to make a new frame! Let's take a closer look at the function call here:

    g = f(y, z)

First, remember that when you have an assignment statement, you evaluate the _right_ side first. We also have to remember that we have to evaluate our arguments before we make the frame for the function call. For this line, that means evaluating what `y` is equal to and what `z` is equal to.

So we make a new frame for `f` and bind our parameters to the arguments that are passed into the function. That means binding the local variable `x` is bound to the global function `y` and the local variable `y` bound to the global function `z`.

The next line I want to point out is:

    x, y = y, x

Remember that in an assignment statement, we __always__ evaluate the right side first. In the context of this line, that means that we have to figure out what `y` and `x` evaluate to. We notice that if we evaluate both of the items on the right side, then assign them to the left, we're effectively swapping their values.

Again, follow the [rules of environment diagrams]({% link_to_note rules_of_environment_diagrams %}) to finish solving this one.

Here's a visualization of the final output. Leave comments below if you are confused on a certain step.


<iframe width="800" height="600" frameborder="0" src="http://pythontutor.com/iframe-embed.html#code=def+f(x,+y)%3A%0A++++x,+y+%3D+y,+x%0A++++def+x(x)%3A%0A++++++++return+y(x)%0A++++return+x%0A%0Adef+y(x)%3A%0A++++return+6+%2B+x%0A%0Adef+z(y)%3A%0A++++return+4%0A%0Ag+%3D+f(y,+z)%0Ah+%3D+g(5)&mode=display&cumulative=true&heapPrimitives=&drawParentPointers=&textReferences=&showOnlyOutputs=&py=3&curInstr=0"></iframe>


{% endcapture %}
{% include cs61a/problem_template.md %}
