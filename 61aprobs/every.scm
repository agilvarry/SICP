;;;Last week you wrote proceduressquares, that squared each number in its argument sentence, and saw pigl-sent, tha tpigled each word in its argument sentence. 
;;Generalize this pattern to create a higher-order procedure called every that applies an arbitrary procedure, given an argument, to each word of an argument sentence.

(define (square x) (* x x))

(define (every procedure arg)
  (if (empty? arg)
      '()
      (se (procedure (first arg)) (every procedure (bf arg))) 
      )
  )


(every square '(1 2 3 4))
;(1 4 9 16)

(every first '(nowhere man))
;(n m)