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
}
