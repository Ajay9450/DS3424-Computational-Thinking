(define (my-deep-filter pred lst)
  (cond
    ((null? lst) '())

    ((list? (car lst))
     (append (my-deep-filter pred (car lst))
             (my-deep-filter pred (cdr lst))))

    ((pred (car lst))
     (cons (car lst)
           (my-deep-filter pred (cdr lst))))

    (else
     (my-deep-filter pred (cdr lst)))))
