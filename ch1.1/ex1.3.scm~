(define (square x) (* x x ))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square-larger x y z)
  (cond ((and (>= x y) (>= y z)) (sum-of-squares x y))
        ((and (>= x z) (>= z y )) (sum-of-squares x z))
        (else (sum-of-squares y z))))

(square-larger 1 4 3)