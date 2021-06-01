;;;Exercise 3.55.  Define a procedure partial-sums that takes as argument a stream S and returns the stream whose elements are S0, S0 + S1, S0 + S1 + S2, .... 
;;;For example, (partial-sums integers) should be the stream 1, 3, 6, 10, 15, .... 


(define (partial-sums s)
    (cons-steam (stream-car s) 
        (add-streams (stream-car s) (partial-sums (stream-cdr s)))))   