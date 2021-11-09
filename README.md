**Connect Four**

A game of Connect Four I made from scratch, predominantly in order to get practice with Unit Testing and Test-Driven-Development

**Demo**

![Connect Four Demo image](https://github.com/mgrigoriev8109/connect-four/blob/main/connectfour.png?raw=true)

**Features**
A two player game in which Players choose names, and place their markers in specific cells until one of them has four cells in a row - whether that is vertically, horizontally, or diagonally.

**How to use**
Go to https://replit.com/@mgrig92/connect-four-3#.replit and click the green *Run* button up top.

**Possible future additions / Things I would like to implement in future projects**
-Add more input validation
-Clean method and variable names, so that the code reads more like plain english
-Refactor the Recursive methods that check for winners, right now they're as readable as I would like.
-Find better placement for the procs I used outside of my Game class. Possibly another class, and then use inheritance?

**Known Bugs**
-Although user can select a row to drop the marker into, such as "1" will drop the marker to the bottom of Row 1, this does not check for winners once the marker is dropped, the placement has to be precise.

**Reflections**
This was a great introduction to Test Driven Development, and I ran into many situations where my tests saved me. Moments where I broke something and could quickly tell what it was, or when I tried to add a feature and saw that my tests should be different.

In the future I would like to continue using TDD, although in my next project I might begin by creating a cleaner Driver Script (which obviously won't work, but will have readable understandable names and dictate the overall logic for the game), and proceed from there with TDD Unit Tests.

Although, as I pointed out in the future additions section, there are a lot of ways in which I can refactor and improve this project, I'd rather get started on my next project - Chess - and have a chance to do all of those things as I'm building Chess.

Before I begin Chess though, it's apparent to me that I need to get a better understanding of OOP and Testing, so I'll be reading 99 bottles of OOP by Sandi Metz. 
