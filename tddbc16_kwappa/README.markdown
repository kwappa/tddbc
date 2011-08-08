# TDDBC Tokyo 1.6

## Tickets

### [TASK] T16MAIN-1 putでkeyとvalueを追加し、dumpで一覧表示、getでkeyに対応するvalueを取得できる
* put で keyとvalueを追加する
  * keyにnullをわたすと例外が発生
  * valueのnullは許容する
* dumpで登録されている一覧を表示
* getで指定したkeyのvalueを取得

### [TASK] T16MAIN-2 deleteで指定のkey-valueを削除
* deleteで指定したkeyとvalueを削除する
* 存在しないkeyが渡されたら何もしない
* nullを渡すと例外が発生する

### [TASK] T16MAIN-3 putの引数に既に存在するkeyが指定された場合、valueのみを更新する
* putで既に存在するkeyの場合はvalueを更新する

### [TASK] T16MAIN-4 keyとvalueのセットを一度に複数追加できる
* 複数のkeyとvalueをまとめて追加できるようにする
  * 同じキーが複数ある場合、一番最後に指定されたものが使用される。
  * 既に存在するキーがある場合も、今回指定したものが優先される。
  * 指定した引数の中にnullのキーがある場合、例外を投げ、状態を元に戻す。

### [TASK] T16MAIN-5 putの引数でkey,value,date(時刻情報)を渡し、dumpを時間順に出力するように仕様変更
* putの引数でkey,value,date(時刻情報)を渡せるようにする。
* また、dump関数は時刻が新しい方から古い方へ順にkey、valueを出力するように変更する。
* 引数に複数指定して追加する関数の場合、後ろにあるものほど新しいとみなす。

### [TASK] T16MAIN-6 dumpの引数に時刻を指定できるようにする。dump関数は時刻が指定された場合、指定時刻以降のデータのみを表示する
* dumpの引数に時刻（秒単位）を指定できるようにする。
* dump関数は時刻が指定された場合、指定時刻以降のデータのみを表示する

### [TASK] T16MAIN-7 deleteの引数に分・秒を指定できる。deleteは分を指定された場合、「現在時刻-引数の分・秒」よりも古いデータをすべて削除する
* deleteの引数に分・秒を指定できる。deleteは分・秒を指定された場合、データの時刻情報が「現在時刻-引数の分・秒」よりも古いデータをすべて削除する

### [BUG] T16MAIN-8 T16MAIN-5のAPI変更
* putの引数から時刻を取り除き、現在時刻を使用するようにする。
