{% capture question %}
Given the functions below, analyze the run time of each in Big Theta notation.

    def factorial(n):
        if n < 2:
            return 1
        return n * factorial(n - 1)

    def fib(n):
        if n < 2:
            return 1
        return fib(n - 1) + fib(n - 2)

    def foo(n):
        while n > 1:
            print(n)
            n = n // 2

    def bar(n):
        while n > 1:
            x = n
            while x > 1:
                print(n, x)
                x -= 1
            n -= 1

    def baz(n):
        while n > 1:
            x = n
            while x > 1:
                print(n, x)
                x = x // 2
            n -= 1

    def buffalo(n):
        while n > 0:
            if n % 7 == 0:
                return n
            n -= 1

    def tricycle(n):
        sum = 0
        for i in range(n):
            for j in range(n):
              sum += j
        return sum

    def yoyo(n):
        total, counter = 0, 0
        for i in range(n):
            while counter == 0:
                total += (i + counter)
                counter += 1
            return total

    def toilet(n):
        i = n
        def boss(n):
            nonlocal i
            print(n)
            if i > 0:
                i -= 1
                boss(i)
            return i
        return boss(n // 2)
{% endcapture %}

{% capture solution %}
    def factorial(n):
        if n < 2:
            return 1
        return n * factorial(n - 1)

&#920;(n)

    def fib(n):
        if n < 2:
            return 1
        return fib(n - 1) + fib(n - 2)

For the sake of this class, this is exponential and approximately &#920;(2<sup>n</sup>). It is not exactly &#920;(2<sup>n</sup>) and you will learn more about this in CS61B.

    def foo(n):
        while n > 1:
            print(n)
            n = n // 2

&#920;(log n)

    def bar(n):
        while n > 1:
            x = n
            while x > 1:
                print(n, x)
                x -= 1
            n -= 1

&#920;(n<sup>2</sup>)

    def baz(n):
        while n > 1:
            x = n
            while x > 1:
                print(n, x)
                x = x // 2
            n -= 1

&#920;(n log n)

    def buffalo(n):
        while n > 0:
            if n % 7 == 0:
                return n
            n -= 1

&#920;(1)

    def tricycle(n):
        sum = 0
        for i in range(n):
            for j in range(n):
              sum += j
        return sum

&#920;(n<sup>2</sup>)

    def yoyo(n):
        total, counter = 0, 0
        for i in range(n):
            while counter == 0:
                total += (i + counter)
                counter += 1
            return total

&#920;(1)

    def toilet(n):
        i = n
        def boss(n):
            nonlocal i
            print(n)
            if i > 0:
                i -= 1
                boss(i)
            return i
        return boss(n // 2)

&#920;(n)
{% endcapture %}

{% include cs61a/problem_template.md %}