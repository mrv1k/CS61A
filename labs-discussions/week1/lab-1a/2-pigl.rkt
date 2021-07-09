#lang simply-scheme

; https://www-inst.eecs.berkeley.edu//~cs61a/su10/labs/lab1a.pdf
; 2

(define (pigl wd)
  (if (pl-done? wd)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(define (pl-done? wd)
  (vowel? (first wd)))

(define (vowel? letter)
  (member? letter '(a e i o u)))

(pigl 'scheme)
