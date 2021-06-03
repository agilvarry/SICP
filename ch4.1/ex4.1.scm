;;;Write a version of list-of-values that evaluates operands from left to right regardless of the order of evaluation in the underlying Lisp. 
;;;Also write a version of list-of-values that evaluates operands from right to left. 

(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (eval (first-operand exps) env)
            (list-of-values (rest-operands exps) env))))

(define (list-left exps env)
  (if (no-operands? exps)
      '()
      (let ((left (eval (first-operand exps) env)))
            ((right list-left (rest-operands exps) env))
      (cons left right))))

(define (list-right exps env)
  (if (no-operands? exps)
      '()
      (let ((left (eval (first-operand exps) env)))
            ((right list-right (rest-operands exps) env))
      (cons right left))))      