;;;Exercise 2.8.  Using reasoning analogous to Alyssa's, describe how the difference of two intervals may be computed. Define a corresponding subtraction procedure, called sub-interval.
;;this one i cam up with
;(define (sub-interval x y)
;  (make-interval (- (lower-bound x) (upper-bound y))
;                 (- (upper-bound x) (lower-bound y))))

;;this one is intended
(define (div-interval x y)
  (add-interval x 
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))