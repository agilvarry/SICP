;;;Exercise 2.21.  The procedure square-list takes a list of numbers as argument and returns a list of the squares of those numbers.

(define (square n) (* n n))



;;;Here are two different definitions of square-list. Complete both of them by filling in the missing expressions:

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items) (cdr items)))))
(define (square-list items)
  (map square items))

(square-list (list 1 2 3 4))
;(1 4 9 16)