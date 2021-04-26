;;;Write a predicateordered?that takes a sentence of numbers as its argument andreturns a true value if the numbers are in ascending order, ora false value otherwise.

(define (ordered? n)
  (cond ((empty? (bf n)) #t)
        ((< (first n) (first (bf n))) #t)
        (else #f))
)

(ordered? '(2 1 3 4 5 6))

(ordered? '(4 5 6))