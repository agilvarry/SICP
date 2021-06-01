(define S (cons-stream 1 (merge (scale-stream integers 2) 
                         (merge (scale-stream integers 3) (scale-stream integers 5)))))