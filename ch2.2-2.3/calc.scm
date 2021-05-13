;; Scheme calculator -- evaluate simple expressions

; The read-eval-print loop:

(define (calc)
  (display "calc: ")
  (flush)
  (print (calc-eval (read)))
  (calc))

; Evaluate an expression:

(define (calc-eval exp)
  (cond ((number? exp) exp)
        ((word? exp) exp)
        ((list? exp) (calc-apply (car exp) (map calc-eval (cdr exp))))
        (else (error "Calc: bad expression:" exp))))

; Apply a function to arguments:

(define (calc-apply fn args)
  (cond ((eq? fn '+) (accumulate + 0 args))
        ((eq? fn '-) (cond ((null? args) (error "Calc: no args to -"))
                           ((= (length args) 1) (- (car args)))
                           (else (- (car args) (accumulate + 0 (cdr args))))))
        ((eq? fn '*) (accumulate * 1 args))
        ((eq? fn '/) (cond ((null? args) (error "Calc: no args to /"))
                           ((= (length args) 1) (/ (car args)))
                           (else (/ (car args) (accumulate * 1 (cdr args))))))
        ((eq? fn 'first) (cond ((null? args) (error "Calc: no args to first"))
                               ((word? args) (car args))
                               (else (error "Calc: bad args to first"))))
        ((eq? fn 'butfirst) (cond ((null? args) (error "Calc: no args to butfirst"))
                                  ((word? args) (cdr args))
                                  (else (error "Calc: bad args to butfirst"))))
        ((eq? fn 'last) (cond ((null? args) (error "Calc: no args to last"))
                              ((word? args) (reverse (car (reverse args))))
                              (else (error "Calc: bad args to last"))))
        ((eq? fn 'butlast) (cond ((null? args) (error "Calc: no args to butlast"))
                              ((word? args) (reverse (cdr (reverse args))))
                              (else (error "Calc: bad args to butlast"))))

        (else (error "Calc: bad operator:" fn))))
