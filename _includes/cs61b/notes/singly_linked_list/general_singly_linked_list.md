* Table of Contents
{:toc}

#### Description

<!--start-->
A linked list is a collection of nodes that are "linked" together. The nodes are arranged in such a way that each node "points" to the next item in the sequence. There are several variants of this data structure that include the singly linked list that we are going to talk about in this post as well as the [doubly linked list](/cs61b/doubly_linked_list).
<!--end-->

A singly linked list is exactly what it sounds like. Each of the nodes in the sequence contain a single pointer to the next item. That means that at any one time, a node only knows about one other node. It has no notion of where it came from (meaning it does not know what the previous element is), nor does it know what the beginning or end of the sequence is. Throughout the rest of this note and in the problems [located here](/cs61b/singly_linked_list/#problems), I will be using this [Singly Linked List]({% code singly_linked_list %}) class.

#### Tradeoffs

A linked list has several advantages and disadvantages. For one, since each node only has a pointer to the next node, finding a particular node is a pretty costly task. One of the advantages or using a singly linked list is the ease of writing algotihms to add, update, and remove elements. Because of a singly linked list is an inherently recursive data structure, the algorithms are often simpler with one or two base cases and one or two recursive cases. An example of simple recursive algorithms would be to [merge two singly linked lists](/cs61b/singly_linked_list/merging_two_singly_linked_lists) and [reversing a singly linked list](/cs61b/singly_linked_list/reverse_singly_linked_list).

#### Runtime of Common Operations

When analyzing a new data structure, we often look at three crucial operations and their runtime: __insert__, __lookup__, __remove__.

__Insert__: For a singly linked list, inserting an element at the beginning is a &Theta;(1) operation. [Solution here](/cs61b/singly_linked_list/insert_beginning_of_singly_linked_list). However, for inserting an element into the middle or end of a singly linked list, the runtime is &Theta;(n) because we must follow all of the pointers to our desired location to then insert our element. [Solution here](/cs61b/singly_linked_list/insert_general_singly_linked_list).

__Lookup__: Lookup on a singly linked list is a linear (&Theta;(n)) operation because like insert, we must iterate over all elements that lead up to our desired element before selecting it. [Solution here](/cs61b/singly_linked_list/lookup_singly_linked_list).

__Remove__: Removing an item from a singly linked list is also a linear time operation (&Theta;(n)). Like insert and lookup above, we must search for our desired element which takes &Theta;(n) time. The actual removal operation is a constant time operation because we just manipulate pointers to skip over the element. [Solution here](/cs61b/singly_linked_list/remove_singly_linked_list).
