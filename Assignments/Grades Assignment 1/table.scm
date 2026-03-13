;; table.scm
;; operation table for data-directed programming

(define table '())

(define (put op proc)
  (set! table (cons (cons op proc) table)))

(define (get op)
  (let ((entry (assoc op table)))
    (if entry
        (cdr entry)
        #f)))