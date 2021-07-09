#lang simply-scheme

; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a.pdf
; QUESTIONS / 2
; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a_sol.pdf

; I want to go up a flight of stairs that has n steps. I can either take 1 or 2 steps each
; time. How many ways can I go up this flight of stairs? Write a procedure that solves this for me.
; [first attempt failed, had to look up solution and iterate over it on paper]

(define (count-stair-ways n)
  (cond ((= n 1) 1)
        ((= n 2) 2)
        (else (+ (count-stair-ways (- n 1)) (count-stair-ways (- n 2))))))

(show 'count-stair-ways)
(count-stair-ways 3) ; 2
(count-stair-ways 4) ; 5
(count-stair-ways 5) ; 8
