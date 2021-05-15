;;;Exercise 2.74.


(define (operate op obj)
  (let ((proc (get (type obj) op)))
    (if (not (null? proc))
        (proc (contents obj))
        (error "Undefined operator" (list op obj)))))

;;a.  Implement for headquarters a get-record procedure that retrieves a specified employee's record from a specified personnel file. 
;;The procedure should be applicable to any division's file. Explain how the individual divisions' files should be structured. In particular, what type information must be supplied?

(define (get-record name division)
  ((operate 'get-record (type-tag division))
   name
   (contents division-file)))
;;divison records must be labeled with a division

;;b.  Implement for headquarters a get-salary procedure that returns the salary information from a given employee's record from any division's personnel file.
;;How should the record be structured in order to make this operation work?
(define (get-salary record)
  (operate 'get-salary record))

;;c.  Implement for headquarters a find-employee-record procedure. This should search all the divisions' files for the record of a given employee and return the record.
;;Assume that this procedure takes as arguments an employee's name and a list of all the divisions' files.
(define (find-employee-record division-files employee)
  (cond ((null? division-files) "not employee"))
  ((get-record employee (car division-files)))
  (else (find-employee-record (cdr division-files) employee)))