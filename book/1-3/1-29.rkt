#lang simply-scheme

; https://xuanji.appspot.com/isicp/1-3-hop.html
; http://community.schemewiki.org/?sicp-ex-1.29

(define (sum term a next b)
  (if (> a b) 0
      (+ (term a) (sum term (next a) next b))))

(define (inc n) (+ n 1))

; Exercise 1.29. [didn't even attempt to solve myself, don't understand the math.]
; [Retyped, still didn't understand anything]

(define (round-to-next-even x)
  (+ x (remainder x 2)))

(define (simpson f a b n)
  (define fixed-n (round-to-next-even n))
  (define h (/ (- b a) fixed-n))
  (define (simpson-term k)
    (define y (f (+ a (* k h))))
    (if (or (= k 0) (= k fixed-n))
        (* 1.0 y)
        (if (even? k)
            (* 2 y)
            (* 4 y))))
  (* (/ h 3) (sum simpson-term 0 inc fixed-n)))

(define (cube x) (* x x x))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)

