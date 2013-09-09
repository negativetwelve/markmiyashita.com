{% capture question %}
Let's write a method for the [SinglyLinkedList class]({% code singly_linked_list %}) that allows us to remove an item from our list. If there are multiple instances of the same `element` in the list, it should remove the first occurance. This method should do nothing if the `element` is not in the list.

This method should run in &Theta;(n) time.

    public void remove(Object element) {

    }

{% endcapture %}

{% capture solution %}
Here's the solution I came up with:

    /*
     * This is the remove method of the SinglyLinkedList class.
     */
    public void remove(Object element) {
      if (head == null) {
        return;
      } else if (head.element == element) {
        head = head.next;
      } else {
        head.remove(element);
      }
    }

    /*
     * This is the remove method of the SinglyLinkedListNode class.
     */
    public void remove(Object element) {
      if (next == null) {
        return;
      } else if (next.element == element) {
        next = next.next;
      } else {
        next.remove(element);
      }
    }

This implementation is yet another recursive function. In the `SinglyLinkedList` method, we first check if the `head` is `null`. If it is, we stop immidiately. Then, we check to see if the first node contains the `element` that we're looking for. If it is, we change where `head` points to and if it does not, we call the remove method on the `head` node.

In the `SinglyLinkedListNode` class, we have a simple recursive function that continuously checks the `next` item to see if it contains the `element` that we're looking for. If the `next` item is `null` then we should stop because we have reached the end of the list. If the next `element` is what we're looking for, we should mutate the next pointer by setting it equal to the `next.next` (effectively skipping the current next node). Otherwise, we recursively call `remove` on the `next` item.

If you want to check your own implementation, I used the following as my tests cases. They are very limited and definitely do not cover all possible edge cases.

    public static void main(String[] args) {
      Object[] elements = {1, 2, 3, 4, 5};
      SinglyLinkedList x = new SinglyLinkedList(elements);
      System.out.println(x.toString());
      x.remove(3);
      System.out.println(x.toString());
      x.remove(1);
      System.out.println(x.toString());
      x.remove(5);
      System.out.println(x.toString());
    }

This should output:

    1 2 3 4 5
    1 2 4 5
    2 4 5
    2 4

{% endcapture %}

{% include cs61b/problem_template.md %}