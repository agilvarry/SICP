;;;Exercise 2.2

(define (make-segment point-a point-b)
  (cons point-a point-b)
  )

(define (start-segment seg)
  (car s)
  )

(define (end-segment seg)
  (cdr s)
  )

(define (make-point x y)
  (cons x y)
  )

(define (x-point p)
  (car p)
  )

(define (y-point x)
  (cdr p)
  )

(define (midpoint-segment seg)
  (make-point (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2)
              (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2)
              ))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))