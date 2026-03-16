;; main.scm
;; entry point for symbolic differentiation program

(load "differentiator.scm")
(load "simplifier.scm")

;; --------------------------------
;; wrapper function
;; --------------------------------

(define (differentiate expr var)
(simplify (deriv expr var)))

;; --------------------------------
;; helper function to print results
;; --------------------------------

(define (show-derivative expr var)
(display "d/d")
(display var)
(display " ")
(display expr)
(display " = ")
(display (differentiate expr var))
(newline))

;; --------------------------------
;; test cases
;; --------------------------------

(show-derivative '(+ x 3) 'x)

(show-derivative '(* x x) 'x)

(show-derivative '(* x y) 'x)

(show-derivative '(sin x) 'x)

(show-derivative '(log x) 'x)
