---
layout: note
title: "Dictionaries"
tags: [dictionaries]
categories: [cs61a, sp13, notes]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
---

- [Introduction](#introduction)
- [Accessing Elements](#accessing)
- [Inserting and Changing Elements](#changing)
- [Removing Elements](#removing)
- [Iterating Over the Elements of a Dictionary](#iterating)
- [Dictionaries in Environment Diagrams](#environments)
- [Useful Methods for Dictionaries](#extra)

<div id="introduction">
  <h4>Introduction</h4>
  <p>
    Dictionaries are another type of <i>data structure</i> that we can use to hold and store information. Dictionaries are built around the idea of storing key-value pairs and they offer a quick solution to look up one piece of information to access another. A key can be any type except a mutable data type. A value has no such restrictions (meaning its type is not restricted). A common key type is the string because in English, we often associate mapping a word or phrase to some longer or extended information.
  </p>
  
  <p>
    A dictionary can only have one value for each individual key. If you try to insert a pair with an existing key, the value will be overridden. This can be shown by a quick example. Say I had a dictionary that mapped names of people to their ages:
  </p>
  
  <pre class="brush: python; gutter: false;">
    >>> ages = {'joe' : 20, 'jenny' : 19, 'tony' : 24}
    >>> ages['tony'] = 23
  </pre>
  
  <p>
    If I try to add another person named <code>tony</code>, instead of having two keys, both labeled <code>tony</code>, I will instead have one key for <code>tony</code> mapped to the new value.
  </p>
  
  <pre class="brush: python; gutter: false;">
    >>> ages
    {'joe' : 20, 'jenny' : 19, 'tony' : 23}
  </pre>
  
  <p>
    This shows that dictionary keys are unique. Another thing we should note is that dictionaries are unordered. Python has its own way of organizing and arranging the items, but we as the programmer do not know for sure.
  </p>
</div>

<div id="accessing">
  <h4>Accessing Elements</h4>
  <p>
    Elements in a dictionary can be accessed using the square bracket notation. If the key exists, it will return its value. If not, it will throw a <code>KeyError</code>.
  </p>
  
  <pre class="brush: python; gutter: false;">
    >>> ages['joe']
    20
    >>> ages['johnny']
    Traceback (most recent call last):
      File "&lt;stdin&gt;", line 1, in &lt;module&gt;
    KeyError: 'johnny'
  </pre>
</div>

<div id="changing">
  <h4>Inserting and Changing Elements</h4>
  <p>
    Elements in a dictionary can be inserted in the same way that they are changed. Dictionaries are considered a mutable data type because we can change the entries and add new ones. To add elements, we do the following:
  </p>
  
  <pre class="brush: python; gutter: false;">
    >>> ages['harry'] = 19
    >>> ages
    {'joe' : 20, 'harry' : 19, 'jenny' : 19, 'tony' : 23}  
  </pre>
  
  <p>
    To change elements, we do the same thing, except we know that the key already exists.
  </p>
  
  <pre class="brush: python; gutter: false;">
    >>> ages['jenny'] = 25
    >>> ages
    {'joe' : 20, 'jenny' : 25, 'harry' : 19, 'tony' : 23}
  </pre>
  
  <p>
    Again, notice that the elements are in a different order this time, a reminder that dictionaries are unordered and that we cannot rely upon the order when we iterate over them.
  </p>
</div>

<div id="removing">
  <h4>Removing Elements</h4>
  <p>
    If you desire to remove items from a dictionary, you must use the special built-in, <code>del</code>. The syntax is as follows:
  </p>
  
  <pre class="brush: python; gutter: false;">
    >>> del ages['tony']
    >>> ages
    {'joe' : 20, 'jenny' : 25, 'harry' : 19}
  </pre>
  
  <p>
    We use the <code>del</code> function that requires you to specify the dictionary and the associated key that you want to remove.
  </p>
</div>

<div id="iterating">
  <h4>Iterating Over the Elements in a Dictionary</h4>
  <p>
    We have several methods for iterating over a dictionary. Again, we remind ourselves that dictionaries are unordered so we cannot rely upon a for loop to give us the same values after we manipulate the data. For example:
  </p>
  
  <pre class="brush: python; gutter: false;">
    >>> for i in ages:
    ...     print(i)
    ...
    harry
    joe
    jenny
  </pre>
  
  <p>
    Notice that the <i>keys</i> are what gets printed and that the values are nowhere to be found. Iterating over the dictionary itself is the same as iterating over just the keys. To be more specific, we can use the <code>.keys()</code> method to iterate over just the keys. We also have access to the <code>.values()</code> method and the <code>.items()</code> method and they work as follows:
  </p>
  
  <pre class="brush: python; gutter: false;">
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
  </pre>
</div>

<div id="environments">
  <h4>Dictionaries in Environment Diagrams</h4>
  
  <p>
    Work in progress, will be updated soon.
  </p>
</div>

<div id="extra">
  <h4>Useful Methods for Dictionaries</h4>
  
  <p>
    Work in progress, will be updated soon.
  </p>
</div>