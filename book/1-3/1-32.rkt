#lang simply-scheme

; https://xuanji.appspot.com/isicp/1-3-hop.html
; http://community.schemewiki.org/?sicp-ex-1.32

; references: see 1.30, 1.31

; (accumulate combiner null-value term a next b)

(define (identity n) n)
(define (inc n) (+ n 1))

; recursive
; right fold
(define (accumulateRec combiner null-value term a next b)
  (if (> a b) null-value
      (combiner (term a) (accumulateRec combiner null-value term (next a) next b))))


(show 'accumulateRec)
(define (sum-rec a b) (accumulateRec + 0 identity a inc b))
(sum-rec 1 4)

(define (prod-rec a b) (accumulateRec * 1 identity a inc b))
(prod-rec 1 4)


(define (accumulateIter combiner null-value term a next b)
  (define (iter a res)
    (if (> a b) res
        (iter (next a) (combiner res (term a)))))
  (iter a null-value))

(show 'accumulateIter)

(define (sum-iter a b) (accumulateRec + 0 identity a inc b))
(sum-iter 1 4)

(define (prod-iter a b) (accumulateRec * 1 identity a inc b))
(prod-iter 1 4)
