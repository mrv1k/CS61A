#lang simply-scheme

; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a.pdf
; QUESTIONS / 3
; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a_sol.pdf

; Define a procedure subsent that takes in a sentence and a parameter i, and returns a
; sentence with elements starting from position i to the end. The first element has i = 0.

; start from i to end (inclusive)
; my solution, [correct but doesn't handle empty set edge case]
; (define (subsent sent i)
;   (if (= i 0) sent
;       (subsent (bf sent) (- i 1))))

; fixed to handle empty set
(define (subsent sent i)
  (if (or (= i 0) (empty? sent)) sent
      (subsent (bf sent) (- i 1))))

(show 'subsent)
(subsent '(6 4 2 7 5 8) 3); => (7 5 8)
(subsent '() 1)
