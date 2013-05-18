{% capture question %}
Given these two classes, what do the following lines evaluate to?

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

^

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
{% endcapture %}

{% capture solution %}
1. [Owner(bob), Owner(joe)]
2. [Owner(bob), Owner(joe), Owner(bob)]
3. &lt;class 'method'&gt;
4. &lt;class 'function'&gt;
5. &lt;class 'float'&gt;
6. [Pet(harry)]
7. Traceback (most recent call last): <br>
   File "&lt;stdin&gt;", line 1, in &lt;module&gt; <br>
   AttributeError: 'Pet' object has no attribute 'owner'
8. [Pet(harry), Pet(jimmy)]
9. Traceback (most recent call last): <br>
   File "&lt;stdin&gt;", line 1, in &lt;module&gt; <br>
   NameError: name 'jimmy' is not defined
{% endcapture %}

{% include cs61a/problem_template.md %}