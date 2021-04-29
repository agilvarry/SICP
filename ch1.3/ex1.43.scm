;;; If f is a numerical function and n is a positive integer, then we can form the nth repeated application of f,
;;;which is defined to be the function whose value at x is f(f(...(f(x))...)). For example, if f is the function x-> x + 1, 
;;;then the nth repeated application of f is the function x x + n. If f is the operation of squaring a number, 
;;;then the nth repeated application of f is the function that raises its argument to the 2nth power.
;;;Write a procedure that takes as inputs a procedure that computes f and a positive integer n and returns the procedure that computes the nth repeated application of f.
;;;Hint: You may find it convenient to use compose from exercise 1.42. 
(define (square x) (* x x))
(define (inc x) (+ 1 x))
(define (dec x) (- x 1))

(define (compose f g)
  (lambda (x)
    (f (g x))
    )
  )  
(define (identity x) x)

((compose square inc) 6)


(define (repeated func iter)
  (if (= iter 1)
      func
      (compose func (repeated func (dec iter)) )
      )
)

((repeated square 2) 5)