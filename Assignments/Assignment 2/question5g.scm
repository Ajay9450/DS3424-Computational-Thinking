(define insert-nth
(lambda (n item list)
  (cond
    ((null? list) (cons item '()))
    ((= n 0) (cons item list))
    (else 
      (cons (car list) (insert-nth (- n 1) item (cdr list))
    )))))