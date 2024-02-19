;;;
;;; Copyright © 2024 Christopher Augustus
;;;
;;; This Source Code Form is subject to the terms of the Mozilla Public
;;; License, v. 2.0. If a copy of the MPL was not distributed with this
;;; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;;;
#lang racket
(define count #f)
(define input (vector-ref
               (vector-append (current-command-line-arguments) #(""))
              0))
(do () (count)
    (if (string=? input "")
        (begin (display "countdown: ") (set! input (read-line)))
        '())
    (set! count (string->number input))
    (if (not count)
        (begin (printf "Invalid countdown ~s, try again...\n" input)
               (set! input ""))
        '()))
(display "World, Hello...") (flush-output)
(do ((i count (- i 1))) ((zero? i))
    (begin (printf "~a..." i) (flush-output) (sleep 1)))
(display "Bye Bye.\n")
