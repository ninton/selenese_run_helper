# selenese_run_helper

seleneseテストをFireFoxで実行するためのヘルパースクリプトです。

Copyright 2020-, Aoki Makoto, Ninton G.K. http://www.ninton.co.jp  
Released under the MIT license - http://en.wikipedia.org/wiki/MIT_License

## 必要なもの

__xvfb__

FireFoxをヘッドレスで起動するための仮想Ｘです。

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

(3) ~/selenese_run_helper をPATHに追加してください。

```
$ echo "export PATH=$(pwd):\$PATH" >> ~/.bashrc
```

(4) ターミナルを閉じて、再度ターミナルを開いて、さきほどのPATH設定を適用してください。

```
$ which selenium_server_start.sh
/home/xxxx/selenese_run_helper/selenium_server_start.sh
```

## 使い方

テスト対象のwebサイトはすでにあるものとします。

selenese HTMLが selenese/testcase_1.html にあるとします。

```
selenium_server_start.sh
selenese_run.sh selenese/testcase_1.html
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

##　使い方の例

jpostal_json の test_and_push.sh で、本ヘルパースクリプトを使っています。

https://github.com/ninton/jpostal_json/blob/master/test_and_push.sh

selenese HTMLは、

https://github.com/ninton/jpostal_json/blob/master/selenese/smoke_local.html
