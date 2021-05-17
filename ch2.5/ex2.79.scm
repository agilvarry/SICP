;;;Exercise 2.79.  Define a generic equality predicate equ? that tests the equality of two numbers, and install it in the generic arithmetic package. 
;;;This operation should work for ordinary numbers, rational numbers, and complex numbers. 

(put 'equ? '(scheme-number1 scheme-number2)
     (lambda (x y) (= x y)))

(define (equ-rat? x y)
  (and (= (denom x) (denom y))
       (=  (num x) (num y))))

(put 'equ? '(rat1 rat2) equ-rat?)


(define (equ-comp? x y)
    (and (= (real-part x) (real-part y))
	 (= (imag-part x) (imag-part y))))

(put 'equ? '(comp1 comp2) equ-comp?)