/*
 * SinglyLinkedList class with accompanying SinglyLinkedListNode class.
 * By: Mark Miyashita
 */

class SinglyLinkedList {

  private SinglyLinkedListNode head;
  private int length;

  public SinglyLinkedList() {
    head = null;
    length = 0;
  }

  public SinglyLinkedList(Object[] elements) {
    this();
    for (Object element : elements) {
      insert(element, length);
    }
  }

  public String toString() {
    if (head == null) {
      return "";
    } else {
      return head.toString();
    }
  }
}

class SinglyLinkedListNode {
  /*
   * SinglyLinkedListNode class
   */

  public Object element;
  public SinglyLinkedListNode next;

  public SinglyLinkedListNode(Object element, SinglyLinkedListNode next) {
    this.element = element;
    this.next = next;
  }

  public String toString() {
    if (next == null) {
      return element.toString();
    } else {
      return element.toString() + " " + next.toString();
    }
  }
}
