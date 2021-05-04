

(define (twenty-one strategy)
  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1)
          ((< (best-total dealer-hand-so-far) 17)
           (play-dealer customer-hand
                        (se dealer-hand-so-far (first rest-of-deck))
                        (bf rest-of-deck)))
          ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
          ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
          (else 1)))

  (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
    (cond ((> (best-total customer-hand-so-far) 21) -1)
          ((strategy customer-hand-so-far dealer-up-card)
           (play-customer (se customer-hand-so-far (first rest-of-deck))
                          dealer-up-card
                          (bf rest-of-deck)))
          (else
           (play-dealer customer-hand-so-far
                        (se dealer-up-card (first rest-of-deck))
                        (bf rest-of-deck)))))

  (let ((deck (make-deck)))
    (play-customer (se (first deck) (first (bf deck)))
                   (first (bf (bf deck)))
                   (bf (bf (bf deck))))) )

(define (make-ordered-deck)
  (define (make-suit s)
    (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K)) )
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C)) )

(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)
          (se (first in) (shuffle (se (bf in) out) (- size 1)))
          (move-card (bf in) (se (first in) out) (- which 1)) ))
    (if (= size 0)
        deck
        (move-card deck '() (random size)) ))
  (shuffle (make-ordered-deck) 52) )
;;my code starts here

;;helper function for best-total
(define (count-hand hand total)
  (define (value card)
    (cond ((equal? (first card) 'a) 1)
          ((number? (first card)) (first card))
          (else 10)
          )
    )

  (if (empty? hand)
      total
      (count-hand (bf hand) (+ (value (first (first hand))) total))   
      )
  )
;;;Q1
(define (best-total hand)
  (if (and (or (member? 'ah hand) (member? 'ad hand) (member? 'as hand) (member? 'ac hand))
           (< (count-hand hand 0) 11))
      (+ (count-hand hand 0) 10)
      (count-hand hand 0)
      )
  )
;(best-total '(ad 8s)) ;19
;(best-total '(ad 8s 5h)) ;14
;(best-total '(ad as 9h)) ;21

;;;Q2
(define (stop-at-17 hand dealer-up)
  (if (< (best-total hand) 17)
      #t
      #f))

;;Q3
(define (play-n strategy n)
  (define (iter count res)
    (if (= count 0) 
        res
        (iter (- count 1) (+ res (twenty-one strategy)))
        )
    )
  (iter n 0)
  )

;;Q4
(define (dealer-sensitive hand dealer-up)
  (define (dealer-help-b up)
    (if (or (member? '2 up)
            (member? '3 up)
            (member? '4 up)
            (member? '5 up)
            (equal? '6  up))
        #t
        #f))
  (define (dealer-help-a up)
    (if (or (member? 'a up)
            (member? 'k up)
            (member? 'q up)
            (member? 'j up)
            (member? '7 up)
            (member? '8 up)
            (member? '9 up)
            (equal? '10 (bl up)))
        #t
        #f))

  (if (or
       (and (< (best-total hand) 17) (dealer-help-a dealer-up)
            (and (< (best-total hand) 12) (dealer-help-b dealer-up))))
      #t
      #f
      ))

;;Q5
(define (stop-at n)
  (lambda (hand up)
    (if (< (best-total hand) n)
        #t
        #f)))


;;Q6
(define (valentine hand up)
  (define (heart-in hand)
    (cond ((empty? hand) #f)
          ((member? 'h (first hand)) #t)
          (else heart-in (bf hand))
          ))

  (if (or (and (heart-in hand) (< (best-total hand) 19))
          (< (best-total hand) 17))
      #t
      #f)
  )













