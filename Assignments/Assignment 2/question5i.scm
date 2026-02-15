(define (reverse-list lst)
  (cond
    ((null? lst) '())
    (else (append (reverse-list (cdr lst))
                  (list (car lst))))))

(define (reverse-list-iter lst)
  (define (iter remaining result)
    (if (null? remaining)
        result
        (iter (cdr remaining)
              (cons (car remaining) result))))
  (iter lst '()))
