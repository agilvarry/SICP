;;;Exercise 2.27.  Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and
;;; returns as its value the list with its elements reversed and with all sublists deep-reversed as well.

(define (reverse lst)
  (if (null? (cdr lst))
      lst
      (append (reverse (cdr lst)) (list (car lst)))))


(define x (list (list 1 2) (list 3 4) (list 5 6)(list 7 8)))

;;my solution
(define (deep-reverse lst)
  (if (null? (cdr lst))
      (reverse (car lst))
      (append (deep-reverse (cdr lst)) (list (reverse(car lst))))))

;;answer solution
(define (deep-map lst)
  (if (pair? lst)
      (map deep-map (reverse lst))
      lst))

(reverse x)
;;((3 4) (1 2))

(deep-reverse x)
;;((4 3) (2 1))

(deep-map x)