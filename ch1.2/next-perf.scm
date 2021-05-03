;;;find the next perfect number

(define (is-perf? n)
  (define (iter x res)
    (cond ((= x n) res)
          ((= (remainder n x) 0) (iter (+ x 1) (+ res x)))
          (else (iter (+ x 1) res))
          )
    )
  (= (iter 1 0) n)
  )
 
(define (next-perf n)
  (if (is-perf? (+ n 1))
      (+ n 1)
      (next-perf (+ n 1))
      )
  )

(next-perf 29)
