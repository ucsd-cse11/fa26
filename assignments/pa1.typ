#import "../lib/site.typ": link-out

#let pa1 = [

  *This is a draft until officially released and this notice is removed*

  = PA 1

== Analog Clock

Files: `Clock.java`, `clock-examples.pdf`

Design and implement a program that draws a picture of an analog clock face at a
particular time. You can choose how you use `record`s and methods, how the
picture is drawn, what the fields and arguments are, and how time is
represented.

Include five examples of drawn clocks in your submission that showcase
interesting parts of your implementation. For each, show the Java code that
produces the clock, and the rendering of the clock image itself. Include these
examples in a PDF called `clock-examples.pdf`.

In a comment, write a few sentences about which data from the problem
description you chose to put in fields vs. arguments, and why how you chose the
type for each.

== Class Overlap

Files: `Overlap.java`

Design a program with a `record` to represent a lecture day, time, and duration.
Give it a method that takes *another* instance of the record, and reports
whether the two times *overlap*. You choose the fields for the record.

Give at least ten interesting examples of comparing times for overlap that
overlap (or don't) for different reasons.

In a comment, write a paragraph detailing assumptions you made in your
representation and at least one alternative design you considered.

== Checkerboard

Files: `Checkerboard.java`

Write a definition of a checkerboard image (8x8, alternating square colors).
Don't use loops.

In a comment, write a sentence or two about what you did to save repeated
identical definitions.

== Valid Name

Files: `ValidName.java`

Imagine you have a job at a company related to account sign up. Design (don't
implement yet) a method that takes a `String` and reports if it is likely a
valid last name. Justify your design in a few sentences and write it in a
comment in the file.

Then, ask an AI agent to generate code based on your design. Hand in the
generated code, say *which* model/agent/tool you used. Then also say:

- Something notable you learned about Java from reading its implementation
- Cases where you think your program could accept an invalid name (a false
positive) *and* a case where you think your program could reject a valid name (a
false negative).
- Argue for or against this statement: “It is possible to implement this method
correctly.”


== Handin

Hand in your submission to Gradescope in the assignment `pa1`. Each program you
write should be in a separate file

]

/* Assignments:
 * - Basic methods: perimeter, ftoc, 
 * - Some drawing things: clock face? flags? emoji?
 *   Gets at construction with *our* constructors.
 * Maybe making a custom method with a size param? Or a custom class with a size
 * param? Design the parameterizability, review good examples and *variants*.
 * Come up with two different ways to do render?
 * 
 * Shipping the image lib? As a .jar?
 * 
 * Represent a class schedule and conflicts? Do two classes conflict? Maybe have
 * them represent a ClassTime structure in Java with a `conflictsWith` in PA1,
 * then extend it in the next one (arrays, etc). Really should do arrays sooner
 * 
 *
 * 
 * 
 * How to represent a class? Does each class have a list of times? Are the times their own classes?
 * That's a pretty rich problem actually, and different kinds of conflicts
 * "Build TSS" is kind of funny because TSS "sucks" but this is hard enough to make a point
 * 
 * 
 * 
 * 
 * 
 * 
 */

/*
 * OK what about an assignment where they build a chatbot. An interface defines
 * _which_ model they are calling out to. They can try different ones.
 * 
 * Then you can also override things at the *model* level vs. at the program
 * level. Could upgrade to agents with tools, too.
 */



/*
 * What do we review + what is the review cadence? In-class review derived from
 * their submissions?
 * Can we use discussion sections for studio (how many are there?)
 * 
 */




/*
 * What do we ask them to *submit*? A PDF? A demo video for each?
 * Coding environment? Can't use Github Classroom (bummer). Could use codespaces
 * 
 */

/*
 * 
 * Numbers, strings, simple method calls
 *
 */
