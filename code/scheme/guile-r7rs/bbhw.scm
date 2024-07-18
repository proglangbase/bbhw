(import (scheme base)
        (scheme process-context)
        (scheme read)
        (srfi 18))

(define (valid-count? count)
  (and (integer? count) (>= count 0)))

(define (prompt-count)
  (write-string "countdown: ")
  (let* ((input (read-line))
         (count (string->number input)))
    (if (valid-count? count)
        count
        (begin (write-string "Invalid countdown ")
               (write-string input)
               (write-string ", try again...\n")
               (prompt-count)))))

(define count
  (let ((from-cmdline (string->number (cadr (append (command-line) (list ""))))))
    (if (valid-count? from-cmdline)
        from-cmdline
        (prompt-count))))

(display "World, Hello...") (flush-output-port)
(do ((i count (- i 1)))
    ((zero? i))
  (display i) (write-string "...") (flush-output-port)
  (thread-sleep! (seconds->time (+ (time->seconds (current-time)) 1))))
(display "Bye Bye.\n")
