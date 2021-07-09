#lang simply-scheme

; General chapter references
(define (sum term a next b)
  (if (> a b) 0
      (+ (term a) (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))

; Exercise 1.29. [didn't even attempt to solve myself, don't understand the math.]
; [Retyped, still didn't understand anything]
(define (cube x) (* x x x))

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

; (simpson-integral cube 0 1 100)
; (simpson-integral cube 0 1 1000)

;; Testing
(simpson cube 0 1 100)
(simpson cube 0 1 1000)

; reference for 1.30
(define (sumRec term a next b)
  ; (show (sentence a b))
  (if (> a b)
      0
      (+ (term a)
         (sumRec term (next a) next b))))

(define (sum1 n) (+ n 1))
(define (identity1 x) x)

(sumRec identity1 1 sum1 4)

; Exercise 1.30. [after looking at solution]
(define (sumIter term a next b)
  (define (iter a result)
    ; (show (sentence a b)) ; at a different position form recursive counterpart
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(sumIter identity1 1 sum1 4)

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
