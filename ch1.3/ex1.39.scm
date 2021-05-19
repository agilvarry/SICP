;;;Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert's formula. 
;;;K specifies the number of terms to compute, as in exercise 1.37. 

;;a



;;b
(define (cont-frac n d k)
  (define (iter x res)
    (if (= x 0)
        0
        (iter (- x 1) (/ (n x) (+ (d x) res)))
        )
    )
  (iter k 0)
  )

(define (tan-cf x k)
  (define (iter x n res)
    (cond ((= x 0) 0)
          ((= x k)
           (/ x (iter (* x x) n res)))
      (else (iter (* x x) (+n 2) (- n (/ x))))
    ))
  (iter k 1 0)
  )