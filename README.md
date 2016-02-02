# LRUCache

## 概要
最大10個の画像イメージをストック可能なLRUキャッシュを使うことのできるAPIです。  
SinatraによるWEBサーバとして動作し、JSONによるデータの通信が可能です。

## HOW TO USE
`$ruby main.rb` を実行すると、LRUキャッシュメモリを扱うSinatra WEBサーバが立ち上がります。  
  
*POST /get*に{url: "URLのパス"}  
というJSONを送信すると、base64でエンコードされた画像ファイルがJSONとして受け取ることができます。

コマンドの例：  
`$curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"url":"http://www.sinatrarb.com/images/logo.png"}' http://localhost:4567/get`  
結果：  
{"url":"http://www.sinatrarb.com/images/logo.png","image_data":"(省 略)"}

## ファイル構成  
ファイルは5つあり、それぞれのファイルの簡単な説明は以下のとおりです。  
<table>
<tr>
  <td>ファイル名</td>
  <td>機能</td>
</tr>
<tr>
  <td>main.rb</td>
  <td>Sinatraサーバとして実行可能なファイル</td>
</tr>
<tr>
  <td>lru.rb</td>
  <td>LRUキャッシュメモリの実装クラス</td>
</tr>
<tr>
  <td>downloader.rb</td>
  <td>画像データのダウンロード機能を扱うクラス</td>
</tr>
<tr>
  <td>image_cache.rb</td>
  <td>イメージキャッシュを扱うクラス</td>
</tr>
<tr>
  <td>test_lru.rb</td>
  <td>lru.rbのユニットテスト</td>
</tr>
</table>
