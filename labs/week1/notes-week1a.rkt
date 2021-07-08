#lang simply-scheme
; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a.pdf
; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a_sol.pdf

;
; QUESTIONS
;

; 1. Write a procedure (expt base power) which implements the exponents function. For
; example, (expt 3 2) returns 9, and (expt 2 3) returns 8

; my attempt [failed had to look up solution]
; (define (expt base power)
;   (if (= power 1) base (expt (* base base) (- power 1))))
(define (expt base power)
  (if (= power 0) 1 (* base (expt base (- power 1)))))

(show 'expt)
(expt 3 3)

; 2. I want to go up a flight of stairs that has n steps. I can either take 1 or 2 steps each
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

; 3. Define a procedure subsent that takes in a sentence and a parameter i, and returns a
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

; 4. I’m standing at the origin of some x-y coordinate system for no reason when a pot of
; gold dropped onto the point (x, y). I would love to go get that gold, but because of some
; arbitrary constraints or (in my case) mental derangement, I could only move right or up
; one unit at a time on this coordinate system. I’d like to find out how many ways I can
; reach (x, y) from the origin in this fashion (because, umm, my mother asked).
; Write count-ways that solves this for me.

; [didn't even attempt] to solve on my own in code, only on paper,
; retyped the solution
; spent 4 hours understanding the solution, got a pretty good understanding, not 100% though

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


; Define a procedure sum-of-sents that takes in two sentences and outputs a sentence
; containing the sum of respective elements from both sentences. The sentences do not
; have to be the same size!
; [solution after looking at answer]
; my solution did use first but I couldn't get how to sum up and invoke recursion at the same time

(define (sum-of-sents sent-a sent-b)
  ; (display sent-a)
  ; (display sent-b)
  (cond ((empty? sent-a) sent-b)
        ((empty? sent-b) sent-a)
        (else (sentence (+ (first sent-a) (first sent-b))
                        (sum-of-sents (bf sent-a) (bf sent-b))))))

(show 'sum-of-sents)
(sum-of-sents '(1 2 3) '(6 3 9)); => (7 5 12)
(sum-of-sents '(1 2 3 4 5) '(8 9)); => (9 11 3 4 5)
