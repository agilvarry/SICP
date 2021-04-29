;;;You can obtain an even more general version of accumulate (exercise 1.32) by introducing the notion of a filter on the terms to be combined.
;; That is, combine only those terms derived from values in the range that satisfy a specified condition. 
;;The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. 

(define (inc x) (+ x 1))

(define (identity x) x) 

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;;Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:
(define (filtered-accumulate combiner filter null-value term a next b)
  (cond ((and (> a b) null-value))
        ((filter a)  (combiner (term a) (filtered-accumulate combiner filter null-value term (next a) next b)))
        (else (filtered-accumulate combiner filter null-value term (next a) next b))
        )
  )  

;;a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)
(define (sum-prime-squares a b)
  (define (prime? n) 
    (if (= n 1) false (= n (smallest-div n)))) 
  (define (square x) (* x x))
  (filtered-accumulate + prime? 0 square a inc b)
  )

;;b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1). 

(define (relative-prime-prod n)
  (define (rel-prime? x)
    (= (gcd x n) 1) 
    )
  (filtered-accumulate * rel-prime? 1 identity 1 inc n) 
  )
