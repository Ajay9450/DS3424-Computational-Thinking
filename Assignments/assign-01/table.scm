;; table.scm
;; Operation table for data-directed programming

;; Global table storing (operator . procedure) pairs
(define table '())

;; --------------------------------------------------
;; put : store an operator and its associated procedure
;; Example: (put '+ deriv+)
;; --------------------------------------------------
(define (put op proc)
(set! table (cons (cons op proc) table)))

;; --------------------------------------------------
;; get : retrieve the procedure associated with operator
;; Example: (get '+) → deriv+
;; --------------------------------------------------
(define (get op)
(let ((entry (assoc op table)))
(and entry (cdr entry))))
