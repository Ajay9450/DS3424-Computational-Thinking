(define (nth-element lst n)
  (cond
    ((null? lst) (error "Index out of bounds"))
    ((= n 0) (car lst))
    (else (nth-element (cdr lst) (- n 1)))))