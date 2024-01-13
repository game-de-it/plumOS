# plumOS

  <img src="./distributions/JELOS/logos/jelos-logo.png" width="240">  

## 目次
右上にある「三」アイコンをクリックすると目次が表示されます。  

<img src="./documentation/plumOS_sc03.png" width="700">  

## 特徴
JELOSをベースとした実験的なディストリビューションです。  

## ダウンロード
画面右側のメニューの「Releases」から.img.gzファイルをダウンロードできます。  
 <img src="./documentation/plumOS_sc01.png" width="400">　<img src="./documentation/plumOS_sc02.png" width="400">  

## 既知の問題
- plumOSでは32bit環境を除外したため、PS1をプレイする場合はROM選択画面でセレクトメニュー→「システム詳細設定」→「エミュレーター」項目から「RETROARCH: PCSX REARMED32　以外を選択」してください
- PORTSで32bit版の一部のゲームは動作しません

## 謝辞
- オリジナルのJELOS開発チームに感謝と敬意を表します。
- plumOSロゴ＆スプラッシュ画像の提供者 [ Twitter : JLさん @JL_0w0] ありがとうございます！
- Emulationstationの日本語化　提供者 [ Twitter : unknown優さん @46_un_known] ありがとうございます！
  - ブログURL [https://ameblo.jp/unknown-gra/](https://ameblo.jp/unknown-gra/)

## 更新情報
- [NEW] βバージョンをリリース  
 
## 特徴
### ●基本情報
- デフォルトでEmulationstationおよびRetroarchが日本語に設定されています
- Retroarchの設定およびHotkeyを自由に変更可能です
- Retroarchからシェルスクリプトを実行可能になりました
- イコライザーによってスピーカーから出る音の音質を向上させています
- 32bit版のRetroarchを廃止しています

### ●対応エミュレータ
JELOSのwikiから左側メニューの「System」セクションから、各エミュレータの情報(対応拡張子など)を確認できます。  
- JELOS wiki [https://jelos.org/](https://jelos.org/)

### ●Retroarch仕様
- セーブファイルはromファイルと同じフォルダに作成されます
- ステートセーブファイルはromファイルと同じフォルダに作成されます

### ●romsフォルダーの自動作成
ESの画面からSTARTボタンを押してメニューを出して「システム設定」→「ゲームディレクトリの作成」を実行すると、nesやsnesなどのフォルダがromsフォルダ内に生成されます。  

### ●RetroArchのホットキー
- ※Hotkeyの設定は自由に変更可能です  

| Button Combo | Action | 
|:-----------|------------:|
| L3+R3       |        Retroarchメニュー表示 |
| SELECT+R       |        ステートセーブ |
| SELECT+L     |      ステートロード |
| SELECT+R2     |      ファストフォワード(早送りx2倍) |
| SELECT+L2     |      スローモーション(x1.5倍) |
| SELECT+X     |      スナップショット(roms/screenshots) |
| SELECT+Y     |      FPS表示 |
| SELECT+B     |      Retroarchメニュー表示 |
| SELECT+十字キー↑     |      音量アップ |
| SELECT+十字キー↓     |      音量ダウン |

### ●OSのホットキー
| Button Combo | Action | 
|:-----------|------------:|
| SELECT+Vol+       |        画面輝度を上げる |
| SELECT+Vol-       |        画面輝度を下げる |


### ●Retroarchからシェルスクリプトを実行する手順
1. SDカード内の[roms/scripts/]フォルダにシェルスクリプトを置きます
(ファイルの拡張子は .sh にしてください)
2. ESのTools項目から「Start Retroarh (64-bit)」を起動します
3. 「コンテンツをロード」→「お気に入り」→「scripts」の順に進み、シェルスクリプトを選択してください

### ●イコライザーについて
一時的にイコライザー機能をOFFにする場合は、上記の「Retroarchからシェルスクリプトを実行する手順」を参考にしてscriptsフォルダ内にある「Equalizer.sh」を実行してください。  
再度 Equalizer.sh を実行するとイコライザー機能がONになります。  
なお、OS再起動をするとイコライザーが自動的にONになります。  
(将来的にはEQを恒久的にON/OFFできるように考えてます)   

イコライザーの音質をチューニングする場合はSDカード内の「.config/pipewire/pipewire.conf.d/sink-eq6.conf」ファイルを編集してOS再起動をしてください。
```
〜　イコライザーのチューニング指南書　〜
基本的にいじる箇所はcontrol = { "Freq" = 100.0 "Q" = 1.0 "Gain" = 0.0 }のような箇所になります。
パラメータの変更後はOSを再起動します

● Freq
変化させる周波数(Hz)です。
(Freqを0にしてGainを上げるとプリアンプのような働きになります。)

● Q
Freqで設定した周波数を中心に前後どれくらいの周波数を巻き込んで変化させるかの値です。
Q値が高いほど影響を受ける帯域幅は狭くなります。
例えばQ値を4.3などにすると帯域幅は非常に狭くなるため、不自然に聞こえる可能性があります。
(Q値を高くしてGainを下げることで特定の周波数をピンポイントで減らし、ノイズフィルターのような感じにも使えます)
0.6から1.0の間のかなり穏やかな値で設定すると良い感じになります。

● Gain
増幅値で-10〜20までの間で設定します。
```

ゲームプレイ中にイコライザーをON/OFFしたい場合は「[イコライザーのリアルタイムON/OFFしたい場合の手順](https://github.com/game-de-it/plumOS/blob/main/documentation/EQ.md)」を参考にしてください


### ●plumOS 超省電力設定
FCやGBなど負荷が少ないゲームを遊ぶ際に、CPUクロックを400MHzまで落として省電力化する手順を記します。  
※ゲームによっては不安定になる可能性があるのでご注意を  


ESの画面からSTARTボタンを押してメニューを出して「システム設定」を開いて下記設定をします。  

- 「スケーリングガバナ選択」を「POEWER SAVE」を選択します　　
- 「GPUパフォーマンスプロファイル」を「BATTERY FOCUS」を選択します
- 「WIFI 省電力を有効」をONにする

---
以上
