;;;Exercise 1.45. Implement a simple procedure for computing nth roots using fixed-point, average-damp, and the repeated procedure of exercise 1.43. 
;;;Assume that any arithmetic operations you need are available as primitives. 
(define (repeated func iter)
  (if (= iter 1)
      func
      (compose func (repeated func (dec iter)))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (nth-root n r)
  
  )


