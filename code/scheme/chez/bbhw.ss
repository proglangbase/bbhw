;;;
;;; Copyright © 2024 Christopher Augustus
;;;
;;; This Source Code Form is subject to the terms of the Mozilla Public
;;; License, v. 2.0. If a copy of the MPL was not distributed with this
;;; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;;;
(letrec* (
  [getcount (lambda (arginput)
    (let* ([input (if (string=? arginput "")
                      (begin (display "countdown: ")
                             (get-line (current-input-port)))
                      arginput)]
           [count (string->number input)])
      (if (and (integer? count) (>= count 0))
          count
          (begin (display (format "Invalid countdown ~s, try again...\n" input))
                 (getcount "")))))]
  [count (getcount (fold-left
           (lambda (a x) (if (string=? a "") x (string-append a " " x)))
           "" (cdr (command-line))))])
  (display "World, Hello...") (flush-output-port)
  (do ((i count (- i 1))) ((zero? i))
    (display (format "~a..." i)) (flush-output-port)
    (sleep (make-time 'time-duration 0 1)))
  (display "Bye Bye.\n"))
