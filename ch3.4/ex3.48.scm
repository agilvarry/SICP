(define (serialized-exchange account1 account2)
(if (> (account2 'number) (account1 'number))
    (serialized-exchange account2 account 1)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer)))
    ((serializer1 (serializer2 exchange))
     account1
     account2))))

(define (make-account-and-serializer balance)
  (let ((new-act-num 0))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer))
        (acc-num new-act-num))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) (balance-serializer withdraw))
            ((eq? m 'deposit) (balance-serializer deposit))
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            ((eq? m ' number) acc-num)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m))))
    (set! new-act-num (+ 1 new-act-num))
    dispatch)))