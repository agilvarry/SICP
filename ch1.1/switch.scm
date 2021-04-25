;;Write a procedure switch that takes a sentence as its argument and returns a sentence in which every instance of the words
;;I or me is replaced by you, while every instance of you is replaced by me except at the beginning of the sentence,
;;where it’s replaced by I.(Don’t worry about capitalization of letters.)

(define (switch x)
 (se (handle-first (first x)) (switch-rest (bf x)))
)

(define (handle-first x)
  (cond ((equal? x 'You) 'I)
         ((equal? x 'I) 'you)
         ((equal? x 'me) 'you)
         (else x)
  )
)
(define (switch-rest x)
  (cond ((empty? x) '())
        ((member? (first x) '(I me)) (se 'you (switch-rest(bf x))))
        ((member? (first x) '(you)) (se 'me (switch-rest(bf x))))
        (else (se (first x) (switch-rest(bf x))))
  )
)

;(i told you that you should wake me up)
(switch '(You told me that I should wake you up))  

