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

(define (seg-length seg)
  (sqrt (+ (square (- (x-point (end-segment seg))
                      (x-point (start-segment seg))))
           (square (- (y-point (end-segment seg))
                      (y-point (start-segment seg)))))))

;;;Exercise 2.3.  Implement a representation for rectangles in a plane. (Hint: You may want to make use of exercise 2.2.) 
;;;In terms of your constructors and selectors, create procedures that compute the perimeter and the area of a given rectangle. 
;;;Now implement a different representation for rectangles. Can you design your system with suitable abstraction barriers, 
;;;so that the same perimeter and area procedures will work using either representation? 

(define (make-rectangle-2 side1 side2)
  (cons side1 side2)
  )

(define (get-side1 r)
  (car r)
  )

(define (get-side2 r)
  (cdr r)
  )

(define (get-area r)
  (* (seg-length (get-side1 r))  (seg-length (get-side2 r)))
  )

(define (get perimeter r)
       (* 2 (+ (seg-length (get-side1 r))  (seg-length (get-side2 r))))
       )


