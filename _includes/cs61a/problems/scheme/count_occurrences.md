{% capture question %}
Write a function in Scheme that counts the number of occurrences of a single item. This function should return a number representing the number of times that `item` appears in `lst`.

    (define (count lst item)
        ; Your Code Here
                            )

And here's a test to help you out:

    (define (test)
          (assert-equal (count '(1 2 3) 1) 1)
          (assert-equal (count '(1 1 1 1 1) 1) 5)
          (assert-equal (count '(1 0 1 0 1) 2) 0))

{% endcapture %}

{% capture solution %}
    (define (count lst item)
        (cond ((null? lst) 0)
              ((= (car lst) item) (+ 1 (count (cdr lst) item)))
              (else (count (cdr lst) item))))

If `lst` is empty, then `item` cannot be inside it so we should return 0. If the first item is equal to `item`, then we should return 1 plus the number of times that `item` appears in the rest of the list. Otherwise, we should just return the number of times that `item` appears in the rest of the list.
{% endcapture %}

{% include cs61a/problem_template.md %}
