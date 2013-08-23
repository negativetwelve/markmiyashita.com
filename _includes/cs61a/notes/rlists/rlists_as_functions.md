* Table of Contents
{:toc}

#### Introduction

<!--start-->
What exactly are rlists? rlists are a CS61A abstraction that defines a series of pairs that connect together by accessing the `first` and `rest` elements of the pair. We have defined the following constructs for our rlist abstraction:
<!--end-->

    empty_rlist = None

    def rlist(first, rest):
        return (first, rest)

    def first(r):
        return r[0]

    def rest(r):
        return r[1]

What does this mean for us? This means that for any rlist, we only have access to the first element of the list and a way to get the rest of the items (which is also an rlist). The idea is simple, but we can do powerful things with rlists.

#### Data Abstraction

This rlist abstraction is considered an abstraction in the first place because we can change how rlists are stored and accessed. For example, we can define our class as follows and the code that we write (assuming we don't break any abstraction barriers ourselves) would still work.

    empty_rlist = lambda x: None

    def rlist(first, rest):
        return lambda x: (first, rest)

    def first(r):
        return r(None)[0]

    def rest(r):
        return r(None)[1]

    def show(r):
        if r == empty_rlist:
            return None
        return (first(r), show(rest(r)))

Notice how we had to add a new function, `show` that takes in an rlist and actually gives us readable output. Otherwise, we would be staring at `<function rlist<locals>.<lambda> at 0x1006f07a0>` all day because our new abstraction returns functions.

Okay, abstractions aside, let's figure out how to tackle these rlist problems!

#### Constructors and Selectors

__Always, always, always__ remember that we only have access to two things in our rlist, the `first` element, and the rlist that consists of the `rest` of the elements. Generally, you won't usually see many nested calls (for example: `first(rest(rest()))`) because we usually let recursion take care of the actual traversing part.

Let's walk through an example. Say we wanted to write a function, `less_rlist` that keeps all elements in the rlist that are less than the given input, `n`. How would we approach this problem?

    def less_rlist(r, n):
        """
        Takes in an rlist, r, and a number n.
        Returns a new rlist with all the elements from the original
        rlist that are less than n.

        >>> r = rlist(1, rlist(2, rlist(5, rlist(3, empty_rlist))))
        >>> less_rlist(r, 3)
        (1, (2, None))
        """

I recommend starting with the base case. Once we figure that out, we know when to stop, and we can focus on getting our input down to that level. For this question, and for most rlists in general, we want to think about our smallest input. For an rlist, that smallest input is the `empty_rlist`. When we input the `empty_rlist`, we expect to get back the `empty_rlist` because all the elements (none in this case) are less than n. So we can now write one of our base cases.

    def less_rlist(r, n):
        if r == empty_rlist:
            return r

Now we need to determine if there are any more base cases. For this question, we also have to consider the case when the item that we are currently on is less than the number n. What do we need to do when this is true? We need to just continue recursing on the rest of the list while keeping this element in our new rlist. What do we need to do when it's false? We need to also recurse on the rest of our rlist, BUT, we don't need to keep the current item and we can just keep going. Let's write the if case.

    def less_rlist(r, n):
        if r == empty_rlist:
            return r
        if first(r) < n:
            return rlist(first(r), less_rlist(rest(r), n))

The only single element that we can check is the one that we are currently on. The way we access this element is by calling the function, `first` on our rlist. Like we said above, when this is true, we need to construct an rlist with the first element being in our new rlist and the rest of the rlist is just the result of calling the same function on the rest. By calling the function on the rest of our rlist, we are making our way to the base case. Let's finish up the function. What do we do in the recursive case? We just call the same function on our rest and we forget about the current element because it does not satisfy the condition of being less than n. Let's write it.

    def less_rlist(r, n):
        if r == empty_rlist:
            return r
        if first(r) < n:
            return rlist(first(r), less_rlist(rest(r), n))
        return less_rlist(rest(r), n)

That wasn't so bad was it? Try some of the extra recursive rlist questions below!
