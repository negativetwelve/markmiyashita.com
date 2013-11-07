{% capture question %}
Write a function in Scheme that reverses a list. The output should be a new list that is the reverse of the original list.

    (define (reverse lst)
        ; Your Code Here
                            )

And here's a test to help you out:

    (define (test)
          (assert-equal '(1 2 3) (reverse '(3 2 1)))
          (assert-equal '(3) (reverse '(3)))
          (assert-equal '() (reverse '())))

{% endcapture %}

{% capture solution %}
    (define (reverse lst)
        (if (null? lst)
            lst
            (append (reverse (cdr lst)) (list (car lst)))))

In this problem, we first check to make sure that the input `lst` is not empty. If it is, we can just return the empty list. Otherwise, we want to take off the first item, reverse the rest of the list, and then attach the original first item to the end of the reversed list.

We note that we have to use `append` in this case because of the way that `cons` works. `cons` works by creating a pair out of two elements. If we want to use `cons` to form a list, we'd have to have a list as the second argument. In this case, all we have is an element, the first item of the list. By using `append`, we can reverse the rest of the list (getting a list back) and then create a one-item list out of the first element and attach it to the end of the reversed list.
{% endcapture %}

{% include cs61a/problem_template.md %}
