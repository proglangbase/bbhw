(import (scheme base)
        (scheme process-context)
        (scheme read)
        (srfi 18))

(define count
  (do ((input (cadr (append (command-line) (list "")))
              (begin
                (write-string "countdown: ")
                (read-line))))
      ((let ((count (string->number input)))
         (and (integer? count) (>= count 0)))
       (string->number input))
    (unless (string=? input "")
      (write-string "Invalid countdown ")
      (write-string input)
      (write-string ", try again...")
      (newline))))

(write-string "World, Hello...") (flush-output-port)
(do ((i count (- i 1)))
    ((zero? i))
  (display i) (write-string "...") (flush-output-port)
  (thread-sleep! (seconds->time (+ (time->seconds (current-time)) 1))))
(write-string "Bye Bye.") (newline)
