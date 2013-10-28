* Table of Contents
{:toc}

#### Why?

<!--start-->
A lot of you ask "What is the purpose of @property?" and so I decided to write up a short summary of why we have @property, what it's used for, and how to use it (correctly). When we define objects, we have several attributes that we can access by using the dot methods associated with our objects. We can access __instance variables__ simply by doing `my_object.my_instance_variable` and we can call a method by doing `my_object.call_my_method(...)`. We usually define our __instance variables__ in our constructors and then modifying them in subsequent methods. However, what happens if I have an __instance variable__ that depends on other instance variables? Should I have to modify them both each time? Based on everything else we've learned in this class, your intuition should tell you that if you have to do something twice, you're probably doing something wrong. Let's explore that idea with @property.
<!--end-->

#### Usage

In one sentence, `@property` is used to declare a method that can act as an instance variable. What that means is that I can define a method that can compute some value dynamically (on-the-fly) and then return it as if I was talking about an instance variable. When we surround a method with `@property`, we're changing the syntax of how we access that variable.

Here's a class that we're going to use for this note:

    class Coins:

        def __init__(self, num_pennies, num_nickels):
            self.num_pennies = num_pennies
            self.num_nickels = num_nickels

        def value(self):
            return self.num_pennies + 5 * self.num_nickels

If we instantiate an instance by executing something like:

    c = Coins(3, 7)

If we wanted to get the `value` from the coins, we'd have to call:

    c.value()

Here's the important part. When we see a method, we should immidiately think the following:

1. Soemthing on my object is changing because methods imply some sort of mutation or side effect. When you think methods, you should think actions.

When we see an instance variable, such as:

    c.num_pennies

we should immidiately think that we are accessing some information stored on the object that _describes_ the object rather than mutating it.

With that in mind, let's look at how `@property` changes our syntax. Say we surround the `value` method with `@property`.

     class Coins:

        def __init__(self, num_pennies, num_nickels):
            self.num_pennies = num_pennies
            self.num_nickels = num_nickels

        @property
        def value(self):
            return self.num_pennies + 5 * self.num_nickels

Our original query changes to the following:

    c = Coins(3, 7)
    c.value

Notice the lack of parenthesis. The whole point of `@property` is the following:

Sometimes we have a value that can be computed by accessing other instance variables. Instead of defining a new instance variable (which would then have to be modified each time we change an existing instance variable), we simply make a property. A property tells us something about our object and the syntax for calling it is similar to an instance variable.

So, in this example, `value` tells us something _about_ our coins object, it does not modify our coins or produce some side effect. In this manner, `value` seems like a perfect candidate for `@property` because it tells us something _about_ our object meaning it is more like an instance variable rather than a method.
