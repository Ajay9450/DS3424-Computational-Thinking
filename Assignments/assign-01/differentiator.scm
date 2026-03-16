;; differentiator.scm
;; symbolic differentiation engine

(load "table.scm")

;; -----------------------------
;; helpers
;; -----------------------------

(define operator car)
(define operand1 cadr)
(define operand2 caddr)

;; -----------------------------
;; main derivative procedure
;; -----------------------------

(define (deriv expr var)
(cond
((number? expr) 0)

((symbol? expr)
 (if (eq? expr var) 1 0))

((pair? expr)
 (let ((proc (get (operator expr))))
   (if proc
       (proc expr var)
       (error "Unknown operator" (operator expr)))))

(else expr)))

;; -----------------------------
;; ADDITION
;; -----------------------------

(define (deriv+ expr var)
(list '+
(deriv (operand1 expr) var)
(deriv (operand2 expr) var)))

(put '+ deriv+)

;; -----------------------------
;; SUBTRACTION
;; -----------------------------

(define (deriv- expr var)
(list '-
(deriv (operand1 expr) var)
(deriv (operand2 expr) var)))

(put '- deriv-)

;; -----------------------------
;; MULTIPLICATION
;; -----------------------------

(define (deriv* expr var)
(let ((u (operand1 expr))
(v (operand2 expr)))
(list '+
(list '* u (deriv v var))
(list '* v (deriv u var)))))

(put '* deriv*)

;; -----------------------------
;; DIVISION
;; -----------------------------

(define (deriv/ expr var)
(let ((u (operand1 expr))
(v (operand2 expr)))
(list '/
(list '-
(list '* v (deriv u var))
(list '* u (deriv v var)))
(list '* v v))))

(put '/ deriv/)

;; -----------------------------
;; SIN
;; -----------------------------

(define (derivsin expr var)
(let ((u (operand1 expr)))
(list '*
(list 'cos u)
(deriv u var))))

(put 'sin derivsin)

;; -----------------------------
;; COS
;; -----------------------------

(define (derivcos expr var)
(let ((u (operand1 expr)))
(list '*
-1
(list '*
(list 'sin u)
(deriv u var)))))

(put 'cos derivcos)

;; -----------------------------
;; EXP
;; -----------------------------

(define (derivexp expr var)
(let ((u (operand1 expr)))
(list '*
(list 'exp u)
(deriv u var))))

(put 'exp derivexp)

;; -----------------------------
;; LOG
;; -----------------------------

(define (derivlog expr var)
(let ((u (operand1 expr)))
(list '*
(list '/ 1 u)
(deriv u var))))

(put 'log derivlog)


(define (diff expr var) (simplify (deriv expr var)))