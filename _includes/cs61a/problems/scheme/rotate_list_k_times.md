{% capture question %}
Write a function in Scheme that rotates a list by k elements. Rotating a list by 1 consists of moving the first item to the end of the list. Rotating a list by k consists of moving the first k items to the end of the list. `k` can be any number (not constrained by the size of the list).

    (define (rotate lst k)
        ; Your Code Here
                            )

And here's a test to help you out:

    (define (test)
          (assert-equal (rotate '(1 2 3 4) 3) '(4 1 2 3))
          (assert-equal (rotate '(1 2) 3) '(2 1))
          (assert-equal (rotate '(1 2 3 4 5) 10) '(1 2 3 4 5)))

{% endcapture %}

{% capture solution %}
    (define (rotate lst k)
        (cond ((null? lst) lst)
              ((= k 0) lst)
              (else (rotate (append (cdr lst) (list (car lst))) (- k 1)))))

If `lst` is initially empty, then any input will return the same list (the empty list) so we should just go ahead and return it. If `k` is equal to zero, meaning that there are no more rotations, then return `lst`. Otherwise, we want to `rotate` the list while keeping all of the elements intact. That means appending the first item to the end of the rest of the list. We also want to make sure we decrement `k` by 1 meaning that we just successfully completed one rotation.
{% endcapture %}

{% include cs61a/problem_template.md %}
