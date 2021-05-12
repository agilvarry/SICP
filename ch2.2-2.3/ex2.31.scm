;;;Abstract your answer to exercise 2.30 to produce a procedure tree-map with the property that square-tree could be defined as
;;;(define (square-tree tree) (tree-map square tree))

(define (square n) (* n n))


(define (tree-map proc tree)
   (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (proc sub-tree)
             )
         )
       tree)

  )

(define (square-tree tree) (tree-map square tree))


(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;(1 (4 (9 16) 25) (36 49))