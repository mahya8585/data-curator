# data-curator

- twilio アカウント・電話番号をすでにお持ちである前提です
- 電話コールする部分のスクリプトだけ作成しています

## ソースコード修正が必要なところ
- twilioCall.py
    - account_sid : twilioのaccount sid (本当は別ファイルやkey vaultなどで管理するのが望ましい)
    - auth_token : twilioのauth token (本当は別ファイルやkey vaultなどで管理するのが望ましい)
    - client.calls.create
        - to : かけたい電話番号
        - from : twilioの電話番号
- get-bodytemperature.xml
    - Gatherタグ action : 電話終了後に飛ばしたい先。私の場合はLogic Apps. Gather内に持っているデータをpost bodyで受け取れます
    
## 1回の電話で複数のプッシュデータを取得したい場合
Twilio Studio + Twilio functionsなどを使って、1データずつDBへデータを送信する必要があります。    
![twilio-studioの画面](https://github.com/mahya8585/data-curator/blob/master/img/twilio-studio.png)    
    
- Twilio Studioを使わずにAzure Logic AppsやAzure Functionsなどを使ってデータフローを組むのも良いと思います
- DB設計として、RDBのテーブルに毎回アップデートをかけに行くよりは、KVSなどにデータをためて、最後にRDB登録をする、などの形のほうがスマートかなと思います。

![あとでここに図を追加する](あとでここに図を追加する)    
    
## 電話からデータを取得したあとの挙動について
 DBへのデータの登録は好きにやってもらって構いませんが、私はAzure Logic appを使ってDBへデータ登録を行いました。   
 今後詳細追記しますがとり急ぎ。
 
 ## 例えばどんなシステムに使える？このコードはどんなシステムで使われることをイメージして作った？
 リモートワークなご時世、ご自身の体調情報をwebで入力できる人はいいですが、webが使えない人もいると思うのでみんなが持っているであろう電話で情報送信できたらどうだろう？と思い電話発信部分のみとりあえず作成してみました。今後入り口から終わりまですべてこちらにも公開できるといいなと思っています（今は諸事情により他の部分非公開）。   
 例えばこんなかんじ。    
     
![利用想定例](https://github.com/mahya8585/data-curator/blob/master/img/readme-1.png)    
    
上記のようなフローを考えた場合、このスクリプトの周りに必要な処理システムは下記の通り

- ユーザ登録
    - 電話番号などをユーザマスタとして登録する
- 電話番号の複数人利用
    - 現在dbディレクトリに入っているテーブルは電話番号で一意に特定できるような仕組みになってますが、実際は家族みんなで電話番号を共有することがあると思います。電話のダイヤルプッシュフローに「xxxさんの場合は1, xxxさんの場合は2」みたいな分岐フローを作成する必要があります
- 取得したデータの加工処理
    - 必要であれば。
    
例えばPower BIなんか使って、ユーザ一人一人の体温変化グラフなどを見ることができるようにしたり    
![実際にやったグラフ](https://github.com/mahya8585/data-curator/blob/master/img/readme-2.png)    
    
位置情報が取れたり(もしくは事前に登録しておいてもらったり)、個人情報入力しておいてもらうと、マップとか年代別グラフとかも出せますね    
![実際にやったグラフ2](https://github.com/mahya8585/data-curator/blob/master/img/readme-3.png)
