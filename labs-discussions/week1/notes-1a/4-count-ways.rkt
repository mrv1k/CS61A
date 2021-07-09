#lang simply-scheme

; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a.pdf
; QUESTIONS / 4
; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a_sol.pdf

; I’m standing at the origin of some x-y coordinate system for no reason when a pot of
; gold dropped onto the point (x, y). I would love to go get that gold, but because of some
; arbitrary constraints or (in my case) mental derangement, I could only move right or up
; one unit at a time on this coordinate system. I’d like to find out how many ways I can
; reach (x, y) from the origin in this fashion (because, umm, my mother asked).
; Write count-ways that solves this for me.

; [didn't even attempt] to solve on my own in code, only on paper,
; retyped the solution
; spent 4 hours understanding the solution, got a pretty good understanding, can't say 100% though

(define (count-ways x y)
  ; (display 'x:)
  ; (display x)
  ; (display '_y:)
  ; (show y)
  (cond ((or (< x 0) (< y 0)) 0)
        ((and (= x 0) (= y 0)) 1)
        (else (+ (count-ways (- x 1) y) (count-ways x (- y 1))))))

(show 'count-ways)
; (count-ways 1 1)
(count-ways 2 2)
(count-ways 3 3)
