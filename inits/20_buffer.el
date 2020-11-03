;;; --------------------------------------------------------------------------------
;;; すべてのバッファを閉じる.
;;; --------------------------------------------------------------------------------
;; Close all buffers
(require 'cl)
(defun close-all-buffers ()
  (interactive)
  (loop for buffer being the buffers
     do (kill-buffer buffer)))
