(define (my-filter pred lst)
  (cond
    ((null? lst) '())
    ((pred (car lst))
     (cons (car lst)
           (my-filter pred (cdr lst))))
    (else
     (my-filter pred (cdr lst)))))
