;; Sean's Handin for LISP FlatMap

;;EX 1

;; (setq LISTOUT (mapcar (lambda (x) (+ x 2)) '(3 5 7 9)))
;; (write LISTOUT)

;; (defun mymap(F1 L3) (mapcar #'(F1 L3))

(defun mymap(L3) (mapcar #'(lambda(y) (+ y 2)) L3))


;;EX 2


(defun list-append (L1 L2) (append L1 L2))
(setq LIST1 '(1 3 5 7))
(write LIST1)
(setq LIST2 '(12 14 16))
(write LIST2)
(setq LIST3 (list-append LIST1 LIST2))
(write LIST3)


;;EX 3


(defun list-append (L1 L2) (append L1 L2))
(defun mymap(L3) (mapcar #'(lambda(y) (+ y 2)) L3))
(setq LIST1 '(1 3 5 7))
(write LIST1)
(setq LIST2 '(12 14 16))
(write LIST2)
(setq LIST3 (list-append (mymap LIST1) (mymap LIST2)))
(write LIST3)
