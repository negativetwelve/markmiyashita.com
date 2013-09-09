{% capture question %}
Let's write a method for the [SinglyLinkedList class]({% code singly_linked_list %}) that allows us to append two `SinglyLinkedList`s together. This method should __mutate__ the `SinglyLinkedList` that it is called on and __not__ the one that is passed in. Example: `a.append(b)` should mutate `a` and __not__ `b`.

This method should run in &Theta;(n) time.

    public void append(SinglyLinkedList otherList) {

    }

{% endcapture %}

{% capture solution %}
Here's the solution I came up with:

    /*
     * This is the append method of the SinglyLinkedList class.
     */
    public void append(SinglyLinkedList otherList) {
      if (head == null) {
        head = otherList.head;
      } else {
        SinglyLinkedListNode current = head;
        while (current.next != null) {
          current = current.next;
        }
        current.next = otherList.head;
      }
    }

This implementation uses a `while` loop, however you can also solve this recursively. Basically, we are first checking if we have a `head`. If we don't then we simply set our `head` to point to the other list's `head`. If we do have a `head`, then we iterate over the list until we reach the last item. Then we set the last item's `next` to the `otherList`'s head. The result is a mutated list with the contents of `otherList` appended to the end.

To check our work, we wrote the following test cases (Note: these are by no means complete):

    public static void main(String[] args) {
      Object[] firstListElements = {1, 2, 3, 4, 5};
      Object[] secondListElements = {6, 7, 8, 9, 10};
      SinglyLinkedList p = new SinglyLinkedList(firstListElements);
      SinglyLinkedList q = new SinglyLinkedList(secondListElements);
      System.out.println(p.toString());
      p.append(q);
      System.out.println(p.toString());
      Object[] newElements = {1, 2, 3, 4};
      Object[] noElements = {};
      SinglyLinkedList e = new SinglyLinkedList(newElements);
      SinglyLinkedList f = new SinglyLinkedList(noElements);
      System.out.println(e.toString());
      e.append(f);
      System.out.println(e.toString());
      System.out.println(f.toString());
      f.append(e);
      System.out.println(f.toString());
    }

Which should output:

    1 2 3 4 5
    1 2 3 4 5 6 7 8 9 10
    1 2 3 4
    1 2 3 4

    1 2 3 4

{% endcapture %}

{% include cs61b/problem_template.md %}