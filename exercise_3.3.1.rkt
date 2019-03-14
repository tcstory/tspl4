#lang r6rs

(import (rnrs))


(let ((lst (call/cc (lambda (k) (cons k 0)))))
  (display (cdr lst))
  (newline)
  ((car lst) (cons (car lst) (+ 1 (cdr lst)))))