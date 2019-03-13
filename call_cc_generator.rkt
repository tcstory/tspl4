#lang r6rs

(import (rnrs))


(define generate-one-element-at-a-time
  (lambda (lst)
    (define (ctrl k)
                 (for-each (lambda (item)
                             (call/cc (lambda (kk)
                                        (set! ctrl kk)
                                        (k item)))) lst)
      (k 'you-fell-off-the-end))
    (define (generator)
      (call/cc ctrl))
    generator))
            

(define generate-digit
  (generate-one-element-at-a-time `(1 2 3)))

