;;;Exercise 2.19. Define the procedures first-denomination, except-first-denomination, and no-more? in terms of primitive operations on list structures.
;;;Does the order of the list coin-values affect the answer produced by cc? Why or why not? 

(define first-denomination car)

(define except-first-denomination cdr)

(define no-more? null?)