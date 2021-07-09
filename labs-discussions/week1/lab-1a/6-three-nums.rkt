#lang simply-scheme

; https://www-inst.eecs.berkeley.edu//~cs61a/su10/labs/lab1a.pdf
; 6

; Define a procedure that takes three numbers as arguments and
; returns the sum of the squares of the two larger numbers.

(define (square n) (* n n))

(define (threesum x y z)
  ; (display x)
  ; (display y)
  ; (display z)
  ; (display '-)
  (cond ((or (> x y) (> x z)) (+ (square x) (square (if (> y z) y z))))
        (else (+ (square y) (square z)))
        )
  )

(threesum 3 2 1) ; x > y, y > z
(threesum 3 1 2) ; x > y, y < z

(threesum 2 1 3) ; x > y, y < z
(threesum 2 3 1) ; x < y, y > z

(threesum 1 2 3) ; x < y, y < z
(threesum 1 3 2) ; x < y, y > z
