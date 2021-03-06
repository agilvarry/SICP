;;;Exercise 1.22

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;;Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range.

(define (seach-for-primes s e number)
  (cond (or (= number 0) (>= s e) 'done)    
        ((odd? s) (seach-for-primes (+ s 1) e))
        (else  (timed-prime-test s)  (seach-for-primes (+ s 1) e))           
        )))

(search-for-primes 1000 10000 3)