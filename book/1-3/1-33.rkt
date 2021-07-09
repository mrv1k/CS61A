#lang simply-scheme

; https://xuanji.appspot.com/isicp/1-3-hop.html
; http://community.schemewiki.org/?sicp-ex-1.33


(define (identity n) n)
(define (inc n) (+ n 1))

; (define (accumulate combiner null-value term a next b)
;   (if (> a b) null-value
;       (combiner (term a) (accumulate combiner null-value term (next a) next b))))

; (show 'accumulate)
; (define (sum-rec a b) (accumulate + 0 identity a inc b))
; (sum-rec 1 4)

; (define (prod-rec a b) (accumulate * 1 identity a inc b))
; (prod-rec 1 4)


; (define (filtered-accumulate combiner null-value term a next b filter?)
;   'your-code-here)


; [my-attempt]
; (define (filtered-accumulate combiner null-value term a next b filter?)
;   (if (filter? a)
;       (if (> a b) null-value
;           (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter?)))
;       (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter?))))

; [after-solution]
; change if order
; change if #false combiner to pass null-value
(define (filtered-accumulate combiner null-value term a next b filter?)
  (if (> a b) null-value
      (if (filter? a)
          (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter?))
          (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter?)))))


(define (multiply-odd a b) (filtered-accumulate * 1 identity a inc b odd?))
(multiply-odd 1 4)
(define (sum-even a b) (filtered-accumulate + 0 identity a inc b even?))
(sum-even 1 4)

; Show how to express the following using filtered-accumulate:
; A. the sum of the squares of the prime numbers in the interval a to b
; (assuming that you have a prime? predicate already written)

(define (sq n) (* n n))
(define (square n) (* n n))

; [copy-paste from solution]

(define (smallest-div n)
  (define (divides? a b)
    (= 0 (remainder b a)))
  (define (find-div n test)
      (cond ((> (sq test) n) n) ((divides? test n) test)
            (else (find-div n (+ test 1)))))
  (find-div n 2))

  (define (prime? n)
    (if (= n 1) #f (= n (smallest-div n))))

(define (sum-of-prime-squares a b) (filtered-accumulate + 0 sq a inc b prime?))

(sum-of-prime-squares 1 5) ; 38


; B. the product of all the positive integers less than n that are relatively prime to n
; (i.e., all positive integers i<n such that GCD(i,n)=1).
(define (gcd m n)
  (cond ((< m n) (gcd n m))
        ((= n 0) m)
        (else (gcd n (remainder m n)))))

(define (relative-prime? m n)
(= (gcd m n) 1))

(define (product-of-relative-primes n)
  (define (filter x)
    (relative-prime? x n))
(filtered-accumulate * 1 identity 1 inc n filter))

(product-of-relative-primes 10) ; 189
