{% capture question %}
If we were to type these Python statements and expressions into the interpreter, what would they do? These all either evaluate to a value, an error, or another function. These start out fairly easy and get pretty tough by then end. Remember your rules for evaluating lambdas!

    >>> x = lambda: 4
    >>> y = lambda x: x + 3
    >>> z = lambda x: y
    >>> z(4)(1)               #1

    >>> z(5)(1)               #2

    >>> h = lambda f, g: g(f)
    >>> h(lambda x: x * 2, lambda x: x)(2)      #3

    >>> g = lambda f: f(f)
    >>> g(g(lambda x: x))(3)  #4

    >>> g(g(lambda x: x))(lambda x: x + 5)(1)   #5

    >>> a = lambda b: lambda a: b(a)
    >>> b = lambda b: lambda b: b + 1
    >>> a(b)                #6

    >>> a(b)(1)(2)          #7

    >>> b(a)(5)             #8

    >>> b(a(b))(7)          #9

    >>> c = lambda a, b: (b, a)
    >>> b(a(c))(5)          #10

    >>> c(a, b)[1](b)(1)(2) #11

    >>> c(b(1), b(2))[0](5) #12

You can break this question up into subquestions. The first part is numbers 1-2, second part is 3-5, third part is 6-12.

{% endcapture %}

{% capture solution %}
1. 4
2. 4
3. 4
4. 3
5. 6
6. function
7. 3
8. 6
9. 8
10. 6
11. 3
12. 6

{% endcapture %}

{% include cs61a/problem_template.md %}
