#lang simply-scheme

(define a 3) ; fn that return 3
(define b (+ a 1)) ; fn that return N + 1
(+ a b ( * a b))
; manual execution
; (+ 3 (+ 3 1) (* 3 (+ 3 1)))
; (+ 3 (4) (* 3 4))
; (+ 3 4 12)
; [19] [correct]

(= a b) ; #f - false, #t - true [no idea]

(if (and (> b a) (< b (* a b)))
    b
    a)
; manual execution
; and (> 4 3) (< 4 (* 3 4))
; and (> 4 3) (< 4 12)
; and (#t) (#t)
; [4] [correct]

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; prediction: prints [16] [correct]

(+ 2 (if (> b a) b a))
; prediction: [6] [correct]

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
; prediction: [16] [correct]

((if (< a b) + -) a b)
; prediction: [7] [correct]
