#lang r6rs

(import (rnrs))

(define-syntax my-let*
  (syntax-rules ()
    ((_ () e1 e2 ...)
     (let () e1 e2 ...))
    ((_ ((x1 v1) (x2 v2) ...) e1 e2 ...)
     (let ((x1 v1))
       (my-let* ((x2 v2) ...) e1 e2 ...)))))
