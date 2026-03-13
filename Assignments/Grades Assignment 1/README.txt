Approach:
This project implements symbolic differentiation using
data-directed programming in Scheme. A rule table is used
to associate operators with their derivative procedures.

The system supports differentiation of:
+ - * / sin cos exp log

A simplifier reduces the resulting symbolic expressions.

Example interaction:

$ guile
scheme@(guile-user)> (load "main.scm")

d/dx (x * x)
(+ x x)

Pros:
- Modular design
- Easy to add new operators
- Follows SICP symbolic differentiation approach

Cons:
- Simplifier is limited
- Supports only binary operators