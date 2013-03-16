---
layout: problem
title: "Designing Classes and Using Inheritance"
type: Warmup
tags: [oop, inheritance]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: true
---
<p>
  Say we wanted to design some classes that represent Cars, Trucks, and Buses. Each one has a variable, let's call it <code>repair_cost</code> that represents the amount of money required to repair that object. Each class has a different <code>repair_cost</code>, but each object in the class has the same <code>repair_cost</code>. So, each Car object has a <code>repair_cost</code> of 10, Trucks cost 20, and Buses cost 30.
</p>

<pre>
  <code class="prettyprint">
>>> c1 = Car()
>>> t1 = Truck()
>>> b1 = Bus()
>>> c1.repair_cost
10
>>> t1.repair_cost
20
>>> b1.repair_cost
30
  </code>
</pre>

<p>
  How many classes should we make to minimize the amount of code?
</p>

<p>
  After we have determined the number of classes to make, let's make them! Implement the Car, Truck, Bus, and any other classes (which could be none!) that you feel are necessary to create this situation in a way that makes the most sense (making use of inheritance, overridding, etc.). Let's also set a variable on all the vehicles that states how many wheels it has (let's just say that all of our vehicles have 4 wheels).
</p>

<p>
  Once you have your classes made, implement a function that takes in an <code>amount_paid</code> and compares that to the <code>repair_cost</code>. If the <code>amount_paid</code> is greater than or equal to the <code>repair_cost</code>, then the item is allowed to be fixed and it should print out a message indicating that it has been fixed. If it cannot be fixed, then it should print out a different message indicating so. Try to minimize the amount of code that is required for this problem using inheritance. 
</p>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <p>
    There are many ways to answer this question. Here is the solution that I came up with.
  </p>
  <pre>
    <code class="prettyprint">
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
    </code>
  </pre>
  
  <p>
    The <code>type(self).__name__</code> is something that is not important, all it does is grab the name of the class of self and convert it to string form. 
  </p>

  <p>
    The important parts here are the fact that we <b>do not</b> have any <code>__init__</code> statements, anywhere! The reason is because our objects themselves do not have any instance variables, they only have class variables. So, we simply make a generic object (becuase the class Vehicle inherites from the generic object class) that allows us to assign some class variables.
  </p>

  <p>
    For the subclasses, Car, Truck, and Bus, we only need to set the <code>repair_cost</code> because that is the only thing that changes between the different classes. The <code>repair</code> method that we definied in the Vehicle class still works. Do you see why?
  </p>

  <p>
    The answer lies in the fact that the <code>repair</code> method checks <code>self.repair_cost</code> instead of <code>Vehicle.repair_cost</code> or <code>Car.repair_cost</code>. The result is that whichever object this method is called on, it will use the type of the <i>object</i> to determine which <code>repair_cost</code> to use. The result is that we can now make one general method that works for multiple different subclasses.
  </p>

</div>
{% endif %}
