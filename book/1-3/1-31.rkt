#lang simply-scheme

; https://xuanji.appspot.com/isicp/1-3-hop.html
; http://community.schemewiki.org/?sicp-ex-1.31

(define (inc n) (+ n 1))

; Exercise 1.31. [retyped solution]

(define (product term a next b)
  (if (> a b) 1
      (* (term a) (product term (next a) next b))))

(define (pi-term n)
  (if (even? n)
      (/ (+ n 2.0) (+ n 1.0))
      (/ (+ n 1.0) (+ n 2.0))))

(* (product pi-term 1 inc 6) 4)   ;;= 3.3436734693877552
(* (product pi-term 1 inc 100) 4) ;;= 3.1570301764551676
