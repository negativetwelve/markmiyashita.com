/*
 * SinglyLinkedList class with accompanying SinglyLinkedListNode class.
 * By: Mark Miyashita
 */

public class SinglyLinkedList {

  private SinglyLinkedList head;
  private int length;

  public SinglyLinkedList() {
    head = null;
    length = 0;
  }


  public class SinglyLinkedListNode {
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
}
