# plumOS
[Click here for the English version of the explanation page](./README_EN.md)  

  <img src="./distributions/plumOS/logos/jelos-logo.png" width="240">  

## 目次
右上にある「三」アイコンをクリックすると目次が表示されます。  

<img src="./documentation/plumOS_sc03.png" width="700">  

## 特徴
JELOSをベースとした実験的なディストリビューションです。  

## ダウンロード
画面右側のメニューの「Releases」から.img.gzファイルをダウンロードできます。  
 <img src="./documentation/plumOS_sc01.png" width="400">　<img src="./documentation/plumOS_sc02.png" width="400">  

## 既知の問題
- picoarchの問題
  - fastforwardができるコア・できないコアがある
- Retroarchの録画機能の問題
  - 録画機能にバグがあり一般的な手順では正常に録画できない

## 謝辞
- オリジナルのJELOS開発チームに感謝と敬意を表します。
- plumOSロゴ＆スプラッシュ画像の提供者 [ Xアカウント : JLさん @JL_0w0] ありがとうございます！
- Emulationstationの日本語化　提供者 [ Xアカウント : unknown優さん @46_un_known] ありがとうございます！
  - ブログURL [https://ameblo.jp/unknown-gra/](https://ameblo.jp/unknown-gra/)

## 更新情報
- [NEW] β版 Ver 0.5をリリース！  
- [レトロゲームエンジン「Pyxel」に対応しました](https://github.com/kitao/pyxel)
  - ファイルの拡張は.py .pyxapp .editに対応しています 
  - エディターを起動する場合は 「<任意のファイル名>.edit  (例 hogehoge.edit)」という空っぽのファイルを「/storage/roms/pyxel」フォルダに置いてから実行します
    - エディターのセーブファイルは「/storage/.config/.pyxel/save」フォルダの配下にあります
  - 既知の問題 
    - ESCキー(SELECTボタン)で終了できないゲーム・アプリがあります
      - リセットボタンを押していただくか、SSH接続して "killall -9 pyxel" を実行してください 
    - ゲームによってはデフォルトのキーマップでは操作できない場合があります
      - キーマップの変更方法はこちら

## 特徴
### ●基本情報
- デフォルトでEmulationstation、Retroarch、ppsspp-sa(スタンドアローン版)が日本語に設定されています
- Retroarchの設定およびHotkeyを自由に変更可能です
- SDカード内の「/storage/roms/scripts」フォルダに置かれたシェルスクリプトを実行可能です
  - kuran_kuranさん [ Xアカウント : @kuran_kuran ] の「けものローグ」をプレイできます  
[https://github.com/kuran-kuran/KemonoRogue](https://github.com/kuran-kuran/KemonoRogue)
- イコライザーによってスピーカーから出る音の音質を向上させています
- オフラインアップデートに対応(Ver0.2から対応)
  - /storage/.updateにVer0.3以降のアプデファイルを置いて、本体再起動することでアップデートが可能です

### ●romsフォルダーの自動作成
ESの画面からSTARTボタンを押してメニューを出して「システム設定」→「ゲームディレクトリの作成」を実行すると、nesやsnesなどのフォルダがromsフォルダ内に生成されます。  

### ●plumOS 対応エミュレータ
plumOSはJELOSがベースですので、JELOSのwikiから左側メニューの「System」セクションから、各エミュレータの情報(対応拡張子など)を確認できます。  
- JELOS wiki [https://jelos.org/](https://jelos.org/)

### ●picoarchの仕様
- セレクトボタン＋スタートボタンでメニューが開きます
  - オプションメニューで設定を変更したら必ず「save config」をしてください
  - 設定項目によってはpicoarchの再実行が必要になりますので、設定をセーブするのを忘れずに
- picoarchに関連するファイルやセーブデータは「/storage/.config/.picoarch/」に保存されます
  - samba接続の場合は「config」フォルダ内に「.picoarch」があります
- picoarch HDとLDの利用方法
  - エミュレーターセクション全体の設定の場合  
ROM選択画面で「セレクトキー → システム詳細設定 → エミュレーター」の順に進み、「picoarch_HD」と「picoarch_LD」を選択します。 
  - ROMごとの設定  
適当なROMファイルを選択して「Xボタン → このゲームの詳細設定 → エミュレーター」の順に進み、「picoarch_HD」と「picoarch_LD」を選択します。  エミュレーターセクション全体の設定よりもこの設定が優先されます。
- picoarch対応コア一覧  

| cores name | type | 
|:-----------|------------:|
| beetle_ngp_libretro.so  | neogeo pocket(color) |
| fake-08_libretro.so | pico-8 |  
| gearsystem_libretro.so | gamegear,sms | 
| smsplus-gx_libretro.so| gamegear,sms |
| picodrive_libretro.so | megadrive,gamegear,sms |
| quicknes_libretro.so | nes,fds |
| fceumm_libretro.so | nes,fds |
| nestopia_libretro.so | nes,fds |
| beetle-pce-fast_libretro.so | pcengine(CD) |    
| gambatte_libretro.so | gb(color) |
| gpsp_libretro.so | gba |     
| mgba_libretro.so | gba |
| pcsx_rearmed_libretro.so  | psx |
| beetle_wswan_libretro.so | wonderswan(color) |
| fmsx_libretro.so | msx,msx2 |
| snes9x_libretro.so | snes |
| snes9x2010_libretro.so | snes |
| dosbox-pure_libretro.so | pc |    
| pokemini_libretro.so | pokemini |

- デフォルトのホットキー一覧
  - ※Button Comboに表示されているキーのみHotkeyの設定を変更可能です

| Button Combo | Action | 
|:-----------|------------:|
| SELECT+START       |        picoarchメニュー表示 |
| SELECT+R       |        ステートセーブ |
| SELECT+L     |      ステートロード |
| SELECT+R2     |      fastforward(早送りx3倍速) |
| SELECT+L2     |      FPS表示/非表示 |


### ●Retroarch仕様
- セーブファイルはromファイルと同じフォルダに作成されます(変更可能)
- ステートセーブファイルはromファイルと同じフォルダに作成されます(変更可能)
- いくつかのメニューが隠されているので「設定→ユーザーインターフェイス」から表示させることができます
- Retroarchからシェルスクリプトを実行する手順
  - SDカード内の[roms/scripts/]フォルダにシェルスクリプトを置きます
(ファイルの拡張子は .sh にして実行権限を与えてください)
- 下記の手順でもシェルスクリプトを実行可能です
  1. 「TOOLS」→「Start Retroarh (64-bit)」を実行します
  2. 「コンテンツをロード」→「お気に入り」→「scripts」の順に進み、シェルスクリプトを選択してください
- RetroArchのホットキー
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
| SELECT+十字キーの←       |        EQのON/OFF |

### pyxelのキーマップ設定変更手順
下記のパスにあるキーマップを定義しているファイルを編集します
- 「/storage/.config/.pyxel/default.gptk」  

「default.gptk」は下記のような内容になっており、「コントローラー側 = キーボード(マウス)側」という書式になってます。  

例えばコントローラ側のAボタンにキーボードのzを割り当てる場合は「a = z」と定義します。  
コントローラ側の「back」は「SELECTボタン」、「start」は「STARTボタン」を意味しています。  

キーボード側を「none」にすると、OS側が定義しているコントローラーの信号が出力されます。
ゲーム側がコントローラ操作を主体としているなら「none」にして、キーボード操作を主体としているならキーボードのキーを設定してあげます。  

デフォルトでは右スティックがマウス操作になってますが、左スティックをマウス操作に書き換えることも可能です。   
マウスの感度を変える場合は「mouse_delay」の数値を調整してください。   
```
back = esc
start = enter
a = none
b = none
x = none
y = none
up = none
down = none
left = none
right = none

left_analog_as_mouse = false
right_analog_as_mouse = false

left_analog_up = up
left_analog_down = down
left_analog_left = left
left_analog_right = right

right_analog_up = mouse_movement_up
right_analog_down = mouse_movement_down
right_analog_left = mouse_movement_left
right_analog_right = mouse_movement_right
l1 = mouse_right
r1 = mouse_left

deadzone_y = 2000
deadzone_x = 2000
deadzone_triggers = 10
mouse_scale = 1024
mouse_delay = 64
```
### ●イコライザーについて
「SELECT+十字キーの←」でEQのON/OFFができます。  
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

コマンドラインからイコライザーをON/OFFしたい場合は「[イコライザーのリアルタイムON/OFFしたい場合の手順](https://github.com/game-de-it/plumOS/blob/main/documentation/EQ.md)」を参考にしてください


### ●plumOS 超省電力設定
FCやGBなど負荷が少ないゲームを遊ぶ際に、CPUクロックを400MHzまで落として省電力化する手順を記します。  
※ゲームによっては不安定になる可能性があるのでご注意を  


ESの画面からSTARTボタンを押してメニューを出して「システム設定」を開いて下記設定をします。  

- 「スケーリングガバナ選択」を「POEWER SAVE」を選択します　　
- 「GPUパフォーマンスプロファイル」を「BATTERY FOCUS」を選択します
- 「WIFI 省電力を有効」をONにする

# Tips
### ●Emulationstationのデフォルトthemeに時計を表示させる方法
1. 下記URLからzipファイルをダウンロードして解凍します
2. 解凍したフォルダをSDカード内の「themes」フォルダにコピーします  
  (/storage/.emulationstation/themes)  
3. emulationstationの「UI設定→テーマ」の順に進み「es-theme-art-book-next-plumOS」を選択してください


[https://github.com/game-de-it/plumOS/blob/main/packages/themes/es-theme-art-book-next/sources/es-theme-art-book-next-plumOS.zip](https://github.com/game-de-it/plumOS/blob/main/packages/themes/es-theme-art-book-next/sources/es-theme-art-book-next-plumOS.zip)  

### ●デフォルトthemeをシンプルに表示させる方法
emulationstationの「UI設定→テーマ設定」の順に進み、下記の画像のように設定してください。
  - この設定をするとサムネイル画像は表示されなくなります  

<img src="./documentation/plumOS_sc08.jpg" width="400">
<img src="./documentation/plumOS_sc09.jpg" width="400">

---
以上
