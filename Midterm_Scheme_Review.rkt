;; Function map-list, whre map-list takes a list of functions; funs, and a list of values; L,
;; and returns a list of the results of applying each function in funs to the corresponding value in L.
;; Example:
;; > (map-list (list (lambda (x) (+ x 1)) (lambda (x) (* x 3))) '(2 5))
;;   ( 3 15)

(define funs (list (lambda (x) (+ x 1)) (lambda (x) (* x 3))))
(define L '(2 5))

(define (map-list funs L)
  (cond ((null? funs) '())
        (else (cons ((car funs) (car L))
                    (map-list (cdr funs) (cdr L))))
))

;; use of append and list
(define (map-list funs L)
  (cond ((null? funs) '(0)) ;; put 0 for demo
        (else (append (list ((car funs) (car L)))
                    (map-list (cdr funs) (cdr L))))
))

(map-list funs L)

;; Function ho-map-list(funs)
;; example:
;; > (define f (ho-map-list (list (lambda (x) (+ x 1)) (lambda (x) (* x 3)))))
;; > (f ’(2 5))
;;   (3 15)

(define (ho-map-list funs)
  (lambda (values)
    (letrec ((m-l (lambda (fs L)
                    (cond ((null? fs) '())
                          (else (cons ((car fs) (car L))
                                      (m-l (cdr fs) (cdr L))))
                          ))))
      (m-l funs values))))
(define f (ho-map-list funs))
(f '(2 5))





    

