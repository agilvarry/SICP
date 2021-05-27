(define (count-pairs x) 
    (let ((pairs '()))
    (define (iter x)
        (if (or (not (pair? x)) (memq x pairs))
        0
        (begin 
        (set! pairs (cons x pairs))
                (+ (iter (car x))
                    (iter (cdr x))
        1))))
    (iter x))) 

(define a '(for foo to))

(define x '(foo)) 
(define y (cons x x)) 
(define b (list y)) 

(define v '(foo)) 
(define g (cons v v)) 
(define c (cons g g)) 