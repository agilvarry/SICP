;;;a. Show that sum and product are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b)))
  )
(define (inc x) (+ x 1))

;;identity
(define (identity x) x) 

;;product/factorial: 120
(accumulate * 1 identity 1 inc 5)

;;sum: 15
(accumulate + 0 identity 1 inc 5)