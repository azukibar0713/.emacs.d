(require 'helm-config)
(helm-mode 1)

(define-key global-map (kbd "C-]") 'helm-mini)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)

(require 'helm-gtags)
(helm-gtags-mode t)
(setq helm-gtags-mode-hook
      '(lambda ()
	 (local-unset-key "\C-t")
					; 文脈から判断してジャンプ
	 (local-set-key "\C-t\C-t" 'helm-gtags-dwim)
					; 定義元へ
					;	 (local-set-key "\C-t\C-d" 'helm-gtags-find-tag)
	 (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
					; 参照元へ
					;	 (local-set-key "\C-t\C-r" 'helm-gtags-find-rtag)
	 (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
					; 変数の定義元/参照先へ
					;	 (local-set-key "\C-t\C-s" 'helm-gtags-find-symbol)
	 (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
					;	 (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
					; 前のバッファへ
	 (local-set-key "\C-t\C-p" 'helm-gtags-previous-history)
					; 次のバッファへ
	 (local-set-key "\C-t\C-n" 'helm-gtags-next-history)
					; ファイルへ
	 (local-set-key "\C-t\C-f" 'helm-gtags-find-file)
	 ))

(add-hook 'c-mode-hook 'helm-gtags-mode)


; ripgrepをhelm化
(setq helm-ag-base-command "rg --vimgrep --no-heading")
