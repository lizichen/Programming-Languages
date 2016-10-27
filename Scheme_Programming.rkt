;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                ;;
;; Programming Language Assignment - Lizi Chen - lc3397@nyu.edu   ;;
;;                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; prep function: display-all
;;

(define (display-answer . stuff)
  (for-each display stuff))

;; 1), Write (count-numbers L) to return the number of digital numbers in L.
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
(display-answer "(count-number '" L ") = " (count-numbers L))




                                       