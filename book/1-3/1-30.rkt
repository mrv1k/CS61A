#lang simply-scheme

; https://xuanji.appspot.com/isicp/1-3-hop.html
; http://community.schemewiki.org/?sicp-ex-1.30

(define (sum n) (+ n 1))
(define (identity1 x) x)

; reference for 1.30
(define (sumRec term a next b)
  ; (show (sentence a b))
  (if (> a b)
      0
      (+ (term a)
         (sumRec term (next a) next b))))

;
; (define (sum term a next b)
;   (define (iter a result)
;     (if <??>
;         <??>
;         (iter <??> <??>)))
;   (iter <??> <??>))

; Exercise 1.30. [after looking at solution]
(define (sumIter term a next b)
  (define (iter a result)
    ; (show (sentence a b)) ; at a different position form recursive counterpart
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(sumRec identity1 1 sum 4)
(sumIter identity1 1 sum 4)
