{% capture question %}
Write a function in Scheme that reverses a nested list. The output should be a new list that is the reverse of the original list and it should keep the nesting intact. It should also reverse all of the elements of the nested lists.

    (define (nested-reverse lst)
        ; Your Code Here
                            )

And here's a test to help you out:

    (define (test)
          (assert-equal '(1 2 3) (nested-reverse '(3 2 1)))
          (assert-equal '(((((6) 5) 4) (3 2) 1)) (nested-reverse '(1 (2 3) (4 (5 (6))))))
          (assert-equal '() (nested-reverse '())))

{% endcapture %}

{% capture solution %}
    (define (nested-reverse lst)
        (cond ((null? lst) lst)
              ((list? (car lst))
                      (append (nested-reverse (cdr lst)) (list (nested-reverse (car lst)))))
            (else (append (reverse-nested (cdr lst)) (list (car lst))))))

This problem is very similar to `reverse` and `flatten`. The idea is that we first check to see if we have more elements to work with. If we don't, then we just return the empty list. Then, we check what the first item of the list is. If it, itself, is a list, then we need to reverse it's contents. To do that, we recursively call `nested-reverse` on the `car` of the list. Then, we append the result to the end of the result of `nested-reverse`(ing) the rest of the list. 

In the case where the first element is not a list, then we can just reverse the list like we normally would. We do this by taking the first item and appending it on to the back of the list. Remember, in order to use `append`, we need to make sure that we have two lists. To get around this requirement, we simply make a one-item list with just the first element. Then, we can successfully use `append` to solve the problem.
{% endcapture %}

{% include cs61a/problem_template.md %}
