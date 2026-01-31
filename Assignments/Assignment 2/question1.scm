(define my-map
  (lambda (proc lst)
    (if (null? lst)
        '()
        (cons (proc (car lst))
              (my-map proc (cdr lst))))))

              