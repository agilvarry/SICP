;;;Exercise 2.66.  Implement the lookup procedure for the case where the set of records is structured as a binary tree, ordered by the numerical values of the keys. 

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))


(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((equal? given-key (key (entry set-of-records)))
         (car set-of-records))
        ((> given-key (key (entry set-of-records))) (lookup given-key (left-branch set-of-records)))
        ((< given-key (key (entry set-of-records))) (lookup given-key (right-branch set-of-records)))))