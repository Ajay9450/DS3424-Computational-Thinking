;; main.scm

(load "differentiator.scm")
(load "simplifier.scm")

(define (differentiate expr var)
  (simplify (deriv expr var)))


(display "d/dx (x + 3): ")
(display (differentiate '(+ x 3) 'x))
(newline)

(display "d/dx (x * x): ")
(display (differentiate '(* x x) 'x))
(newline)

(display "d/dx (x * y): ")
(display (differentiate '(* x y) 'x))
(newline)

(display "d/dx (sin x): ")
(display (differentiate '(sin x) 'x))
(newline)

(display "d/dx (log x): ")
(display (differentiate '(log x) 'x))
(newline)