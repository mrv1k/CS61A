#lang simply-scheme
; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a.pdf
; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a_sol.pdf

(define (om foo)
  (word foo 'nom))

; nom
(om 'nom)
; (om nom)
; ('om 'nom)
(word 'a 'bc)
; (word 'a '(bc))
(sentence 'a 'bc)
(sentence 'a '(bc d))
(sentence '(a b) '(c d))

(define (abs n) ((if (< n 0) - +) n))

; (define (abs x)
;     (cond ((= x 0) 0)
;           ((< x 0) (­ x))
;           (else x)))

(abs -1)
(abs 42)
(abs -666)

; (define x 5)
; (define (x) 5)

(define area-code 415)

(cond ((= area-code 415) (word 'san 'francisco))
      ((= area-code 510) 'berkley)
      (else 'whereyoufrom))

(if (= area-code 415) (word 'san 'francisco)
    (if (= area-code 510) 'berkley 'whereyoufrom))


(and (= 3 3) (= 4 4))

; (define (foo) (foo)) ; infinite loop: food that defines foo that defines foo...
; (and (= 3 3) (foo))

(define (foo) (foo)) ; no infinite loop because and breaks before
(and (= 3 4) (foo))

; Write a procedure (expt base power) which implements the exponents function. For
; example, (expt 3 2) returns 9, and (expt 2 3) returns 8

; my attempt [failed had to look up solution]
; (define (expt base power)
;   (if (= power 1) base (expt (* base base) (- power 1))))
(define (expt base power)
  (if (= power 0) 1 (* base (expt base (- power 1)))))

(expt 3 3)

; I want to go up a flight of stairs that has n steps. I can either take 1 or 2 steps each
; time. How many ways can I go up this flight of stairs? Write a procedure that solves this for me.

; (count-stair-ways 5)
; (count-stair-ways 4)
; (count-stair-ways 3)
