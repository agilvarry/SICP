;;;Exercise 1.27.  Demonstrate that the Carmichael numbers listed in footnote 47 really do fool the Fermat test. That is, write a procedure that 
;;;takes an integer n and tests whether an is congruent to a modulo n for every a<n, and try your procedure on the given Carmichael numbers. 
(define (square n) (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))   

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (charmichael n)
  (define (try-it a)
    (= (expmod a n n) a))

  (define (iter a)
    (if (= a n)
        #t
        (if (try-it a) (iter (+ a 1)) #f)))
  (iter 1))

(charmichael 7919)

(full-fermat-prime? 561)
(full-fermat-prime? 1105)
(full-fermat-prime? 2465)
(full-fermat-prime? 2821)

