;;Write a procedure squares that takes a sentence of numbers as its argument andreturns a sentence of the squares of the numbers
(define (square x) (* x x))


(define (squares x)
  (if (empty? x)
      '()
      (se (square (first x)) (squares (bf x)))
  )
)

 

  
(squares '(2 3 4 5))
;(4 9 16 25)