;;;Exercise 2.80.  Define a generic predicate =zero? that tests if its argument is zero, and install it in the generic arithmetic package. 
;;;This operation should work for ordinary numbers, rational numbers, and complex numbers.

(put '=zero? '(scheme-number)
     (lambda (n) (= 0 n)))

(define (=zero-rat? n)
  (= n (make-rat 0 1)))

(put '=zero? '(rat) =zero-rat?)


(define (=zero-comp? n)
  (equ? n (make-complex-from-real-imag 0 0)))
    

(put '=zero? '(comp) =zero-comp?)