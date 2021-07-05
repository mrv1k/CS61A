#lang simply-scheme

; Modify the procedure so that it correctly handles cases like (plural ’boy).

; original
; (define (plural wd)
;   (if (equal? (last wd) 'y)
;       (word (bl wd) 'ies)
;       (word wd 's)))

; (if (equal? 'a 'b) 'a 'b)

(define (plural wd)
  (if (equal? (last wd) 'y)
      (if (member? (last (butlast wd)) '(a e i o u))
          (word wd 's)
          (word (butlast wd) 'ies))
      (word wd 's)))

; s
(plural 'book)
(plural 'boy)
(plural 'key)

; ies
(plural 'fly)
(plural 'story)
(plural 'company)

#|
If a word ends in a "y", and that "y" is preceded by a CONSTANT,
then when we add an "-s" we change the "y" to "ie",
"story" -> "stories", "company" -> "companies"

If the "y" is preceded by a vowel, it is left unchanged.
Thus "boy" -> "boys", "key" -> "keys"
|#
