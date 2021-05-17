;;;Exercise 2.47.  Here are two possible constructors for frames:

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

;;;For each constructor supply the appropriate selectors to produce an implementation for frames. 

(define (frame-origin f)
  (car f))
(define (frame-edge1 f)
  (cadr f)
  )
(define (frame-edge2 f)
  (caddr f)
  )
(define (frame-edge2-2 f)
  (cddr f)
  )


(frame-edge2-2 (cons 1 (cons 2 3)))