#lang simply-scheme

; Exercise 1.29. [didn't even attempt to solve myself, don't understand the math]

; reference for 1.30
(define (sumRec term a next b)
  ; (show (sentence a b))
  (if (> a b)
      0
      (+ (term a)
         (sumRec term (next a) next b))))

(define (inc n) (+ n 1))
(define (identity x) x)

(sumRec identity 1 inc 4)

; Exercise 1.30. [after looking at solution]
(define (sumIter term a next b)
  (define (iter a result)
    ; (show (sentence a b)) ; at a different position form recursive counterpart
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(sumIter identity 1 inc 4)
