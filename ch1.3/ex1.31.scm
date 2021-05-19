;;; The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.
;;; Write an analogous procedure called product that returns the product of the values of a function at points over a given range.
;;; Show how to define factorial in terms of product. Also use product to compute approximations to using the formula in the book

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (inc x)
  (+ x 1)
  )

(define (factor x) x) 

(product factor 1 inc 5)
;;120

(product factor 1 inc 9)
;;362880


(define (pi x)
  (define (pi-prod x)
    (if (even? x)
        (/ (+ x 2) (+ 1 x))
        (/ (+ 1 x) (+ x 1))
        )
    )
  (product pi-prod 1 inc n)
  )