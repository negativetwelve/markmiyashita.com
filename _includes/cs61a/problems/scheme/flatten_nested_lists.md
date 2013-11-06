{% capture question %}
Write a function in scheme called `flatten` that takes in a nested list (or any arbitrary number of nested items) and returns the flattened version of the list. You may find the helpers `number?`, `integer?`, `pair?`, or `list?` helpful.

    (define (flatten lst)
        ; Your Code Here
                            )

And here's a test to help you out:

    (define (test)
          (assert-equal '(1 2 3) (flatten '(1 (2) 3)))
          (assert-equal '(1 2 3 4 5 6) (flatten '(1 (2 3 4) (5 (6)))))
          (assert-equal '(1 2) (flatten '((1) ((2))))))
{% endcapture %}

{% capture solution %}
    (define (flatten lst)
        (cond ((null? lst) lst)
              ((list? (car lst)) (append (flatten (car lst)) (flatten (cdr lst))))
              (else (cons (car lst) (flatten (cdr lst))))))

For this problem, we have two cases to consider. First, we have to make sure that the list we're iterating over isn't empty. If it is, we can just return it. Second, we have to check to see if the current element is a nested list. If it is, we want to recursively call `flatten` on it. However, we still want to call `flatten` on the rest of the list in order to continue to with the rest of the list.

Once we have those two flattened lists, we need to `append` them together to get a single list. In the last case, if the first element is not a list, then we can just take the first element and `cons` it with the flattened version of the rest of the list.
{% endcapture %}

{% include cs61a/problem_template.md %}