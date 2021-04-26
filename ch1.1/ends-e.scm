;;;Write a procedure ends-e that takes a sentence as its argument and returns a sentence containing only those words of the argument whose last letter is E


(define (ends-e s)
  (cond ((empty? s) '())
        ((equal? (last (first s)) 'e) (se (first s) (ends-e (bf s))))
        (else (ends-e (bf s))) 
   )
)

(ends-e '(please put the salami above the blue elephant))
;(please the above the blue)