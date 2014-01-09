kaz29 MacOSX cookbooks
-------

新しくMBPを買ったのを契機にChefで設定を管理したいと思い、[hamacoさんのレシピ](https://github.com/hamaco/chef-hamacbook)を見てたのですが、色々手を入れたくなったのでforkせずに自前で作りはじめた。
かなりの部分はhamacoさんのを参考にしています。

実験中なので大幅に直すと思います。

# 動作環境
設定をするMacとknife soloを実行可能なMacの2台のMacが必要です。
knife soloの設定方法は割愛。

# 事前準備
* Macを開梱後メインユーザーのアカウントを作成し、システム環境設定 => 共有 でリモートログインを有効にする
* chefを実行するサーバーからログインし公開鍵を設置
* パスワード無しでsudo出来る必要があるので、下記の様に設定を変更

末尾に以下の様に設定を追加

	$ sudo visudo
	...
	ユーザ名  ALL=(ALL) NOPASSWD:ALL

* knife-solo-0.3.0.pre3はデフォルトでMacOSX10.9がサポートされていないので微調整

rubyのインストール環境によりPATHは適当に読み替えてください

	$ vim [path to gems]/gems/knife-solo-0.3.0.pre3/lib/knife-solo/bootstraps/darwin.rb
	
	 10       when %r{10.[6-9]}  // 元々は[6-8]なので[6-9]に変更
新しいバージョンを使ってれば大丈夫なのかも。

## Berkshelfでcookbookをインストール

以下のコマンドでcommunitycookbookをインストール

	$ berks install --path cookbooks/

# レシピの実行

	$ knife solo prepare ホスト名
	
	// 下記を一回目に実行時、ターゲットのMacでコマンドラインツールのインストールを即す確認ダイアログが表示されるので、インストールをしてから再実行
	$ knife solo cook ホスト名

# TODO

* アプリのインストールレシピをそれぞれ書かないといけないのをなんとかしたい
* zipアーカイブされたインストーラで配布されるアプリがインストール出来ない
* rbenvでインストールするバージョンを設定で書き換えたい
* システム設定がうまく設定されていないので調べる
