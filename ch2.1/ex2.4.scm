;;;Exercise 2.4.  Here is an alternative procedural representation of pairs. For this representation, verify that (car (cons x y)) yields x for any objects x and y.
;;;What is the corresponding definition of cdr? (Hint: To verify that this works, make use of the substitution model of section 1.1.5.) 

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 'x 'y))
(cdr (cons 'x 'y))