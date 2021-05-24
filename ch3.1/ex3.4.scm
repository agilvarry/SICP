;;;Exercise 3.4.  Modify the make-account procedure of exercise 3.3 by adding another local state variable so that, if an account is accessed more than 
;;seven consecutive times with an incorrect password, it invokes the procedure call-the-cops. 

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define call-the-cops "ACAB")
  (let ((bad-tries 0))
    (define (dispatch p m)
      (cond ((>= bad-tries 7) call-the-cops)
            ((not (eq? p password))(error "Inforrect password") (set! bad-tries (+ 1 bad-tries)))
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m))))
    dispatch))


(define acc (make-account 100 'secret-password))

;;The resulting account object should process a request only if it is accompanied by the password with which the account was created, and should otherwise return a complaint:

((acc 'secret-password 'withdraw) 40)
;60

((acc 'some-other-password 'deposit) 50)
;"Incorrect password"