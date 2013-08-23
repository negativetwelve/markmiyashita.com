{% capture question %}
Here are some tuples problems! What would Python output at each of the numbered questions below?

    >>> a = (1, 2, 3)
    >>> b = (3, 2, a)
    >>> a               #1

    >>> b               #2

    >>> b[0] == a[2]    #3

    >>> c = (1, 2, 3)
    >>> a == c          #4

    >>> a is c          #5

    >>> b[2] is c       #6

    >>> b[2] is a       #7

    >>> b[:2]           #8

    >>> c[1:]           #9

    >>> d = (a, b, c)
    >>> d[1:2]          #10

    >>> d[2][2]         #11

    >>> d[1][0]         #12


{% endcapture %}

{% capture solution %}
1. (1, 2, 3)
2. (3, 2, (1, 2, 3))
3. True
4. True
5. False
6. False
7. True
8. (3, 2)
9. (2, 3)
10. ((3, 2, (1, 2, 3)),)
11. 3
12. 3


{% endcapture %}

{% include cs61a/problem_template.md %}
