;procedure to remove duplicate words from a sentence

(define (dupls-removed x)
  (cond ((empty? x) '())
   ((member (first x) (bf x)) 
   (dupls-removed (bf x)))
    (else (se (first x) (dupls-removed (bf x))))
  )
)


(dupls-removed '(a b c a e d e b))
(dupls-removed '(a b c))
(dupls-removed '(a a a a b a a))