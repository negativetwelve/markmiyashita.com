{% capture question %}
Let's write a method for the [SinglyLinkedList class]({% code singly_linked_list %}) that allows us to find or lookup items in our list. This method should return True if the item exists and False if it does not.

This method should run in &Theta;(n) time.

    public boolean lookup(Object element) {

    }

{% endcapture %}

{% capture solution %}
Here's the solution I came up with:

    /*
     * This is the lookup method of the SinglyLinkedList class.
     */
    public boolean lookup(Object element) {
      if (head == null) {
        return false;
      } else {
        return head.lookup(element);
      }
    }

    /*
     * This is the lookup method of the SinglyLinkedListNode class.
     */
    public boolean lookup(Object element) {
      if (this.element == element) {
        return true;
      } else if (next == null) {
        return false;
      } else {
        return next.lookup(element);
      }
    }

This implementation is another recursive function. First, we make sure that there's a `head` to the list. If there isn't, then the list definitely does not contain the element that we're looking up. Then, we start looking at the `head`.

If the element is equal to the one that we're looking for, then we can return `true` because we have found what we're looking for. On the other hand, if the `next` element is `null` and we have not found what we're looking for, then we should return `false` because the element was not found. Lastly, if we're in the middle of the list and we have not yet found our element, we can continue to search the rest by calling `lookup` on the `next` item.

Here are some tests that you can add to the `SinglyLinkedList` class to verify that the `lookup` method is working. Of course, you should write more tests that what I have here, but it's a start:

    public static void main(String[] args) {
      SinglyLinkedList t = new SinglyLinkedList();
      t.insert(1, 0);
      t.insert(2, 0);
      t.insert(3, 0);
      System.out.println(t.lookup(3));
      System.out.println(t.lookup(4));
    }

Should print out:

    true
    false

{% endcapture %}

{% include cs61b/problem_template.md %}