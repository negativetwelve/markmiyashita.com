{% capture question %}
Say we wanted to design some classes that represent Cars, Trucks, and Buses. Each one has a variable, let's call it `repair_cost` that represents the amount of money required to repair that object. Each class has a different `repair_cost`, but each object in the class has the same `repair_cost`. So, each Car object has a `repair_cost` of 10, Trucks cost 20, and Buses cost 30.

    >>> c1 = Car()
    >>> t1 = Truck()
    >>> b1 = Bus()
    >>> c1.repair_cost
    10
    >>> t1.repair_cost
    20
    >>> b1.repair_cost
    30

How many classes should we make to minimize the amount of code?

After we have determined the number of classes to make, let's make them! Implement the Car, Truck, Bus, and any other classes (which could be none!) that you feel are necessary to create this situation in a way that makes the most sense (making use of inheritance, overridding, etc.). Let's also set a variable on all the vehicles that states how many wheels it has (let's just say that all of our vehicles have 4 wheels).

Once you have your classes made, implement a function that takes in an `amount_paid` and compares that to the `repair_cost`. If the `amount_paid` is greater than or equal to the `repair_cost`, then the item is allowed to be fixed and it should print out a message indicating that it has been fixed. If it cannot be fixed, then it should print out a different message indicating so. Try to minimize the amount of code that is required for this problem using inheritance.
{% endcapture %}

{% capture solution %}
There are many ways to answer this question. Here is the solution that I came up with.

    class Vehicle(object):
        num_wheels = 4

        def repair(self, amount_paid):
            if amount_paid >= self.repair_cost:
                print("The " + type(self).__name__ + " has been fixed!")
            else:
                print("The " + type(self).__name__ + " was not fixed :( Please pay more money.")

    class Car(Vehicle):
        repair_cost = 10

    class Truck(Vehicle):
        repair_cost = 20

    class Bus(Vehicle):
        repair_cost = 30

The `type(self).__name__` is something that is not important, all it does is grab the name of the class of self and convert it to string form. 

The important parts here are the fact that we __do not__ have any `__init__` statements, anywhere! The reason is because our objects themselves do not have any instance variables, they only have class variables. So, we simply make a generic object (becuase the class Vehicle inherites from the generic object class) that allows us to assign some class variables.

For the subclasses, Car, Truck, and Bus, we only need to set the `repair_cost` because that is the only thing that changes between the different classes. The `repair` method that we definied in the Vehicle class still works. Do you see why?

The answer lies in the fact that the `repair` method checks `self.repair_cost` instead of `Vehicle.repair_cost` or `Car.repair_cost`. The result is that whichever object this method is called on, it will use the type of the _object_ to determine which `repair_cost` to use. The result is that we can now make one general method that works for multiple different subclasses.
{% endcapture %}

{% include cs61a/problem_template.md %}