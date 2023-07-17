;;; --------------------------------------------------------------------------------
;;; 自動シンボルハイライト
;;; --------------------------------------------------------------------------------
;;; 1秒後自動ハイライトされるようになる
(setq highlight-symbol-idle-delay 1.0)
;;; 自動ハイライトをしたいならば
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-to-list 'auto-mode-alist '("\\.def\\'" . text-mode))
(add-hook 'text-mode-hook 'highlight-symbol-mode)
(define-key text-mode-map "\M-n" 'highlight-symbol-next)
(define-key text-mode-map "\M-p" 'highlight-symbol-prev)
;;; ソースコードにおいてM-p/M-nでシンボル間を移動
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)

;;; スクロールを一行ずつにする
(setq scroll-step 1)

;;; カーソルは移動させないでスクロール
(global-set-key (kbd "C-S-n") (lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (scroll-down 1)))

;;; 今見えているwindowの一番上にカーソルを移動させる
(global-set-key (kbd "C-<") (lambda () (interactive)(move-to-window-line 0)))
;;; 今見えているwindowの一番上にカーソルを移動させる
(global-set-key (kbd "C->") (lambda () (interactive)(move-to-window-line -1)))

;;; Emacsでは、空白ではない最初の文字に移動するためにはM-m (Meta-m または Alt-m)を使用します。
;;; このショートカットは、「back-to-indentation」というコマンドを実行し、現在の行で最初の非空白文字にカーソルを移動します。
