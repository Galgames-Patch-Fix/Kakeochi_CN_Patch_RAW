
■AvgSystem系
・AvgSystem.s				AVGライブラリの根幹部分。AVGCreate、AVGFreeで開始と終了を行う。
・AvgSystem_Custom.s		AVGライブラリの制御部分。
・AvgSystem_MovieObject.s	ムービー(OggTheora)制御スクリプト。
・AvgSystem_SelectObject.s	選択肢制御スクリプト。
・AvgSystem_SceneSkip.s		シーンスキップ機能。
・window\					画面インターフェイスリソースフォルダ
・select\					選択肢リソースフォルダ
・SceneSkip.b				シーンスキップ時のアニメーション

■ImoScripter系
・ImoScripter.s				ImoScripterライブラリの根幹部分。
・ImoScripter_Base.s		ImoScripter汎用関数など
・ImoScripter_IndexList.s	インデックス機能（次のメッセージにボイスがあるかなど）
・ImoScripter_Format.s		スクリプトフォーマット解析。
・ImoScripter_Sentence.s	センテンス管理・フェード処理。
・ImoScripter_Image.s		背景などの画像。
・ImoScripter_Chara.s		立ち絵。
・ImoScripter_Chara8e.s		８要素立ち絵。
・ImoScripter_Message.s		メッセージウインドウ。
・ImoScripter_NameText.s	名前表示。
・ImoScripter_Music.s		ＢＧＭ。
・ImoScripter_Sound.s		効果音。
・ImoScripter_Face.s		フェイスウインドウ。

■設定ファイル
・Setting.txt				AVGSystem,ImoScripter設定ファイル。（※設定はだいたいココ）

■ImoScripter(GUI)出力ファイル
GUIツールがはき出す設定ファイルをリネームしたもの。
プロジェクトファイルと連動して自動的に上書き更新されます。
手動で弄っても上書きされてしまうので注意してください。

・ProjectObjects.txt				オブジェクト構成
・ProjectSetting.txt				プロジェクト設定の一部出力
・ImoScripter_Template_???.txt		テンプレート定義ファイル
・ImoScripter_FadeEventList.txt		フェードイベント定義ファイル
・ImoScripter_NameColorList.txt		名前の色設定定義ファイル
・ImoScripter_RepTextList.txt		テキストの置換処理定義ファイル
・ImoScripter_CharaPosList.txt		立ち絵の補正座標定義ファイル
・ImoScripter_ExtentionList.txt		立ち絵アクションの補正座標定義ファイル
・ImoScripter_Face_PosList.txt		フェイス画像の補正座標定義ファイル
・ImoScripter_Face_RepFile.txt		フェイス画像のファイル名置換定義ファイル
・ImoScripter_Face_RepID.txt		フェイス画像の検索ID名置換定義ファイル
・ImoScripter_FilterList.txt		画像フィルタ効果定義ファイル


■input/outputマスク値
シーンスキップで表示を隠す都合上、以下のようになっています。
ImoScripterObject(Image,Chara...)..$01
ImoScripterSystem(Message,Name..)..$08
MessageWIndow-SystemButton..$10
SelectButton..$80

EngineObjectDefault..$FF

