* Table of Contents
{:toc}

#### Introduction

<!--start-->
Dictionaries are another type of _data structure_ that we can use to hold and store information. Dictionaries are built around the idea of storing key-value pairs and they offer a quick solution to look up one piece of information to access another. A key can be any type except a mutable data type. A value has no such restrictions (meaning its type is not restricted). A common key type is the string because in English, we often associate mapping a word or phrase to some longer or extended information.
<!--end-->

A dictionary can only have one value for each individual key. If you try to insert a pair with an existing key, the value will be overridden. This can be shown by a quick example. Say I had a dictionary that mapped names of people to their ages:

    >>> ages = {'joe': 20, 'jenny': 19, 'tony': 24}
    >>> ages['tony'] = 23

If I try to add another person named `tony`, instead of having two keys, both labeled `tony`, I will instead have one key for `tony` mapped to the new value.
  
    >>> ages
    {'joe': 20, 'jenny': 19, 'tony': 23}

This shows that dictionary keys are unique. Another thing we should note is that dictionaries are unordered. Python has its own way of organizing and arranging the items, but we as the programmer do not know for sure.

#### Accessing Elements

Elements in a dictionary can be accessed using the square bracket notation. If the key exists, it will return its value. If not, it will throw a `KeyError`.
  
    >>> ages['joe']
    20
    >>> ages['johnny']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'johnny'

#### Inserting and Changing Elements

Elements in a dictionary can be inserted in the same way that they are changed. Dictionaries are considered a mutable data type because we can change the entries and add new ones. To add elements, we do the following:

    >>> ages['harry'] = 19
    >>> ages
    {'joe': 20, 'harry': 19, 'jenny': 19, 'tony': 23}

To change elements, we do the same thing, except we know that the key already exists.

    >>> ages['jenny'] = 25
    >>> ages
    {'joe': 20, 'jenny': 25, 'harry': 19, 'tony': 23}

Again, notice that the elements are in a different order this time, a reminder that dictionaries are unordered and that we cannot rely upon the order when we iterate over them.

#### Removing Elements

If you desire to remove items from a dictionary, you must use the special built-in, `del`. The syntax is as follows:

    >>> del ages['tony']
    >>> ages
    {'joe': 20, 'jenny': 25, 'harry': 19}  

We use the `del` function that requires you to specify the dictionary and the associated key that you want to remove.

#### Iterating Over the Elements in a Dictionary

We have several methods for iterating over a dictionary. Again, we remind ourselves that dictionaries are unordered so we cannot rely upon a for loop to give us the same values after we manipulate the data. For example:

    >>> for i in ages:
    ...     print(i)
    ...
    harry
    joe
    jenny

Notice that the _keys_ are what gets printed and that the values are nowhere to be found. Iterating over the dictionary itself is the same as iterating over just the keys. To be more specific, we can use the `.keys()` method to iterate over just the keys. We also have access to the `.values()` method and the `.items()` method and they work as follows:

    >>> for i in ages.values():
    ...     print(i)
    ...
    19
    20
    25
    >>> for k, v in ages.items():
    ...     print(k, v)
    ...
    harry 19
    joe 20
    jenny 25

#### Dictionaries in Environment Diagrams

Dictionaries have a representation in environment diagrams too. We represent it by listing the type _dict_ above the boxes with the keys on the left and the values on the right. The name of our dictionary, `ages`, points to the dict object. Here is what our `ages` dictionary would look like:

![Environment Diagram](/public/images/dictionaries/environment_diagram_01.png)

When we add and remove items from the dictionary, our environment diagram updates to this:

    >>> ages['joe'] = 22
    >>> del ages['jenny']
    >>> ages
    {'joe': 22, 'harry': 19}

![Environment Diagram](/public/images/dictionaries/environment_diagram_02.png">)

#### Useful Methods for Dictionaries

Work in progress, will be updated soon.
