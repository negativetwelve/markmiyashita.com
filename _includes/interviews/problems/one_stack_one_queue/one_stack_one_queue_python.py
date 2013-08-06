# One Stack, One Queue - Python Solution
# By: Mark Miyashita

class Queue(object):
    """Build a queue using only one stack."""

    def __init__(self):
        self.items = []

    def enqueue(self, item):
        """Adds an item to the queue.

        >>> q = Queue()
        >>> q
        []
        >>> q.enqueue(1)
        >>> q
        [1]
        >>> q.enqueue(4)
        >>> q
        [1, 4]
        """
        self.items.append(item)

    def dequeue(self):
        """Removes the first item in the queue.

        >>> q = Queue()
        >>> q
        []
        >>> q.enqueue(14)
        >>> q.enqueue(123)
        >>> q
        [14, 123]
        >>> q.dequeue()
        14
        >>> q
        [123]
        """
        temp = self.items.pop()
        if not self.items:
            return temp
        item = self.dequeue()
        self.items.append(temp)
        return item

    def __repr__(self):
        return repr(self.items)
