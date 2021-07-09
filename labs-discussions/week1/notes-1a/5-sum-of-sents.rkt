#lang simply-scheme

; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a.pdf
; QUESTIONS / 5
; https://www-inst.eecs.berkeley.edu//~cs61a/su10/notes/week1a_sol.pdf

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
