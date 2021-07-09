#lang simply-scheme

; General chapter references
; 1.3.1
(define (sum term a next b)
  (if (> a b) 0
      (+ (term a) (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))

(sum-integers 1 4)

; 1.3.2 Constructing Procedures Using Lambda
; without lambda
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

; lambda
(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

; (lambda (<formal-parameters>) <body>)


(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

; an extra bracket before lambda is because lambda will become procedure
(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y)) ; passed as a to lambda
   (- 1 y))) ; passed as b to lambda

(define (f x y)
  (let ((a (+ 1 (* x y))) ; by using let we make name-expression pairs
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

; let expression is simply syntactic sugar
; The general form of a let expression is
; (let ((<var1> <exp1>)
;       (<var2> <exp2>)
;       ...
;       (<varN> <expN>))
;    <body>)
;
; let <var_1> have the value <exp_1> and
;     <var_2> have the value <exp_2> and
;     ...
;     <var_n> have the value <exp_n>
; in  <body>


(let ((x 3)
      (y (+ x 2)))
  (* x y))

; ! WHY?
; will have the value 12 because, inside the body of the let,
; x will be 3 and y will be 4 (which is the outer x plus 2).
