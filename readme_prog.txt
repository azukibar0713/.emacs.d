プログラミングするときの操作覚書

-------------
表示
-------------
C-c l : 改行折り返しOff/On切り替え

-------------
移動
-------------
C-x m : ctrl-spaceでマークしたバッファの場所を表示

C-M-f   forward-sexp    閉じカッコの前に行く
C-M-b   backward-sexp   閉じカッコの後ろに行く
C-M-k   kill-sexp       閉じカッコ内を削除する
C-M-,C-M-@      mark-sexp       閉じカッコ内を選択する
C-M-a   beginning-of-defun      関数の前に行く
C-M-e   end-of-defun    関数の後ろに行く
C-M-h   mark-defun      関数を選択する

-------------
rg
-------------
https://rgel.readthedocs.io/en/2.0.1/usage.html#full-command-line-search
rg : ファイルタイプ指定のripgrep
バッファのsave
  rg-menu : rgの検索コマンドバッファで、rg-menuからsでsaveするとバッファがセーブされる.
ファイルのフィルター
  rg-menuから-gでglobのオプションを*.{c.h}のように指定すると.c, .hファイルが検索される

-------------
ファイル内
-------------
helm-occur : ファイル内で絞り込んで検索

-------------
ディレクトリ単位
-------------
helm-ag : 今のディレクトリ以下を検索. 10_helm.elでripgrepを使う設定にしている.

-------------
ファイル検索
-------------
l, s同時押し : helm-ls-git-ls  gitで管理されているファイルのhelm. l, s同時押しにアサイン




