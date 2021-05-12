;;;Exercise 2.30.  Define a procedure square-tree analogous to the square-list procedure of exercise 2.21.

(define (square n) (* n n))

;;direct
;(define (square-tree tree)
;  (cond ((null? tree) '())
;        ((not (pair? tree)) (square tree))
;        (else (cons (square-tree-direct (car tree)) (square-tree-direct (cdr tree))))))

;;map and recursion
(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)
             )
         )
       tree)
  )


(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;;(1 (4 (9 16) 25) (36 49))
