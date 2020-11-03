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


;;; --------------------------------------------------------------------------------
;;; ローマ字で日本語検索.
;;; --------------------------------------------------------------------------------
;(setq migemo-command "cmigemo")
;(setq migemo-options '("-q" "--emacs" "-i" "\a"))
;(setq migemo-dictionary (expand-file-name "~/.emacs.d/cmigemo-default-win64/dict/utf-8/migemo-dict"))
;;(setq migemo-dictionary (expand-file-name "~/.emacs.d/cmigemo-default-win64/dict/cp932"))
;(setq migemo-user-dictionary nil)
;(setq migemo-regex-dictionary nil)
;(setq migemo-use-pattern-alist t)
;(setq migemo-use-frequent-pattern-alist t)
;(setq migemo-pattern-alist-length 1000)
;(setq migemo-coding-system 'utf-8-unix)
;(load-library "migemo")
;(migemo-init)


;;; --------------------------------------------------------------------------------
;;; company
;;; --------------------------------------------------------------------------------
(require 'company)
(global-company-mode) ; 全バッファで有効にする
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
; 特定のmodeだけでcompany-modeを有効にしたいときは，(global-company-mode)を消して
;(add-hook 'python-mode-hook 'company-mode)

; M-n 次の候補選択
; M-p 前の候補選択
; C-g 候補選択中止
; RET 候補選択
; F1, C-h docを別バッファに表示
; C-w 定義場所を表示
; C-s 候補検索
; C-M-s 候補フィルタリング
; [tab] 共通するprefixを挿入
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)
