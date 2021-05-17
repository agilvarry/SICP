(define (cubert x)

  (define (good-enough? guess) 
   (= (improve guess) guess)) 

  (define (improve guess)
  (/ (+ (/ x (square guess))(* 2 guess)) 3))

  (define (cube-iter guess)
    (if (good-enough? guess)
        guess
        (cube-iter (improve guess))))

  (cube-iter 1.1))

(define (square x) (* x x))

(cubert 27)