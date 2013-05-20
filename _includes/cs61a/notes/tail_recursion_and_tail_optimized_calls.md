* Table of Contents
{:toc}

Frist off, I think this is an excellent article to read about tail recursion and tail calls in Python: [http://paulbutler.org/archives/tail-recursion-in-python/]

Basically, you can write tail recursive functions in any language. Tail recursion, in one sentence, is where you return the answer in the final frame instead of following the frames back up to the original frame. For example, we have factorial which is normally not tail recursive:

    def factorial(n):
        if n == 1:
            return 1
        return n * factorial(n - 1)

because it needs to keep track of the `n *` at each level of recursion.

The following implementation of `factorial`, is tail recursive because at the end of the last frame, it can return the answer, instead of going back up through all the frames to multiply and compute the answer:

    def factorial(n):
        def helper(n, total):
            if n == 1:
                return total
            return helper(n - 1, total * n)
        return helper(n, 1)

You can't have tail optimized calls in Python -- at least, not like the code that we defined above. You can define your own sort of tail optimized way of evaluating the functions by using lambdas, and I believe the article linked at the top of this post goes into detail about how to implement this if you are interested. In Scheme, the language detects when you have something like the helper function in the example above where your return statement consists of only the recursive call. In the first example, we have the `n *` and the recursive call which means it cannot be tail optimized because it needs to keep track of all of the frames that it creates. In a tail optimized call, Scheme will get rid of the frames that are no longer necessary.

__tl;dr__ -- Tail recursion can be done in any language where the basic idea is that you return the answer in the final frame of recursion. Tail optimized calls are a Scheme (and some other languages, not including Python) feature where it will get rid of the frames above, if certain conditions are met -- such as where the return statement is only the recursive call and nothing else. The cases in which Scheme uses a tail optimized call are located on the lecture slides located [here](http://www-inst.eecs.berkeley.edu/~cs61a/sp13/slides/35-TailCalls_6pp.pdf).