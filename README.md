http://backend.turing.io/module1/projects/perilous_journey

Linked Lists

Linked Lists are one of the most fundamental Computer Science data structures. A Linked List models a collection of data as a series of “nodes” which link to one another in a chain.

In a singly-linked list (the type we will be building) you have a head, which is a node representing the “start” of the list, and subsequent nodes which make up the remainder of the list.

The list itself can hold a reference to one thing – the head node.

Each node can hold a single element of data and a link to the next node in the list.

The last node of the list is often called its tail.

Using sweet ASCII art, it might look like this:

List -- (head) --> ["hello" | -]-- (link) --> ["world" | -]-- (link) --> ["!" | ]
The three nodes here hold the data “hello”, “world”, and “!”. The first two nodes have links which point to other nodes. The last node, holding the data “!”, has no reference in the link spot. This signifies that it is the end of the list.

Iterative Development

As we work through this project, we’ll be following an iterative development process. This means we’ll aim to build the system out of small but complete chunks which could reasonably stand on their own to perform some required function. The iterations are outlined below. It may be worth reading through them all at first to get a sense of the scope of the entire project, but we encourage you to then forget about later iterations until you get to them.

The point of this process is to help us focus on small pieces at a time without getting overwhelmed by the scope of the entire project.

Iteration Base Expectations

Iteration 0 - Node Basics
Iteration 1 - Append, To String, and Count (Single Node)
Iteration 2 - Append, To String, and Insert (Multiple Nodes)
Iteration 3 - Insert and Prepend
Iteration 4 - Find, Pop, and Includes?
Iteration 5 - Creating the WagonTrain Linked List “Wrapper”
Iteration 6 - Carrying Supplies
Extensions - Hunting and Circle the Wagons
Tips

A linked list it not an array. While it may perform many of the same functions as an array, its structure is conceptually very different.
There are only 3 types of “state” that need to be tracked for a linked list – the head of the list, the data of each node, and the “next node” of each node.
In object-oriented programming, “state” is generally modeled with instance variables
There are two main ways to implement Linked Lists: iteration and recursion. Iterative solutions use looping structures (while, for) to walk through the nodes in the list. Recursive solutions use methods which call themselves to walk through nodes. It would be ideal to solve it each way.
Most of your methods will be defined on the List itself, but you will need to manipulate one or more Nodes to implement them.
TDD will be your friend in implementing the list. Remember to start small, work iteratively, and test all of your methods.
An empty list has nil as its head
The tail of a list is the node that has nil as its next node
Constraints

Make sure that your code is well tested for both expected cases and edge cases. Try popping more elements than there are in the list. Try seeing if an empty list includes anything. Try inserting elements at a position beyond the length of the list.
Avoid using other ruby collections (Arrays, Hashes, etc) for the storage of your wagons. That’s where you’re supposed to use the linked list. But having Arrays elsewhere in your code, or using methods that return arrays (like .split) are totally ok.
Resources

Need some help on Linked Lists? You can check out some of the following resources:

https://www.youtube.com/watch?v=oiW79L8VYXk
http://www.eternallyconfuzzled.com/tuts/datastructures/jsw_tut_linklist.aspx
http://www.cs.cmu.edu/~adamchik/15-121/lectures/Linked%20Lists/linked%20lists.html
http://www.sitepoint.com/rubys-missing-data-structure/
Evaluation Rubric

The project will be assessed with the following rubric:

1. Ruby Syntax & Style

4: Application demonstrates excellent knowledge of Ruby syntax, style, and refactoring
3: Application shows strong effort towards organization, content, and refactoring
2: Application runs but the code has long methods, unnecessary or poorly named variables, and needs significant refactoring
1: Application generates syntax error or crashes during execution

2. Breaking Logic into Components

4: Application is expertly divided into logical components each with a clear, single responsibility
3: Application effectively breaks logical components apart but breaks the principle of SRP
2: Application shows some effort to break logic into components, but the divisions are inconsistent or unclear
1: Application logic shows poor decomposition with too much logic mashed together

3. Test-Driven Development

4: Application is broken into components which are well tested in both isolation and integration using appropriate data
3: Application is well tested but does not balance isolation and integration tests, using only the data necessary to test the functionality
2: Application makes some use of tests, but the coverage is insufficient
1: Application does not demonstrate strong use of TDD

4. Functional Expectations

4: Application meets all requirements, and implements one extension properly.
3: Application meets all requirements as laid out per the specification.
2: Application runs, but does not work properly, or does not meet specifications.
1: Application does not run, crashes on start.
