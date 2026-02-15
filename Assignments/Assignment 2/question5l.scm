(define cartesian-product
  (lambda (lst1 lst2)
    (cond
      ((or (null? lst1) (null? lst2)) '())
      (else
       (append
        (map (lambda (x) (cons x (car lst2))) lst1)
        (cartesian-product lst1 (cdr lst2)))))))