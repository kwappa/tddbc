# TDDBC in dwango vol.1
* 2011-08-05 at dwango

## お題：スタッククラスを作れ！

### 仕様
* boolean isEmpty()
 * スタックが空かどうかを返す
* int size()
 * スタックに格納されている値の数を返す
* vold push(int value) [※2]
 * スタックに値を積む
* void pop() [※1]
 * スタックの一番上の値を取り除く
* int top() [※1]
 * スタックの一番上の値を返す
* int maxSize()
 * スタックの深さを返す

#### 備考
* スタックの深さは16
* [※1] => スタックが空で呼ぶと例外発生
 * Java : java.nio.BufferUnderFlowException
 * <del>Java : java.util.EmptyStackException</del>
  * 【訂正：2011-08-10】対称性のため変更しました。
 * PHP  : UnderflowException
 * Ruby : RangeError
* [※2] => スタックがいっぱいの状態で呼ぶと例外発生
 * Java : java.nio.BufferOverflowException
 * <del>Java : java.lang.StackOverflowException</del>
  * 【訂正：2011-08-10】存在しない例外だったため訂正しました。
 * PHP  : OverflowException
 * Ruby : RangeError
* 使用禁止メソッド
 * array_\*\*\*()
  * コレクションを動的に操作する
 * count()
  * コレクションの数を返す
