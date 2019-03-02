#lang r6rs

(import (rnrs mutable-pairs (6)) (rnrs))

(define-syntax my-let*
  (syntax-rules ()
    ((_ () e1 e2 ...)
     (let () e1 e2 ...))
    ((_ ((x1 v1) (x2 v2) ...) e1 e2 ...)
     (let ((x1 v1))
       (my-let* ((x2 v2) ...) e1 e2 ...)))))

(my-let* ((a 1)) a)

(let ((a 1))
  (my-let* () a))

(let ((a 1))
  (let () a))

(my-let* ((a 5) (b (+ a a)) (c (+ a b)))
         (list a b c))

(let ((a 5))
  (my-let* ((b (+ a a)) (c (+ a b)))
           (list a b c)))

(let ((a 5))
  (let ((b (+ a a)))
    (my-let* ((c (+ a b)))
             (list a b c))))

(let ((a 5))
  (let ((b (+ a a)))
    (let ((c (+ a b)))
      (my-let* ()
               (list a b c)))))

(let ((a 5))
  (let ((b (+ a a)))
    (let ((c (+ a b)))
      (let ()
        (list a b c)))))