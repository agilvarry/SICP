;;;a. Show that sum and product are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function

(define (inc x) (+ x 1))

(define (identity x) x) 


(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b)))
  )


(define (product term a next b)
  (accumulate * 1 term a next b)
  )

(define (sum term a next b)
  (accumulate + 0 term a next b)
  )

(sum identity 1 inc 5)
(product identity 1 inc 5)
