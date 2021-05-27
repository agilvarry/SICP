 (define (count-pairs x) 
   (if (not (pair? x)) 
       0 
       (+ (count-pairs (car x)) 
          (count-pairs (cdr x)) 
          1))) 

(define a '(for foo to))

(define x '(foo)) 
(define y (cons x x)) 
(define b (list y)) 

(define x '(foo)) 
 (define y (cons x x)) 
 (define c (cons y y)) 