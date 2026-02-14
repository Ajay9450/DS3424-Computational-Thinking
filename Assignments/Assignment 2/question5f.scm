(define delete-nth
(lambda (n list)
  (cond
    ((null? list) '())
    ((= n 0) (cdr list))
    (else 
      (cons (car list) (delete-nth (- n 1) (cdr list))
    )))))