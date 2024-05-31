#! ; <-- syntax required to receive command-line arguments
;;;
;;; Copyright © 2024 Christopher Augustus
;;;
;;; This Source Code Form is subject to the terms of the Mozilla Public
;;; License, v. 2.0. If a copy of the MPL was not distributed with this
;;; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;;;
(import (srfi 48)) ; required for format

(define (cmd-line-arg)        (cadr (append (command-line) (list ""))))
(define (ask-count)           (display "countdown: ") (read-line))
(define (valid-count n)       (and (integer? n) (>= n 0)))
(define (say-invalid s)       (display (format "Invalid countdown ~s, try again...\n" s)))
(define (count-or-ask-rec s)  (let ((n (string->number s)))
                                   (if (valid-count n) n
                                       (begin (say-invalid s)
                                              (count-or-ask-rec (ask-count))))))
(define (count-or-ask s)      (count-or-ask-rec (if (string=? s "") (ask-count) s)))
(define (get-count)           (count-or-ask (cmd-line-arg)))
(define (say-hello)           (display "World, Hello...")  (flush-output-port))
(define (say-second s)        (display (format "~a..." s)) (flush-output-port))
(define (say-second-sleep s)  (say-second s) (thread-sleep! 1))
(define (count-down n)        (do ((i n (- i 1))) ((zero? i)) (say-second-sleep i)))
(define (say-bye-bye)         (display "Bye Bye.\n"))
(define (after x f g)         (f) (g x))

(after (get-count) say-hello count-down) (say-bye-bye)
