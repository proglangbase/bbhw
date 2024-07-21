(import (scheme base)
        (only (scheme process-context) command-line)
        (only (srfi 18) thread-sleep!))

(define count
  (let get-count ((input (cdr (command-line))))
    (cond ((and (integer? input) (>= input 0)) input)
          ((and (string? input) (string->number input)) => get-count)
          ((pair? input) (get-count (car input)))
          ((null? input) (get-count #f))
          ((and (string? input) (string=? "" input)) (get-count #f))
          (else
           (if input
               (begin
                 (write-string "Invalid countdown ")
                 (display input)
                 (write-string ", try again...")
                 (newline)))
           (write-string "countdown: ")
           (get-count (read-line))))))

(write-string "World, Hello...") (flush-output-port)
(do ((i count (- i 1)))
    ((zero? i))
  (display i) (write-string "...") (flush-output-port)
  (thread-sleep! 1))
(write-string "Bye Bye.") (newline)
