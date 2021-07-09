#lang simply-scheme

; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a.pdf
; QUESTIONS / 1
; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a_sol.pdf

; Write a procedure (expt base power) which implements the exponents function. For
; example, (expt 3 2) returns 9, and (expt 2 3) returns 8

; my attempt [failed had to look up solution]
; (define (expt base power)
;   (if (= power 1) base (expt (* base base) (- power 1))))

(define (expt base power)
  (if (= power 0) 1 (* base (expt base (- power 1)))))

(show 'expt)
(expt 3 3)
