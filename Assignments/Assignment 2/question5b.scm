(define (list-of-numbers-v2 lst)
    (define (iter remaining)
        (cond
            ((null? remaining) #t)
            ((not (number? (car remaining))) #f)
            (else (iter (cdr remaining)))))
        
    (iter lst))
    

    ;;; This is an example of tail 