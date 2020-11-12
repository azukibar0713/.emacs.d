;; 左下に表示されている改行コードの表示をわかりやすくする.
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")
;; メニューバーを消す
(menu-bar-mode -1)
;; ツールバーを消す
(tool-bar-mode -1)
;; 列数を表示する
(line-number-mode t)
(column-number-mode t)
;; ファイルサイズを表示
(size-indication-mode t)

;\左に行番号表示
(require 'linum)
(global-linum-mode)

;; P101 括弧の対応関係のハイライト
;; paren-mode：対応する括弧を強調して表示する
(setq show-paren-delay 0) ; 表示までの秒数。初期値は0.125
(show-paren-mode t) ; 有効化
;; parenのスタイル: expressionは括弧内も強調表示
(setq show-paren-style 'expression)
;; フェイスを変更する
;;(set-face-background 'show-paren-match-face nil)
;;(set-face-underline-p 'show-paren-match-face "yellow")



;;; --------------------------------------------------------------------------------
;;; 行末のタブ、スペースを可視化.
;;; --------------------------------------------------------------------------------
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
;;                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)

;;; P90 タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;;; --------------------------------------------------------------------------------
;;; C-x 1 でWindowを結合。もう一度実行するともとの分割にもどる.
;;; --------------------------------------------------------------------------------
(require 'zoom-window)
(global-set-key (kbd "C-x 1") 'zoom-window-zoom)
(setq zoom-window-mode-line-color "DarkGreen")





;; ------------------------------------------------------------------------
;; @ hideshow/fold-dwim.el

;; ブロックの折畳みと展開
;; http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el
(when (require 'fold-dwim nil t)
  (require 'hideshow nil t)
  ;; 機能を利用するメジャーモード一覧
  (let ((hook))
    (dolist (hook
             '(emacs-lisp-mode-hook
               c-mode-common-hook
               python-mode-hook
               php-mode-hook
               ruby-mode-hook
               js2-mode-hook
               css-mode-hook
               apples-mode-hook))
      (add-hook hook 'hs-minor-mode))))

;; -------------------------------------------------------------------------
;; フレームの透明度
;; -------------------------------------------------------------------------
;(set-frame-parameter (selected-frame) 'alpha '(0.85))

;; -------------------------------------------------------------------------
;; SublimeTextでおなじみ。デフォルトはきってあります。 この右側に表示されたコード全体を俯瞰できるやつです。 M-x minimap-modeで有効になる。
;; -------------------------------------------------------------------------
(require 'minimap)
;; (minimap-mode 1); 常に有効にする
(setq minimap-window-location 'right); windowの位置
(setq minimap-update-delay 0.2); 表示を更新する時間
(setq minimap-minimum-width 20); 幅の長さ
;; 有効にしたいモード
;(setq minimap-major-modes '(c-mode
;                            text-mode))
;; 適当なキーに割り当てる
(key-chord-define-global "ma" 'minimap-mode)
;(global-set-key (kbd "C-x m") 'minimap-mode); toggle

