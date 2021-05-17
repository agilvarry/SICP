;;;Exercise 1.18.  Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms  
;;;of adding, doubling, and halving and uses a logarithmic number of steps.
 (define (double x) (+ x x)) 
 (define (halve x) (/ x 2)) 

(define (fast-mult b n)
  (define (iter-mult a b n)
    (cond ((= n 1) a)
          ((even? n) (iter-mult a (double b) (half n)))
          (else (iter-mult (+ b a) b (- n 1)))
         
          )
    (fast-mult b 1 n)
    )

