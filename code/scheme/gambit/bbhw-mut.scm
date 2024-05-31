#! ; <-- syntax required to receive command-line arguments
;;;
;;; Copyright © 2024 Christopher Augustus
;;;
;;; This Source Code Form is subject to the terms of the Mozilla Public
;;; License, v. 2.0. If a copy of the MPL was not distributed with this
;;; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;;;
(import (srfi 48)) ; required for format
(define count #f)
(define input (cadr (append (command-line) (list ""))))
(do () (count)
    (if (string=? input "")
        (begin (display "countdown: ")
               (set! input (read-line))))
    (set! count (string->number input))
    (if (or (not (integer? count)) (< count 0))
        (begin (display (format "Invalid countdown ~s, try again...\n" input))
               (set! count #f)
               (set! input ""))))
(display "World, Hello...") (flush-output-port)
(do ((i count (- i 1))) ((zero? i))
    (begin (display (format "~a..." i)) (flush-output-port) (thread-sleep! 1)))
(display "Bye Bye.\n")
