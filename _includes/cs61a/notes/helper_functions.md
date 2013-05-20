* Table of Contents
{:toc}

#### What are Helper Functions?

Helper functions are useful when you want to extend the amount of parameters that a certain function takes in. Helper functions are generally used to make our lives easier. This occurs most often when working with recursion, especially if you want your function to be tail recursive. 

Let's take a look at the following function:

    def factorial(n):
        if n == 1:
            return 1
        return n * factorial(n - 1)

Let's say our task is to make this function tail recursive. Recall that the definition of tail recursion in its simplest form is to return the answer that we have accumulated throughout all of the function calls, in the last frame. In regular recursion, we must first recursively create frames until we hit the base case. Then from there, we use the base case to build our answer going back up. In tail recursion, we don't have the "going back up" stage. 

We know that we can't do this while only taking in a single parameter, n, so we look to create a helper function.

Using a helper function can't ever stop you from solving a problem, as long as you're using it correctly. In the worst case, you don't actually need the helper function and you will realize this when some of the parameters of the helper function go unused. The way you determine which extra parameters to include depends on the problem but here are some general tips for deciding what to do:

* Am I keeping track of something at each level of recursion like a counter?
* Is this recursive problem supposed to be tail recursive?
* Am I supposed to be accumulating a list or value?

If you look out for those three things, you should be able to identify when a helper function might make your life easier. If you have any mroe questions, please post in the comment below.