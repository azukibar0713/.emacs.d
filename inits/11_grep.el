;;; --------------------------------------------------------------------------------
;;; wgrep.el は、 M-x grep や M-x ag の結果を編集して
;;; その結果をファイルに反映させるものです。
;;; wdired はdiredの編集結果をファイル名に反映させるように、
;;; wgrep はgrepの編集結果をファイル内容に反映させます。
;;; M-x grep
;;; eでwgrep-modeにする
;;; *grep*バッファを編集する
;;; C-c C-c (C-x C-s)でファイルに反映！
;;;C-c C-kで編集を破棄します。
;;; --------------------------------------------------------------------------------
;;; eでwgrepモードにする
(setf wgrep-enable-key "e")
;;; wgrep終了時にバッファを保存
(setq wgrep-auto-save-buffer t)
;;; read-only bufferにも変更を適用する
(setq wgrep-change-readonly-file t)

; パッケージwgrepには、 wgrep-ag.el 、 wgrep-pt.el 、
; wgrep-ack.el 、 wgrep-helm.el も同梱されているので、
; M-x ag の結果なども編集できます。

