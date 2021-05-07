;;;Write a procedure substitute that takes three arguments: a list, an old word, and a
;;new word. It should return a copy of the list, but with every occurrence of the old word
;;replaced by the new word, even in sublists.



(define (substitute lst old new)
  (cond ((null? lst) '())
        ((equal? (car lst) old) (cons new (substitute (cdr lst) old new)))
        ((list? (car lst)) (cons (substitute (car lst) old new) (substitute (cdr lst) old new)))    
        (else (cons (car lst) (substitute (cdr lst) old new)))))

(substitute '((lead guitar) (bass guitar) (rhythm guitar) drums) 'guitar 'axe)
;((lead axe) (bass axe) (rhythm axe) drums)


;;;Now write substitute2 that takes a list, a list of old words, and a list of new words; the 
l;;last two lists should be the same length.
(define (substitute2 lst lst-old lst-new)
  (if (null? lst-old)
       lst
       (substitute2 (substitute lst (car lst-old) (car lst-new)) (cdr lst-old) (cdr lst-new)))
      
  )

(substitute2 '((4 calling birds) (3 french hens) (2 turtle doves))'(1 2 3 4) '(one two three four))
;((four calling birds) (three french hens) (two turtle doves))