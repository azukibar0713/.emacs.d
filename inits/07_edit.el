;; -----
;; Redo
;; -----
(when (require 'redo+ nil t)
  ;; C-' にリドゥを割り当てる
  ;;(global-set-key (kbd "C-'") 'redo)
  ;; 日本語キーボードの場合C-. などがよいかも
  (global-set-key (kbd "C-.") 'redo)
  ) ; ←ここでC-x C-eで設定反映

;; C-hをバックスペースにする.
(global-set-key "\C-h" 'delete-backward-char)

;; "C-t" でウィンドウを切り替える。初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)

;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;;; --------------------------------------------------------------------------------
;;;Ctrl+Enterで矩形選択開始
;;; --------------------------------------------------------------------------------
(cua-mode t)
(setq cua-enable-cua-keys nil)

