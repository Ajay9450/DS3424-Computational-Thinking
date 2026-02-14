(define (list-of-numbers? lst)
  (cond
    ((null? lst) #t)
    ((number? (car lst))
     (list-of-numbers? (cdr lst)))
    (else #f)))
