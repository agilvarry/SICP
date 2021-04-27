;;;Write a procedure substitute that takes three arguments: a sentence, an old word, and a new word. 
;;;It should return a copy of the sentence, but with every occurrence of the old word replaced by the new word.


(define (substitute sen rep nwd)

  (cond ((empty? sen) '())
    ((equal? (first sen) rep) (se nwd (substitute (bf sen) rep nwd)))
      (else (se (first sen) (substitute (bf sen) rep nwd)))
  )
)



(substitute '(she loves you yeah yeah yeah) 'yeah 'maybe)
;;(she loves you maybe maybe maybe)