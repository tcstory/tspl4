#lang r6rs

(import (rnrs mutable-pairs (6)) (rnrs))

(define-syntax my-when
  (syntax-rules ()
    ((_ t1 e1 e2 ...)
     (if t1 (begin e1 e2 ...)))))

(define-syntax my-unless
  (syntax-rules ()
    ((_ t1 e1 e2 ...)
     (my-when (not t1) e1 e2 ...))))
 