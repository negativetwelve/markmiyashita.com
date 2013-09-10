* Table of Contents
{:toc}

#### Introduction

<!--start-->
Environment Diagrams may seem tricky at first but they're really useful in analyzing how functions are evaluated. If you follow these simple steps, you'll be able to draw out _any_ environment diagram. As with all things CS-related, practice, practice, practice!
<!--end-->

#### The Steps

Follow these steps below for a successful environment diagram:

1. Draw the global frame. No questions asked, just draw it.
2. When evaluating assignment statements (lines with a single equals sign), __always__, __always__, __always__ remember to evaluate the __right__ side first!
3. When you __call__ a function, __MAKE A NEW FRAME!__
4. When assigning a primitive expression to a variable, write that value directly in the box.
5. When assigning anything else besides a primitive expression to a variable, __draw an arrow__ to that value.
6. Bind imported values in the current frame (represent the inside of the function with an ellipsis (...)).
7. When calling a function (see #3), name the frame with the intrinsic name of the function -- that is, write the name of the function that your variable points to!
8. The parent frame of a function is the frame in which it was defined in.

List of things __not__ to do:

1. Never, ever, ever draw an arrow from one variable to another. Remember, arrows always point to values, not other variables.
2. Don't draw frames for built-in functions.

Lastly, like I said before, make sure you [practice!]({% link_to_topic environment_diagrams/#problems %})