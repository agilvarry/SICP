;;;Write type-check. Its arguments are a function, a type-checking predicate that returns #t if and only if the datum is a legal argument to the function, and the datum.

(define (type-check fun pred? dat)
  (if (pred? dat)
      (fun dat)
      #f)
  )
(type-check sqrt number? 'hello)
;#f
(type-check sqrt number? 4)
;2

(define (make-safe fn prd?)
  (lambda (d)
    (type-check fn prd? d)
    )
  )

(define safe-sqrt (make-safe sqrt number?))

(safe-sqrt 9)
;3
(safe-sqrt 'oops)
;#f