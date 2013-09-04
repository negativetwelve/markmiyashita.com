* Table of Contents
{:toc}

#### C as a Language

<!--start-->
C is a general programming language that is static typed, and has many functionalities such as lexical variable scope and recursion. It is somewhat low-level and can easily be compiled into machine languages that the computer can easily understand. It is one of the most widely used programming languages of all time and it also has popular derivatives such as C++, C#, and Objective-C. As with any new programming language, let's write "Hello World" in our new language, C! We start with a blank file called `hello.c`
<!--end-->

#### Hello World

Hello world is a simple enough program that we're going to write it entirely, then take a look at what we've done. Here's the code for `hello.c`

    #include <stdio.h>

    int main()
    {
      printf("Hello World\n");
      return 0;
    }

To make sure that it works, we must first compile our .c file into something that our computer can run. You need to havea compiler on your computer in order to do this. For this demo, and the rest of the posts in CS61C, we are going to use the gcc compiler.

To compile our `hello.c` file, we're going to run:

    gcc hello.c -o hello

Let's deconstruct this command. First, we note that the Unix program that we're running is `gcc`. The first argument, `hello.c` is the name of the file that we want to compile. We could stop here if we wanted but we added on a compiler flag, namely, -o. The `-o` flag for the gcc compiler allows you to specify an output file/name for the program. In this case, we are saying "compile the program `hello.c` into a program that the computer can run called `hello`." If we omitted the `-o hello` part of the command, everything would still work but we would be left with a file called `a.out` that we can run. `a.out` is the default filename if one is not specified.

Once we have compiled our file with the command `gcc hello.c -o hello`, we can then run our file. To run our file, we enter the following into our Unix prompt:

    $ ./hello
    Hello World

If we did everything right, we should see the text 'Hello World'. `./` means to execute the program (in this case we're executing a program called 'hello').

Let's take a moment to deconstruct our actual C program that we wrote, `hello.c`.

#### Deconstucting our first C Program

First, at the top of the file, we included the line:

    #include <stdio.h>

which allows us to later on use the function `printf`. We say that `printf` is declared in this header file. Header files are contain declarations of classes, variables, and functions. It is similar to an import statement in Python or include in Ruby.

The second part:

    int main()

means we are declaring a function `main` that returns an int. Every C file needs a `main` function or else nothing will run. The reason why it returns an int and not something else is because the Unix machine expects to receive an [exit code](http://tldp.org/LDP/abs/html/exitcodes.html) from the program so that it knows what to do next.

Within the body of the `main()` function, we have the following:

    printf("Hello World\n");

This line (with `printf` being imported from `<stdio.h>`) prints the text "Hello World\n" to standard out. In C, nothing is implicit so we need to explicitly state that we want a newline character `\n` to appear after our text.

The last line:

    return 0;

is the exit code that we were talking about earlier. Since the `main` function is required to return an int, we return 0 because that represents the exit code for success. We want to signal to Unix that the file that we are running was a success.
