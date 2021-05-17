;;;Exercise 2.20
(define (same-parity i . l)
  (define (i-parity)
    (if (even? i)
        (lambda (x) (even? x))
        (lambda (y) (odd? y))
        ))

  (define (iter return remain)
    ;(print return
    (cond ((null? remain)  return)
          
          (((i-parity) (car remain)) 

           (iter (append return (list (car remain))) (cdr remain)))
          (else (iter return (cdr remain)))
          ))
(iter (list i) l)
  ) 

(same-parity 1 2 3 4 5 6 7)
;(1 3 5 7)

(same-parity 2 3 4 5 6 7)
;(2 4 6)