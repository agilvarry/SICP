;;;Exercise 2.18.  Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:

;attempt 1
;(define (reverse l)
;  (cond ((=(length l) 1) (car l))
;        (else (list (reverse (cdr l)) (car l)))
;        )
;  )
;attempt 2
;(define (reverse l)
;  (define (iter lst rev)
;    (cond ((=(length lst) 1) (car lst))
;          (else (iter (cdr lst) (list rev (car lst)))))
;    )
;  (iter l nil)
;  )

;working attempt
(define (reverse lst)
  (if (null? (cdr lst))
      lst
      (append (reverse (cdr lst)) (list (car lst))))       

  )


(reverse (list 1 4 9 16 25))
