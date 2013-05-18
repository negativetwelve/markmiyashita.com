- [Pupose](#purpose)
- [Type Tag Function](#type-tag-function)
- [Creating our Dictionaries](#creating-our-dictionaries)
- [Putting it all Together](#putting-it-all-together)

#### Purpose

Generic functions are functions that we can create the are able to work on a variety of different objects. For example, if we have a Square class and a Rectangle class and we want to find the area of either, we should be able to make one function that takes in either of the objects, figures out what the type of the object is, and calls the right function to find the area for that object.

#### Type Tag Function

Let's start be making and understanding out `type_tag` function. We need some way of inspecting what type our input is, so we will be using the `type` function that takes in any object and returns the class that the object is an instance of. Take a look at the examples below:

    >>> t = []
    >>> type(t)
    <class 'list'>

We can also compare the type of something by using the normal `==` operator.

    >>> t = []
    >>> type(t) == list
    True

Our `type_tag` function is going to take in a generic object, look up its type, and then find that type in our `type_tag.tags` dictionary that we will define later. Here's what our `type_tag` function will look like.

    def type_tag(generic_object):
        return type_tag.tags[type(generic_object)]

Let's break this down. First, we are checking the type of our object. Then we are using the type of our object as the key that we are looking up in the `type_tag.tags` dictionary and we will get back its value. The function itself will return this value that it finds by looking up the type.

We're going to use this to map our class names to some broader name that can represent a bunch of different classes. For this, we are going to use the following scenario. Say we have a bunch of different types of animals, all of which have a different reproduction rate. Cats reproduce at the rate of 0.1n, Birds reproduce at the rate of n<sup>2</sup> and Rabbits reproduce at the rate of 2<sup>n</sup>, where n is the number of years. However, we can have different types of Birds such as a Parrot, a BlueJay, and a Pigeon. Each of these birds have the same reproduction rate, however, we can now have different instances of the Bird class. Let's define our classes as such.

    class Bird(object):
        wings = 2

    class Cat(object):
        meows = 2

    class Rabbit(object):
        carrots = 100

    class Parrot(Bird):
        colors = 'lots'

    class BlueJay(Bird):
        colors = 'blue'

    class Pigeon(Bird):
        colors = 'grey'

#### Creating Our Dictionaries

The body of the classes don't matter that much for this example. So we need to construct some sort of dictionary that maps our class names to our shorter broader names. We want to do this because we only want to define one function that computes the reproduction rate for Birds. We don't want to have one for each of the Parrot, BlueJay, and Pigeon classes because they are all Birds and all Birds have the same reproduction rate. Our dictionary will be defined as follows:

    type_tag.tags = {Bird: 'bird', Cat: 'cat', Rabbit: 'rabbit', Parrot: 'bird', BlueJay: 'bird', Pigeon: 'bird'}

Now for a test, follow along with the code below and make sure you understand it. We will be making a series of objects and then get its type tag by passing it through the `type_tag` function.

    >>> p = Parrot()
    >>> pi = Pigeon()
    >>> c = Cat()
    >>> r = Rabbit()
    >>> type_tag(r)
    'rabbit'
    >>> type_tag(p)
    'bird'
    >>> type_tag(c)
    'cat'
    >>> type_tag(pi)
    'bird'

Now, we need to construct a second dictionary, this time mapping our tags to our functions that work for each tag. For the Cat class, we need to make a function that takes in a `number_of_years` and correctly computes the number of Cats we will have. We also need to do the same for the Rabbit and Bird classes. Let us define it as follows:

    >>> reproduction_rates = {}
    >>> reproduction_rates['cat'] = lambda years: 0.1 * years
    >>> reproduction_rates['bird'] = lambda years: years ** 2
    >>> reproduction_rates['rabbit'] = lambda years: 2 ** years

#### Putting it all Together

Great! Now we want to construct our generic function, `children_on_the_nth_year(obj, n)`. This funtion is going to take in a _generic object_ (some sort of animal that we defined above) and a number `n` that will calculate the amount of children that the animal will have on the nth year based on its reproduction rate. For now, let's pretend that we have a dictionary that maps our short names (or tags) to functions that correctly compute the number of children for each object. We need some way to figure out what type our object is, look it up in this dictionary, then call that function on our input n. We define it as follows:

    def children_on_the_nth_year(obj, n):
        tag = type_tag(obj)
        return reproduction_rates[tag](n)

Does this work? Let's try some examples to see if it does indeed work.

    >>> p = Parrot()
    >>> children_on_the_nth_year(p, 2)
    4
    >>> r = Rabbit()
    >>> children_on_the_nth_year(r, 3)
    8

It seems to be working. Now let's try to understand _why_ it's working.

We first create a Parrot object and call it `p`. Then we call `children_on_the_nth_year` with the object as our first argument and the number 2 as our second argument. What will `tag` equal after executing the first line of the function? Remember that `type_tag` looks up the class name for our object, in this case it would be looking up Parrot, and in the `type_tag.tags` dictionary we would lookup the key Parrot and get back the value `'bird'`. We store that as the value `tag`. Then, on the next line, we lookup that tag that we just found in our `reproduction_rates` dictionary. What type of object will this dictionary return? It will give us back a function. What does this function do? It takes in some number, which represents the number of years, and returns how many children that animal will have that year. In this instance, we lookup `'bird'` and get back the lambda function `lambda years: years ** 2`. With the input now being `n` which is the value 2 in this example, the function returns that value `2 ** 2` which is just 4. The overall function will now return 4 and that is our answer. The similar process applies to the Rabbit, however, this time its tag is 'rabbit' and the function will be for the rabbit and not for the bird. 