{% capture question %}
We want to write a method for the [SinglyLinkedList class]({% code singly_linked_list %}) that allows us to insert an element into the beginning of the list. We want this operation to be completed in &Theta;(1) time.

    public void insertBeginning(Object element) {

    }

Remember that there might be more than one case to consider here and also, don't foget to change the length!
{% endcapture %}

{% capture solution %}
Here the solution that I came up with:

    public void insertBeginning(Object element) {
      head = new SinglyLinkedListNode(element, head);
      length++;
    }

What we're doing is making a new `SinglyLinkedListNode` with the object as its element. We're also setting newly created `SinglyLinkedListNode`'s next pointer to be the previous head (which could have been null).

This operation is &Theta;(1) because all we're doing is creating a new node and incrementing a counter (both of which are constant operations).

{% endcapture %}

{% include cs61b/problem_template.md %}

