;;;Exercise 1.37

;;a

(define (cont-frac n d k)
  (if (= k 0)
      0
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))  
        
      )
  )

(define (cont-frac n d k)
  (define (iter x res)
    (if (= x 0)
        0
        (iter (- x 1) (/ (n x) (+ (d x) res)))
        )
    )
  (iter k 0)
  )