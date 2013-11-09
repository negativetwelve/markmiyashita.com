{% capture question %}
Write a function in Scheme that zips two lists together. Zip takes in two lists and pairs each of the elements in the first list with the item at the corresponding index of the other list. The output is a list of two-item-lists. The length of the output list is the same as the smallest input list (meaning that the function should stop if you run out of elements in either list).

    (define (zip lst1 lst2)
        ; Your Code Here
                            )

And here's a test to help you out:

    (define (test)
          (assert-equal (zip '(1 3 5) '(2 4 6)) '((1 2) (3 4) (5 6)))
          (assert-equal (zip '(1) '(2 3 4 5 6)) '((1 2)))
          (assert-equal (zip '(1 2 3) '()) '()))

{% endcapture %}

{% capture solution %}
    (define (zip lst1 lst2)
        (if (or (null? lst1) (null? lst2))
            nil
            (cons (list (car lst1) (car lst2)) (zip (cdr lst1) (cdr lst2)))))

If either of the lists is empty, then we're done and we should just return the empty list. Otherwise, we form a list out of the first elements of each list and we pair that with the zipped up version of the remaining parts of each of the lists. The result is our expected list of two-item-lists.
{% endcapture %}

{% include cs61a/problem_template.md %}
