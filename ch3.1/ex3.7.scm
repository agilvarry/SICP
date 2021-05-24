;;;Exercise 3.7.
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((passwords (cons password '())))
    (define (new-password p)
      (set! passwords (append passwords (list p)))
      passwords)
  
    (let ((bad-tries 0))
      (define (dispatch p m)
        (cond ((>= bad-tries 7) call-the-cops)
              ((not (member? p passwords))(error "Inforrect password") (set! bad-tries (+ 1 bad-tries)))
              ((eq? m 'new-password) new-password)
              ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m))))
      dispatch)))

(define (make-joint acc acc-pw jt-pw)
  ((acc acc-pw 'new-password) jt-pw)
  acc
  )
  

(define peter-acc (make-account 100 'secret-password))

(define paul-acc
  (make-joint peter-acc 'secret-password 'rosebud))

;;The resulting account object should process a request only if it is accompanied by the password with which the account was created, and should otherwise return a complaint:

((peter-acc 'secret-password 'withdraw) 40)
;60

((paul-acc 'rosebud 'deposit) 40)
;100

((peter-acc 'some-other-password 'deposit) 50)
;"Incorrect password"