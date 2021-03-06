# selenese_run_helper

Selenese Test SuiteをFireFoxで実行するためのヘルパースクリプト

Selenese Test Suiteを実行するときの定形処理をスクリプトにまとめました。

Copyright 2020-, Aoki Makoto, Ninton G.K. http://www.ninton.co.jp  
Released under the MIT license - http://en.wikipedia.org/wiki/MIT_License

## 必要なもの

__xvfb__

FireFoxをヘッドレスで起動するための仮想Ｘディスプレイバッファです。

```
$ sudo apt install xvfb
```


## 説明

__download_linux.sh__  
ドライバやjarをダウンロードします。  
selenium-server-standalone.jar  
geckodriver  
selenese-runner.jar  

__selenium_server_start.sh__  
selenium standalone serverをスタートします。

__selenese_run.sh__  
seleneseテストケースをFireFoxで実行します。

__selenium_server_stop.sh__  
selenium standalone serverをストップします。

## 初期設定

(1) git clone

```
$ cd ~
$ git clone git@github.com:ninton/selenese_run_helper.git
$ cd selenese_run_helper
```

(2) ドライバやjarをダウンロードしてください。

```
$ ./download_linux.sh
```

(3) \~/selenese_run_helper をPATHに追加してください。ねんのために、\~/.bashrc のコピーをとっておきます。

```
$ cp ~/.bashrc ~/.bashrc.bak
```

次のechoコマンドで表示された１行を ~/.bashrc に追加してください。

```
$ echo export PATH="$(pwd):\$PATH"
export PATH=/home/jenkins/selenese_run_helper:$PATH
```

この例では、次の１行を ~/.bashrc に追加してください。

```
export PATH=/home/jenkins/selenese_run_helper:$PATH
```

(4) ターミナルを閉じて、再度ターミナルを開いて、さきほどのPATH設定を適用してください。

```
$ which selenium_server_start.sh
/home/xxxx/selenese_run_helper/selenium_server_start.sh
```

## 使い方

テスト対象のwebサイトはすでにあるものとします。

Selenese Test Suite HTMLが selenese/testsuite_1.html にあるとします。

```
selenium_server_start.sh
selenese_run.sh selenese/testsuite_1.html
selenium_server_stop.sh
```

テスト結果は、./testResults/TEST-*/xml に保存されます。  

ERRORがあるかどうかは、次のようなシェルスクリプトで判定できます。

```
errcnt=$(grep ./testResults/TEST-*.xml | wc --line)
if [ $errcnt -eq 0 ]; then
  エラーがなかったとき
else
  エラーだったとき
fi
```


## 使い方の例

jpostal_json の test_and_push.sh で、本ヘルパースクリプトを使っています。

https://github.com/ninton/jpostal_json/blob/master/test_and_push.sh

Selenese Test Suite HTMLは、

https://github.com/ninton/jpostal_json/blob/master/selenese/smoke_local.html
