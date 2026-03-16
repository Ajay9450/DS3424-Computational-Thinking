;; simplifier.scm

(define (simplify expr)

  (cond

    ((number? expr) expr)

    ((symbol? expr) expr)

    ;; addition
    ((eq? (car expr) '+)
     (let ((a (simplify (cadr expr)))
           (b (simplify (caddr expr))))
       (cond
         ((equal? a 0) b)
         ((equal? b 0) a)
         ((and (number? a) (number? b)) (+ a b))
         (else (list '+ a b)))))

    ;; subtraction
    ((eq? (car expr) '-)
     (let ((a (simplify (cadr expr)))
           (b (simplify (caddr expr))))
       (cond
         ((equal? b 0) a)
         ((and (number? a) (number? b)) (- a b))
         (else (list '- a b)))))

    ;; multiplication
    ((eq? (car expr) '*)
     (let ((a (simplify (cadr expr)))
           (b (simplify (caddr expr))))
       (cond
         ((or (equal? a 0) (equal? b 0)) 0)
         ((equal? a 1) b)
         ((equal? b 1) a)
         ((and (number? a) (number? b)) (* a b))
         (else (list '* a b)))))

    ;; division
    ((eq? (car expr) '/)
     (let ((a (simplify (cadr expr)))
           (b (simplify (caddr expr))))
       (cond
         ((equal? a 0) 0)
         ((equal? b 1) a)
         ((and (number? a) (number? b)) (/ a b))
         (else (list '/ a b)))))

    (else expr)))