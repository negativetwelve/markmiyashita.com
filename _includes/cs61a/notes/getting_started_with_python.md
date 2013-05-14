Welcome to CS61A! For the most part, this course is not about learning Python, the language, but instead, we focus on big computer science ideas. However, to implement those ideas in code...we need Python to do so. So we're going to spend the first 1-2 weeks going over simple ideas in Python that will allow us to work on implementing the bigger ideas of the course.

Let's start with a few fundamentals. First, we have variables. Variables are like labels, they allow us to store values and to use them later. In Python, it does not matter what type of data we store in the variable, it can be a string, integer, function, etc. We'll learn all about what those are later. For now, let's define some variables and see how that work!

<pre>
  <code class="prettyprint">
>>> a = 5
>>> b = 6
>>> a
5
>>> b
6
  </code>
</pre>

Here, we defined to variables, <code>a</code> and <code>b</code> and their values are now 5 and 6, respectively.

Strings are like words or sentences and we represent them as being surrounded by either single quotes, <code>'</code> or double quotes, <code>"</code>. We can store strings as variables too.

<pre>
  <code class="prettyprint">
>>> c = "hello world"
>>> c
'hello world'
  </code>
</pre>

Notice how we defined our string with double quotes, but when we recalled the value, Python represented the same string with single quotes. Either way works and they mean the same thing, just remember that Python uses single quotes when it represents strings.

The reason why we use double quotes sometimes is so that we can represent a string that has a single quote in the middle of it. For example:

<pre>
  <code class="prettyprint">
>>> d = 'don't do this'
File "&lt;stdin&gt;", line 1
  d = 'don't do this'
             ^
SyntaxError: invalid syntax
>>>
  </code>
</pre>

Here, we encounter a syntax error because Python thinks the string ends at <code>'don'</code> and then doesn't know what to do with the rest. The proper way to represent this string is to do the following:

<pre>
  <code class="prettyprint">
>>> d = "don't (not) do this"
>>> d
"don't (not) do this"
  </code>
</pre>

Now it works!

