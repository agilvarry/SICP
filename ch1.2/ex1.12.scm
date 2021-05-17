;;;Exercise 1.12.  Write a procedure that computes elements of Pascal's triangle by means of a recursive process. 

(define (pascal row column)
  (cond ((> column row) 0)
        ((< column 0) 0)
        ((= column 1) 1)
         ((+ (pascal (- row 1) (- column 1)) 
             (pascal (- row 1) column))))) 

(pascal 3 2)