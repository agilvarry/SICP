;;;Exercise 2.37 Fill in the missing expressions in the following procedures for computing the other matrix operations. (The procedure accumulate-n is defined in exercise 2.36.)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

 (define matrix (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12))) 

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product (list 1 2 3) (list 4 5 6)) 

(define (matrix-*-vector m v)
  (map (lambda (m-r) (dot-product m-r v)) m))

(matrix-*-vector matrix (list 2 3 4 5)) 

(define (transpose mat)
  (accumulate-n cons '() mat))

 (transpose matrix) 

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-r) (matrix-*-vector cols m-r)) m)))

 (matrix-*-matrix matrix (list (list 1 2) (list 1 2) (list 1 2) (list 1 2))) 