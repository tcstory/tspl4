#lang r6rs

(import (rnrs))

;; named let 的定义
(define-syntax my-let
  (syntax-rules ()
    ((_ ((var val) ...) e1 e2 ...)
     ((lambda (var ...) e1 e2 ...) val ...))
    ((_ name ((var val) ...) e1 e2 ...)
     ((lambda ()
        (define name
          (lambda (var ...) e1 e2 ...))
        (name val ...))))))


(define factorial
  (lambda (n)
    (my-let fact ([i n])
      (if (= i 0)
          1
          (* i (fact (- i 1)))))))