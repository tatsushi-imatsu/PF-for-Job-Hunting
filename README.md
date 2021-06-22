![pf_infra_sample](https://user-images.githubusercontent.com/79815224/122870286-6b963e00-d368-11eb-9d56-ea31adc639a0.jpg)
# Word Share ~ word-sharing community ~

## サイト概要

マイアカウントを新規登録後、言葉の単語と意味をセットで投稿することが出来ます。
投稿される言葉に対して、いいねを押したりコメントすることも可能です。
また、気になるユーザをフォローすることも可能です。（DMも可能です）
SNSサイトとして、コミュニティを形成出来るサイトとなっております。

### サイトテーマ

多くの言葉との出会いを通じて、コミュニティを築こう！

### テーマを選んだ理由

コロナ禍で海外渡航が制限されている為、海外に住む人々との交流機会が失われている状況です。
現状を解決する糸口として、本サイト内で単語を共有してコミュニケーションを取ることで、少しでも交流機会を設けることが狙いです。
単語を自由に投稿してシェアすることで、少しずつ言葉の壁を乗り越えて親交を深めて頂けたらと思います。

### ターゲットユーザ

母国語が日本語もしくは英語である人（両言語に自信がなくても、アウトプットして上達したい方も大歓迎です！）

### 主な利用シーン

日常生活の隙間時間

## 設計書

### ER 図 ・フレームワーク
https://drive.google.com/file/d/1c2kzKYyu3rY8TD4TYxdWG4sLSQUa-7v1/view?usp=sharing

### DBテーブル一覧・アプリケーション詳細設計（導入したGemも記載）
https://drive.google.com/file/d/1_-IBkZtTZt4xw4hNAKVuZCsIR6ugVWhp/view?usp=sharing

## DMM WEBCAMP チャレンジ実装+オリジナル実装一覧

https://docs.google.com/spreadsheets/d/1p1wmzeqmyB4RDidsBhm17kwPRrbDvbp1elCcvzbbxYk/edit?usp=sharing

## 機能紹介
<img width="1440" alt="スクリーンショット 2021-05-30 14 28 24" src="https://user-images.githubusercontent.com/79815224/120093255-0168ef80-c154-11eb-88a7-8c5426d05134.png"><br>
#### ・言葉と意味をセットで投稿できます。
#### ・総合ランキングでは全体のいいね数が多い順番で表示されます。
#### ・マイランキングでは、ログインユーザーの投稿の中でいいねが多い順番に表示されます。
#### ・「この単語ってみんなはどういう解釈で使っているのかな？」という時に単語を検索出来るようにしました。
#### ・各単語をクリックすることで、単語の意味と他のユーザーのコメントをチェックすることが出来ます。<br><br>

<img width="1440" alt="スクリーンショット 2021-05-30 14 29 45" src="https://user-images.githubusercontent.com/79815224/120093258-062da380-c154-11eb-83e4-c08d7e1d0f7e.png"><br>
#### ・マイページでは、フォロー・フォロワー数といった会員情報の確認と編集が可能です。
#### ・他のユーザーがログインユーザーの投稿に対しいいね・コメント・フォローした際には、添付した画面のように通知ボタンの左側に黄色いマークを表示させ、新着の通知があることを伝える実装にしました。
#### ・ユーザー情報の下部には、ユーザーがいいねをした他のユーザーの投稿を表示するように実装して、単語を共有するというサイトコンセプトに合わせた仕様に仕上げました。<br><br>

<img width="1440" alt="スクリーンショット 2021-05-30 14 30 52" src="https://user-images.githubusercontent.com/79815224/120093261-09c12a80-c154-11eb-8ccb-ffdb0441a839.png"><br>
#### ・ログインユーザーがフォローしているユーザーにDMが出来るように実装しました。DMをした際にも、DMした相手に対して新着の通知が届くように実装しました。<br><br>
### アピールポイント
通知機能・DM機能・Action mailerを使用したメール実装（問い合わせ・ユーザーが退会した際の管理人へのメールや1日おきに通知メッセージが３件以上のユーザーに対する自動配信メール）になります。また、言葉を通じて多くのユーザーがコミュニケーション出来るように、ユーザーの一覧が可能なviewページやユーザーを直接検索する実装を極力避けるような設計をしました。<br><br>
## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

## インフラ構成図
![pf_infra_sample](https://user-images.githubusercontent.com/79815224/122870303-7224b580-d368-11eb-9f66-beff4246145e.jpg)<br><br>
その後、Github Actionsを使用してデプロイの自動化を設定しました。

## 使用素材

- https://ja.cooltext.com
- https://pixabay.com/ja/
- https://www.pakutaso.com/
- https://gratisography.com/
