;;;Exercise 2.83.  Suppose you are designing a generic arithmetic system for dealing with the tower of types shown in figure 2.25: integer, rational, real, complex.
;;;For each type (except complex), design a procedure that raises objects of that type one level in the tower. 
;;;Show how to install a generic raise operation that will work for each type (except complex). 
(define (raise n)
  (apply-generic 'raise n)) 

(define (raise-int i)
  (make-rational i 1)
  )

(put 'raise '(integer) raise-int)

(define (raise-rat r)
  (make-real (/ (numer r) (denom r)))
  )
(put 'raise '(rational) raise-rat)

(define (raise-real r)
  (make-from-real-imag r 0)
  )

(put 'raise '(real) raise-real)
