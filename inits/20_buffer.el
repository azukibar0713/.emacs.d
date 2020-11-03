;;; --------------------------------------------------------------------------------
;;; すべてのバッファを閉じる.
;;; --------------------------------------------------------------------------------
;; Close all buffers
(require 'cl)
(defun close-all-buffers ()
  (interactive)
  (loop for buffer being the buffers
     do (kill-buffer buffer)))

;;; --------------------------------------------------------------------------------
;;; バッファを切り替える. mini bufferに切り替えtab風に表示される.
;;; --------------------------------------------------------------------------------
(global-set-key (kbd "M-o") 'iflipb-next-buffer)
(global-set-key (kbd "M-O") 'iflipb-previous-buffer)
