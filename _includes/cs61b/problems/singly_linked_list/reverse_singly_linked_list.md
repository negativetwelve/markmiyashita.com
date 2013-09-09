{% capture question %}
Let's write a method for the [SinglyLinkedList class]({% code singly_linked_list %}) that allows us to reverse a `SinglyLinkedList`. This method should be mutating. Challenge: Try to implement this method recursively.

This method should run in &Theta;(n) time.

    public void reverse() {

    }

Hint: You might want to make a helper function or a method in the `SinglyLinkedListNode` class.
{% endcapture %}

{% capture solution %}
Here's the solution I came up with:

{% highlight java %}
/*
 * This is the reverse method of the SinglyLinkedList class.
 */
public void reverse() {
  if (head == null) {
    return;
  } else {
    head = head.reverse();
  }
}

/*
 * This is the reverse method of the SinglyLinkedListNode class.
 * It returns a pointer to the front of the reversed list so that we
 * can assign it to the head of the overall list.
 */
public SinglyLinkedListNode reverse() {
  if (next == null) {
    return this;
  } else {
    SinglyLinkedListNode currentNext = next;
    this.next = null;
    SinglyLinkedListNode rest = currentNext.reverse();
    currentNext.next = this;
    return rest;
  }
}
{% endhighlight %}

The `reverse` method for the `SinglyLinkedList` class does not return anything while the `reverse` method of the `SinglyLinkedListNode` class returns a `SinglyLinkedListNode`. The reason is because we need to have a pointer to the new front of the list in order to assign that to the `head` of the list.

Let's walk through the implementation. In the `SinglyLinkedList` class, we check to see if the `head` is `null`. If it is, we're done and can just return. Otherwise, we call the `reverse` method of the `head` and assign the return value to our `head` variable which is a pointer to the front of the list.

In the `SinglyLinkedListNode` class, we have a slightly more complicated problem to solve. If our next item is null, then we can simply return ourself. What that means is that if I only have one element in my list, the reverse of that list is just the single item. If that's not the case, then we have to do some pointer manipulation. First, we need a way to store our `next` node so we create a temporary variable `currentNext` that will be our pointer to our `next` item. Then, we're going to set our `next` to null so that we can reassign it later. Don't worry, we still have a reference to the `next` item in our variable `currentNext`.

After that, we're going to let recursion finish the rest by calling `reverse` on the `currentNext`. The reverse method returns a pointer to the new front of the list. This means that if our previous list was `1 -> 2 -> 3`, calling `reverse` on this list would return a pointer to `3`. `currentNext` still points to `2` in this case. In the next line, we're going to be setting `currentNext`'s next to be the current item. In the example above, we're setting `2`'s next to be `1`.

Then, since we stored a pointer to the front of the list in our variable `rest`, we can just return that so that we can set our `head` to point to the front.

The result is a reversed list!

For testing, I simply made a linked list, called reverse, and then made sure it returned the reverse of the original list:

    public static void main(String[] args) {
      Object[] inOrder = {1, 2 ,3, 4, 5, 6};
      SinglyLinkedList u = new SinglyLinkedList(inOrder);
      System.out.println(u.toString());
      u.reverse();
      System.out.println(u.toString());
    }

Should output:

    1 2 3 4 5 6
    6 5 4 3 2 1

{% endcapture %}

{% include cs61b/problem_template.md %}