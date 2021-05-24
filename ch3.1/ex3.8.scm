;;;Exercise 3.8.  Define a simple procedure f such that evaluating (+ (f 0) (f 1)) will return 0 if the arguments to + are evaluated from left 
;;;to right but will return 1 if the arguments are evaluated from right to left.

(define f
  (let ((first 1))
    (lambda (n)
      (set! first (* first n))
      first)))

(+ (f 1) (f 0))