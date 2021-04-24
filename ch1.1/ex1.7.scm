(define (sqroot x)
  ;;original from test
  ;(define (good-enough? guess)
  ;  (< (abs (- (square guess) x)) 0.001))

  ;;improvement from text problem
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) (* guess 0.001)))



  (define (improve guess)
    (average guess (/ x guess)))

  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (sqrt-iter 1.0))

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))