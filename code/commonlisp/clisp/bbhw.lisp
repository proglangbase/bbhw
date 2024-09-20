(defvar *count* 
  (let ((arg (car *args*)))
    (loop
      (if (not arg)
        (progn
          (format t "countdown: ")
          (setf arg (read-line))))
          
      (setf arg (string-trim '(#\Space #\Tab #\Newline) arg))

      (let (i p (l (length arg)))
        (setf (values i p) (parse-integer arg :junk-allowed t))
        (if (> l 0)
          (if (and i (and (>= i 0) (= p l))) 
            (return i)
            (format t "Invalid countdown \"~a\", try again...~%" arg))))

      (setf arg nil))))

(format t "World, Hello...")
(loop for i from 1 to *count* do
  (format t "~a..." i)
  (sleep 1))
(format t "Bye, Bye~%")
