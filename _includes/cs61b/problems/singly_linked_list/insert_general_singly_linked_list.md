{% capture question %}
We want to write a method for the [SinglyLinkedList class]({% code singly_linked_list %}) that allows us to insert an element at the specified index into the list. We want this operation to be completed in &Theta;(n) time.

    public void insert(Object element, int index) {

    }

Don't forget to change the existing pointers as well as change the length! You might want to create another method that can help you.
{% endcapture %}

{% capture solution %}
Here the solution that I came up with:

    /*
     * This insert method goes in the SinglyLinkedList class.
     */
    public void insert(Object element, int index) {
      if (index == 0) {
        head = new SinglyLinkedListNode(element, head);
        length++;
      } else if (head == null) {
          throw new IndexOutOfBoundsException();
      } else {
        head.insert(element, index - 1);
        length++;
      }
    }

    /*
     * This insert method goes in the SinglyLinkedListNode class.
     */
    public void insert(Object element, int index) {
      if (index == 0) {
        next = new SinglyLinkedListNode(element, next);
      } else if (next == null) {
        throw new IndexOutOfBoundsException();
      } else {
        next.insert(element, index - 1);
      }
    }


This question is actually pretty tricky because there are multiple edge cases that can make the problem seemingly more difficult. First off, we have to account for indicies that are out of bounds. Let's start by looking at the SinglyLinkedList class's `insert` method.

If the index is 0, we can insert the element right away by setting the head equal to the new list node and setting the head's `next` as whatever the head was previously (which could have been `null`). Then, we check to see if the `head` is `null` because if we're trying to insert anything past index 0 and our `head` is `null`, then we have a problem and we should raise an `IndexOutOfBoundsException`. Otherwise, we call the `insert` method of our `SinglyLinkedListNode` class which will take care of the rest.

Now that we're working solely with the `SinglyLinkedListNode` class, we can write a simple recursive solution. If the `index` is 0, we set the next item to be our new `SinglyLinkedListNode` with its next pointing to whatever previously came after our current node. If the `index` is not 0 and our `next` is `null`, then we have a problem and we should raise an `IndexOutOfBoundsException`. Lastly, if neither of those are true, we should continue to traverse the list by calling `insert` on our next item with the index minus 1.

Here are some tests that you can add to the `SinglyLinkedList` class to verify that this is working properly:

    public static void main(String[] args) {
      SinglyLinkedList s = new SinglyLinkedList();
      s.insert(5, 0);
      s.insert(4, 1);
      s.insert(6, 0);
      s.insert(1, 1);
      System.out.println(s.head.element);
      System.out.println(s.head.next.element);
      System.out.println(s.head.next.next.element);
      System.out.println(s.head.next.next.next.element);
      System.out.println(s.length);
    }

Should print out:

    6
    1
    5
    4
    4

{% endcapture %}

{% include cs61b/problem_template.md %}

