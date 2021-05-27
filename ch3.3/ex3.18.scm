(define (loop? x) 
    (define visited '())
    (define (iter x)
    (set! visited (cons x visited))
        (cond  ((not (pair? x)) #f)
                ((null? (cdr x)) #f)
                ((memq (cdr x) visited) #t)
                (else (iter (cdr x)))))
    (iter x)) 

(define a '(for foo to))

(define x '(foo)) 
(define y (cons x x)) 
(define b (list y)) 

(define v '(foo)) 
(define g (cons v v)) 
(define c (cons g g)) 