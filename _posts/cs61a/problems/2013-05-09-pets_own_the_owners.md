---
layout: problem
title: "Pet's Own the Owners"
type: Warmup
tags: [oop, bound methods, object oriented programming]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: true
---
<p>
  
</p>

<pre>
  <code class="prettyprint">
class Owner(object):
    all = []

    def __init__(self, name):
        self.name = name
        self.pets = []
        Owner.all.append(self)

    def add_pet(self, pet):
        self.pets.append(pet)

    def __repr__(self):
        return 'Owner(' + self.name + ')'

class Pet(object):
    all = []

    def __init__(self, name, weight, height):
        self.name = name
        self.weight = weight
        self.height = height
        Pet.all.append(self)

    @property
    def bmi(self):
        return self.weight / (self.height * self.height)

    def __repr__(self):
        return 'Pet(' + self.name + ')'
  </code>
</pre>

<pre>
  <code class="prettyprint">
>>> bob = Owner('bob')
>>> joe = Owner('joe')
>>> bob.all                 #1

>>> bob.all.append(bob)
>>> joe.all                 #2

>>> type(joe.add_pet)       #3

>>> type(Owner.add_pet)     #4

>>> harry = Pet('harry', 50, 50)
>>> type(harry.bmi)         #5

>>> joe.pets.append(harry)
>>> bob.add_pet(harry)
>>> bob.pets[0].all         #6

>>> bob.pets.append(Pet('jimmy', 40, 10))
>>> bob.pets[1].owner       #7

>>> Pet.all                 #8

>>> jimmy                   #9

  </code>
</pre>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <ol>
    <li>[Owner(bob), Owner(joe)]</li>
    <li>[Owner(bob), Owner(joe), Owner(bob)]</li>
    <li>&lt;class 'method'&gt;</li>
    <li>&lt;class 'function'&gt;</li>
    <li>&lt;class 'float'&gt;</li>
    <li>[Pet(harry)]</li>
    <li>
      Traceback (most recent call last): <br>
      File "&lt;stdin&gt;", line 1, in &lt;module&gt; <br>
      AttributeError: 'Pet' object has no attribute 'owner'
    </li>
    <li>[Pet(harry), Pet(jimmy)]</li>
    <li>
      Traceback (most recent call last): <br>
      File "&lt;stdin&gt;", line 1, in &lt;module&gt; <br>
      NameError: name 'jimmy' is not defined
    </li>
  </ol>
  
  <p>
    
  </p>
</div>
{% endif %}
