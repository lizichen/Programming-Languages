;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                ;;
;; Programming Language Assignment - Lizi Chen - lc3397@nyu.edu   ;;
;;                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; prep function: display-all.
(define (display-answer . stuff)
  (for-each display stuff) (newline))
(display-answer "Run the entire program " "to see all test cases on the console...")
;; 1) Write (count-numbers L) to return the number of digital numbers in L.
;;;;
;;;; Base Case: L is null, return 0
;;;; Assumptino: (count-numbers M) returns a count of the numbers in M, which is smaller than L
;;;; Step:
;;;;     if (car L) is a list, return (count-numbers (car L) + (count-numbers (cdr L))
;;;;     if (car L) is a number, return 1 + (count-numbers (cdr L))
;;;;     otherwise, return (count-numbers (cdr L)) + 0
(define L '(11 (12 (a 3 444) 15) (66 (b 7 8 (9 c) 10 d))))
(define (count-numbers L)
  (if (null? L) 0
      (if (list? (car L))
          (+ (count-numbers (car L)) (count-numbers (cdr L)))
          (if (number? (car L))
              (+ (count-numbers (cdr L)) 1)
              (+ (count-numbers (cdr L)) 0)))))
;; Test cases:
    (display-answer "1) (count-numbers " L ") = " (count-numbers L) )
    (display-answer "1) (count-numbers '()) = " (count-numbers '()) )

;; 2) Define (insert x L), L is sorted list of numbers in increasing order.
;;;;
;;;; Base Case: L is empty, return x in a list
;;;; Assumption: M, a latter part of L, shorter than L, has the first item greater than x. Append x as a list with the part of L
;;;; Step:
;;;;     if (car L) is greater than x, append x to L
;;;;     otherwise, append the first number in current L with another insert call with x and (cdr L)
(define L '(1 2 3 4 6 7))
(define x 10)
(define (insert x L)
  (cond ((null? L) (append l (list x)))
        ((> (car L) x) (append (list x) L))
        (else (append (list (car L)) (insert x (cdr L))))
        ))
;; Test cases:
    (display-answer "2) (insert " x " " L ") = " (insert x L))
    (display-answer "2) (insert 0 '()) = " (insert 0 '()))
    (display-answer "2) (insert '() '()) = " (insert '() '()))

;; 3) Define (insert-all L M), where L is a list of numbers and M is a sorted list of numbers.
;;;;
;;;; Base Case: 1) L is empty, return M itself. 2) M is empty, call with (cdr L) and (list (car L))
;;;; Assumption: call insert upon the first number ANumber in L and M, the return list with the ANumber is a sorted M' with M length plus one.
;;;; Step:
;;;;     Call insert-all with (cdr L) and a list with added (car L) in M by using insert, do this until L is null.
(define L '(4 5 2))
(define M '(1 3 7 10 12))
(define E '())
(define (insert-all L M)
  (cond ((null? L) M)
        ((null? M) (insert-all (cdr L) (list (car L))))
        (else (insert-all (cdr L) (insert (car L) M)))))
;; Test cases:
    (display-answer "3) (insert-all " L " " M " ) = " (insert-all L M))
    (display-answer "3) (insert-all " L " " E " ) = " (insert-all L E))
    (display-answer "3) (insert-all '() " M " ) = " (insert-all '() M))

;; 4) Define (sort T), L is an unsorted list of numbers, return the sorted L by performing insertion sort
;;;; Base Case: (cdr T) is empty, call insertion (car T) to empty list
;;;; Assumption: insert first number of T into the other sorted part of T result the first sorted part of T has extra number.
;;;; Step: For each insertion call on the number x and L, if L is null, return x as a list
;;;;     if L is not null, find the place where x is firstly smaller than the number in L and append to the list.
(define T '(1 3 2 4 7 5 8 0))
(define (sort T)
  (letrec ((insertion (lambda(x L)
                     (if (null? L)(append L (list x))
                         (if (> (car L) x)
                             (append (list x) L)
                             (append (list (car L)) (insertion x (cdr L))))))))
  (cond ((null? T) '())
        ((null? (cdr T)) (insertion (car T) '()))
        (else (insertion (car T) (sort (cdr T))))))) 
;; Test cases:
    (display-answer "4) (sort " T " ) = " (sort T))
    (display-answer "4) (sort '() ) = " (sort '()))
          
;; 5) Write function (translate op), where op is symbol '+, '-, '*, or '/ and
;; returns the corresponding operator.
;; i.e., (translate '-) shoudl return the - operator:
;;                    #<procedure:->
;; ((translate '*) 3 4) should return 12.
(define (translate op)
  (cond ((eq? '* op) *)
        ((eq? '+ op) +)
        ((eq? '- op) -)
        ((eq? '/ op) /)))
;; Test cases:
    (display-answer "5) ((translate '*) 3 4) = " ((translate '*) 3 4))
    (display-answer "5) (translate '+) = " (translate '+))

;; 6) Function (postfix-val exp), exp represents an expression in postfix notation, that returns the result of evaulating exp.
;; (postfix-eval ’((16 12 *) ((2 6 +) (9 1 -) *) /)) will return 3
;; Use translate at the place where operator appears.
;;    > (define L '(*))
;;    > (eq? '* (car L))
;;    #t
(define (postfix-eval exp)
  (cond ((number? (car exp))
         (cond ((number? (cadr exp)) ((translate (caddr exp)) (car exp) (cadr exp)))
               (else ((translate(caddr exp) (car exp) (postfix-eval (car (cdr exp))))))))
         (else (cond ((number? (cadr exp)) ((translate (caddr exp)) (postfix-eval (car exp)) (cdr exp)))
                     (else ((translate (caddr exp)) (postfix-eval (car exp)) (postfix-eval (car (cdr exp))))))))) ;; why so many parenthesis...
(define postExpression '((16 12 *) ((2 6 +) (9 1 -) *) /))
;; Test cases:
    (display-answer "6) (postfix-eval " postExpression ") = " (postfix-eval postExpression))
         
;; 7) A distinct list to represent a set. Function (powerset L), L is a list that represents a set, returns set of all subsets of L.
;;
;;;; Base Case: L is empty, return the set containing the empty set, '( () )
;;;; Assumption: (powerset M), where M is smaller than L, returns set of all subsets of M.
;;;; Step: Get the first item in M into the set as itself alone.
;;;;       Let N be M excluding (car M).
;;;;       Pass N into the function for next recursion.
(define L '(1 2 3 4))
(define (powerset L)
  (let ((consFirstToSecHalf (lambda (x) (cons (car L) x))))
    (if (null? L)
        (list '())
        (append (map consFirstToSecHalf (powerset (cdr L))) (powerset (cdr L)))  )))
;; Test cases:
    (display-answer "7) (powerset (" L ") = " (powerset L))
    (display-answer "7) (powerset '()) = " (powerset '()))


#| NOTES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Determine if a number is even or 
(letrec ((even?
          (lambda (n)
            (if (zero? n)
                #t
                (odd? (- n 1)))))
         (odd?
          (lambda (n)
            (if (zero? n)
                #f
                (even? (- n 1))))))
  (even? 88))

;; Determine the length of a list, using pre-defined function
(length '(1 2 3)

;; Determine the length of a list, using function define
(define (listlength L)
    (if (null? L)
        0
        (+ (listLength (cdr L)) 1)))
(listlength '(1 2 3)

;; Determine the length of a list, using lambda
(let ((listlength (lambda(L)
                      (if (null? L)
                          0
                          (+ (listlength(cdr L)) 1)))))
    (listlength '(1 2 3 4)))

;; Use of lambda and let
(let ((function (lambda(x) (+ x 2)))) (let ((first (car L))) (+ (function first) first)))                                                                            

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
|#
    