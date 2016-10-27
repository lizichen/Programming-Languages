
(define (hanoi N from to temp)
  (cond ((= N 0) (newline) 'Done)
	(else (hanoi (- N 1) from temp to)
	      (display "Move disk from ") (display from)
	      (display " to ") (display to) (newline)
	      (hanoi (- N 1) temp to from))))

