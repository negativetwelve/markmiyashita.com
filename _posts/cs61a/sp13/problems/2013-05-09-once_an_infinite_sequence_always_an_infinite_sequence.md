---
layout: problem
title: "Once an Infinite Sequence, Always an Infinite Sequence"
type: Challenge
tags: [streams, generators, iterators, coercion, type dispatching]
categories: [cs61a, sp13, problems]
author_name: Mark Miyashita
author_url: http://markmiyashita.com
google_plus: 101180624276428786239

published: true
solution: true
---
<p>
  This problem is quite involved and also covers a lot of different topics from the course. Namely, it covers: type dispatching, coercion, iterators, generators, streams, dictionaries, and generic functions.
</p>

<p>
  As a warmup, let's write simple generators, iterators, and streams. Write one of each that represents the natural numbers stream, iterator, and generator. Think about the different components of each that you need.
</p>

<pre>
  <code class="prettyprint">
def make_natural_numbers_generator():
    "***YOUR CODE HERE***"

def make_natural_numbers_stream(first=0):
    "***YOUR CODE HERE***""

class NaturalNumbersIterator(object):
    "***YOUR CODE HERE***"

  </code>
</pre>

<p>
  Now we'll move onto type dispatching. If you haven't already, refresh your memory with <a href="http://markmiyashita.com/cs61a/sp13/notes/generic_functions_and_type_dispatching/">this note.</a>
</p>

<p>
  We're going to define a generic function <code>add</code> that takes in two infinite sequences and produces a generator that represents the two sequences added together. For example, I can input the natural numbers stream and the natural numbers iterator and get back a generator where the first 5 elements are 0, 2, 4, 6, 8. To do this, we will need the <code>type_tag</code> function that we generally use for type dispatching.
</p>

<pre>
  <code class="prettyprint">
def type_tag(x):
    return type_tag.tags[type(x)]

type_tag.tags = {GeneratorType: 'generator', NaturalNumbers: 'iterator', Stream: 'stream'}
  </code>
</pre>

<p>
  You can find get the class <code>GeneratorType</code> by importing from <code>types</code>. <br>
  <code>from types import GeneratorType</code>.
</p>

<p>
  Now we want to define <code>add</code>.
</p>

<pre>
  <code class="prettyprint">
def add(seq1, seq2):
    "***YOUR CODE HERE***"

add.impl = { "***YOUR CODE HERE***" }
  </code>
</pre>

<p>
  Next, we need to define all of the different functions that compute the addition of the different infinite sequences that we can have. I counted 9 functions that must be created and as a hint, some can be used more than once. I created the following 6 functions. It's a good exercise to go through all of them because it will cement your knowledge of iterators, generators, and streams.
</p>

<pre>
  <code class="prettyprint">
def add_generators(gen1, gen2):
    "*** YOUR CODE HERE***"

def add_generator_and_iterator(gen, iterator):
    "*** YOUR CODE HERE***"

def add_generator_and_stream(gen, stream):
    "*** YOUR CODE HERE***"

def add_iterator_and_stream(iterator, stream):
    "*** YOUR CODE HERE***"

def add_iterators(i1, i2):
    "*** YOUR CODE HERE***"

def add_streams(s1, s2):
    "*** YOUR CODE HERE***"
  </code>
</pre>

<p>
  Now we are able to add two infinite sequences together. After you write this code, the following should work:
</p>

<pre>
  <code class="prettyprint">
>>> s = make_natural_numbers_stream()
>>> g = make_natural_numbers_generator()
>>> i = NaturalNumbersIterator()
>>> added_s_and_g = add(s, g)
>>> next(added_s_and_g)
0
>>> next(added_s_and_g)
2
>>> next(added_s_and_g)
4
>>> g2 = make_natural_numbers_generator()
>>> added_g2_and_i = add(g2, i)
>>> next(added_g2_and_i)
0
>>> next(added_g2_and_i)
2
>>> next(added_g2_and_i)
4
>>> next(added_g2_and_i)
6
  </code>
</pre>

<p>
  I'll make a new post titled: "Once An Infinite Sequence, Always an Infinite Sequence [Part 2]" and a link will be posted here.
</p>

{% if page.solution %}
<button onclick="toggleSolution()">Toggle Solution</button>

<div class="solution">
  <pre>
    <code class="prettyprint">
def make_natural_numbers_generator():
    i = 0
    while True:
        yield i
        i += 1

def make_natural_numbers_stream(first=0):
    def compute_rest():
        return make_natural_numbers_stream(first + 1)
    return Stream(first, compute_rest)

class NaturalNumbersIterator(object):
    def __init__(self):
        self.current = 0

    def __next__(self):
        next = self.current
        self.current += 1
        return next

    def __iter__(self):
        return self
    </code>
  </pre>
  
  <p>
    Here are the natural numbers generator, stream, and iterator. Remember that an iterator needs both a <code>__next__</code> and an <code>__iter__</code> method and that a Stream always keeps track of <i>how</i> to compute its rest.
  </p>

  <pre>
    <code class="prettyprint">
def add(seq1, seq2):
    types = (type_tag(seq1), type_tag(seq2))
    return add.impl[types](seq1, seq2)

def add_generators(gen1, gen2):
    while True:
        yield next(gen1) + next(gen2)

def add_generator_and_iterator(gen, iterator):
    while True:
        yield next(gen) + next(iterator)

def add_generator_and_stream(gen, stream):
    while True:
        yield next(gen) + stream.first
        stream = stream.rest

def add_iterator_and_stream(iterator, stream):
    while True:
        yield next(iterator) + stream.first
        stream = stream.rest

def add_iterators(i1, i2):
    while True:
        yield next(i1) + next(i2)

def add_streams(s1, s2):
    while True:
        yield s1.first + s2.first
        s1, s2 = s1.rest, s2.rest

add.impl = {('generator', 'generator') : add_generators,
            ('generator', 'iterator') : add_generator_and_iterator,
            ('generator', 'stream') : add_generator_and_stream,
            ('iterator', 'stream') : add_iterator_and_stream,
            ('iterator', 'iterator') : add_iterators,
            ('stream', 'stream') : add_streams,
            ('stream', 'generator') : lambda s, g: add_generator_and_stream(g, s),
            ('iterator', 'generator') : lambda i, g: add_generator_and_iterator(g, i),
            ('stream', 'iterator') : lambda s, i: add_iterator_and_stream(i, s)
}
    </code>
  </pre>
</div>
{% endif %}
