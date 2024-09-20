#! ; <-- syntax required to receive command-line arguments
;;;
;;; Copyright © 2024 Christopher Augustus
;;;
;;; This Source Code Form is subject to the terms of the Mozilla Public
;;; License, v. 2.0. If a copy of the MPL was not distributed with this
;;; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;;;
(import (srfi 1 )  ; fold
        (srfi 31)  ; rec
        (srfi 48)) ; format
(let ((count
  ((rec (f arginput)
    (let* ((input (if (string=? arginput "")
                      (begin (display "countdown: ")
                             (read-line))
                      arginput))
           (count (string->number input)))
      (if (and (integer? count) (>= count 0))
          count
          (begin (display (format "Invalid countdown ~s, try again...\n" input))
                 (f "")))))
   (fold (lambda (x a) (if (string=? a "") x (string-append a " " x)))
         "" (cdr (command-line))))))
  (display "World, Hello...") (flush-output-port)
  (do ((i count (- i 1))) ((zero? i))
    (display (format "~a..." i)) (flush-output-port) (thread-sleep! 1))
  (display "Bye Bye.\n"))
