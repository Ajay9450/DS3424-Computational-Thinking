(define (flatten lst)
  (cond
    ((null? lst) '())                       ; empty list
    ((list? (car lst))                      ; first element is a sublist
     (append (flatten (car lst))            ; flatten the sublist
             (flatten (cdr lst))))          ; flatten the rest
    (else                                   ; first element is an atom
     (cons (car lst)
           (flatten (cdr lst))))))
