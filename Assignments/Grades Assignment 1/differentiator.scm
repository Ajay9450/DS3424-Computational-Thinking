;; differentiator.scm

(load "table.scm")

;; helpers
(define operator car)
(define operand1 cadr)
(define operand2 caddr)

;; main derivative procedure

(define (deriv expr var)

  (cond

    ;; constant
    ((number? expr) 0)

    ;; variable
    ((symbol? expr)
     (if (eq? expr var) 1 0))

    ;; operator expression
    (else
      (let ((proc (get (operator expr))))
        (if proc
            (proc expr var)
            (error "Unknown operator"))))))
            

;; --------------------
;; ADDITION
;; --------------------

(define (deriv+ expr var)
  (list '+
        (deriv (operand1 expr) var)
        (deriv (operand2 expr) var)))

(put '+ deriv+)


;; --------------------
;; SUBTRACTION
;; --------------------

(define (deriv- expr var)
  (list '-
        (deriv (operand1 expr) var)
        (deriv (operand2 expr) var)))

(put '- deriv-)


;; --------------------
;; MULTIPLICATION
;; --------------------

(define (deriv* expr var)
  (list '+
        (list '* (operand1 expr)
              (deriv (operand2 expr) var))
        (list '* (operand2 expr)
              (deriv (operand1 expr) var))))

(put '* deriv*)


;; --------------------
;; DIVISION
;; --------------------

(define (deriv/ expr var)
  (list '/
        (list '-
              (list '* (operand2 expr)
                    (deriv (operand1 expr) var))
              (list '* (operand1 expr)
                    (deriv (operand2 expr) var)))
        (list '* (operand2 expr) (operand2 expr))))

(put '/ deriv/)


;; --------------------
;; SIN
;; --------------------

(define (derivsin expr var)
  (list '*
        (list 'cos (operand1 expr))
        (deriv (operand1 expr) var)))

(put 'sin derivsin)


;; --------------------
;; COS
;; --------------------

(define (derivcos expr var)
  (list '*
        -1
        (list '*
              (list 'sin (operand1 expr))
              (deriv (operand1 expr) var))))

(put 'cos derivcos)


;; --------------------
;; EXP
;; --------------------

(define (derivexp expr var)
  (list '*
        (list 'exp (operand1 expr))
        (deriv (operand1 expr) var)))

(put 'exp derivexp)


;; --------------------
;; LOG
;; --------------------

(define (derivlog expr var)
  (list '*
        (list '/ 1 (operand1 expr))
        (deriv (operand1 expr) var)))

(put 'log derivlog)