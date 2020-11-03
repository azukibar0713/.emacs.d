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
