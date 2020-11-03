(unless package--initialized (package-initialize t))
;(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(package-utils init-loader)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ロードするpath
(setq load-path (cons "../manual_install/" load-path))

;;; --------------------------------------------------------------------------------
;;; キーボード同時押しコマンド
;;; --------------------------------------------------------------------------------
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)
;; グローバルマップへの設定例 ex.jk同時押しでview-mode設定
;(key-chord-define-global "jk" 'view-mode)
;; メジャーモードへの設定例
;(key-chord-define emacs-lisp-mode-map "df" 'describe-function)

;;; --------------------------------------------------------------------------------
;;; recentf拡張
;;; http://d.hatena.ne.jp/rubikitch/20091224/recentf
;;; --------------------------------------------------------------------------------
(defmacro with-suppressed-message (&rest body)
  "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
  (declare (indent 0))
  (let ((message-log-max nil))
    `(with-temp-message (or (current-message) "") ,@body)))

(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")
(setq recentf-max-saved-items 1000)            ;; recentf に保存するファイルの数
(setq recentf-exclude '(".recentf"))           ;; .recentf自体は含まない
(setq recentf-auto-cleanup 'never)             ;; 保存する内容を整理
(run-with-idle-timer 60 t '(lambda ()          ;; 60秒ごとに .recentf を保存
   (with-suppressed-message (recentf-save-list))))
(require 'recentf-ext)


