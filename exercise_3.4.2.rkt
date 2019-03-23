#lang r6rs

(import (rnrs))

(define retry `())

(define factorial
  (lambda (x0)
    (let f ((x x0) (k (lambda (x) x)))
      (if (= x 1)
          (begin
            (set! retry k)
            (k 1))
          (f (- x 1)
             (lambda (i)
               (* x (k i))))))))


               
