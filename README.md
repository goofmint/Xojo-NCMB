# NCMB SDK for Xojo

[Xojo](https://xojo.grapecity.com)から[ニフティクラウド mobile backend](http://mb.cloud.nifty.com)を使うためのライブラリです。

## 現在サポートされている機能

- [x] データストアへの登録
- [x] データストアから全件取得
- [x] データストアから削除
- [x] ユーザ登録
- [x] ユーザ削除
- [x] ユーザログイン（ID/パスワード）
- [x] ロール（パブリックリード/ライト）

## データストアへの登録

```
Dim DataClass as NCMB.DataStore = new NCMB.DataStore("DataClass")
Dim dataItem as NCMB.DataStoreItem =  DataClass.new_data
dataItem.set("msg", "Hello")
if dataItem.save() then
  // 保存成功
else
  // 保存失敗
  dataItem.error.code // エラーコード
  dataItem.error.error // エラーメッセージ
end if
```

## LICENSE

MIT.

