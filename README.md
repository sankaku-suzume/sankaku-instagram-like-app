# Instagram風アプリ

<img src="images/insta-like.gif" width="600">

<a href="https://sankaku-instagram-like-app-1748b8f8cf08.herokuapp.com/" target="_blank" rel="noopener noreferrer">アプリへのリンク</a>

## このアプリについて

スクールの課題として作成したInstagram風アプリです。<br/>
課題は要件とデザインが提示されるのみで手本のコードはなく、自分で考えて設計・実装する形式でした。<br/>
画像と本文の投稿機能、いいね・フォロー機能、タイムライン表示などを実装しています。

## 主な使用技術

![Static Badge](https://img.shields.io/badge/Ruby-3.3.2-red)
![Static Badge](https://img.shields.io/badge/Rails-7.2.2.1-red)
![Static Badge](https://img.shields.io/badge/HTML5-orange)
![Static Badge](https://img.shields.io/badge/CSS3-blue)
![Static Badge](https://img.shields.io/badge/HAML-brown)
![Static Badge](https://img.shields.io/badge/Sass-purple)
![Static Badge](https://img.shields.io/badge/jQuery-3.7.1-blue)

![Static Badge](https://img.shields.io/badge/Devise-4.9.4-red)
![Static Badge](https://img.shields.io/badge/RSpec-red)

![Static Badge](https://img.shields.io/badge/PostgreSQL-blue)
![Static Badge](https://img.shields.io/badge/Webpacker-green)
![Static Badge](https://img.shields.io/badge/axios-1.9.0-blue)
![Static Badge](https://img.shields.io/badge/Sidekiq-red)
![Static Badge](https://img.shields.io/badge/Redis-red)
![Static Badge](https://img.shields.io/badge/Heroku-purple)
![Static Badge](https://img.shields.io/badge/Git-orange)
![Static Badge](https://img.shields.io/badge/GitHub-black)
![Static Badge](https://img.shields.io/badge/VSCode-blue)

<br>
## アプリ機能

| 機能           | 詳細                                                                                                                                                                                                         |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 記事投稿     | 写真とテキストを投稿できる。写真は3枚まで対応。                                                                                                             |
| いいね       | 記事ごとに「いいね」を付与できる。                                                                                                                                                           |
| コメント       | 記事にコメントを投稿できる。<br>「＠ユーザー名」でメンションすると相手の登録E-mailに通知される。                                                                                                                                                           |
| シェア       | 自分のXに記事をシェアできる。                                                                                                                                                        |
| フォロー    | 特定のユーザーをフォローできる。フォローしたユーザーの投稿はタイムラインにに表示される。         
| タイムライン | フォローしているユーザーの投稿と、24時間以内に作成された投稿の中で「いいね」が多い投稿を表示 |

<br>
    
## データベース設計
```mermaid
erDiagram
  USERS ||--o| PROFILES : has
  USERS ||--o{ ARTICLES : writes
  USERS ||--o{ COMMENTS : writes
  USERS ||--o{ LIKES : gives
  USERS ||--o{ RELATIONSHIPS : "follows (follower)"
  USERS ||--o{ RELATIONSHIPS : "followed by (following)"
  ARTICLES ||--o{ COMMENTS : has
  ARTICLES ||--o{ LIKES : receives

  USERS {
    bigint id PK
    string email
    string encrypted_password
    string account
    datetime created_at
  }
  PROFILES {
    bigint id PK
    bigint user_id FK
    string nickname
    text introduction
    integer gender
    date birthday
    boolean subscribed
  }
  ARTICLES {
    bigint id PK
    bigint user_id FK
    text content
    datetime created_at
  }
  COMMENTS {
    bigint id PK
    bigint user_id FK
    bigint article_id FK
    text content
  }
  LIKES {
    bigint id PK
    bigint user_id FK
    bigint article_id FK
  }
  RELATIONSHIPS {
    bigint id PK
    bigint follower_id FK
    bigint following_id FK
  }
```
<br>

## 各機能の詳細

### 記事一覧・タイムライン
<img src="images/articles.png" width="300">

- 左上のリストボタン・ホームボタンで記事一覧とタイムライン表示を切り替え
- タイムラインにはフォローしているユーザーの投稿と、24時間以内に投稿された記事のなかでいいねが多いものを表示
- ハートボタンをクリックで「いいね」を付与・解除
- ふきだしボタンは投稿のコメントページへリンク
- シェアボタンで自分のXに記事をシェア
- 各記事のいいね数といいねをしたユーザーをランダムに表示
- 記事のユーザーアイコンからプロフィールへリンク

### 記事の投稿
<img src="images/post.png" width="300">

- テキストと写真を投稿
- 写真はファイルを選択（複数選択可）

### コメント
<img src="images/comment.png" width="300">

- 記事に対しコメントを投稿できます。

### プロフィール
<img src="images/profile.png" width="300">

- 右上のボタンでフォロー・フォロー解除ができます。
- 自分のプロフィールの場合、アバター画像をクリックすると画像の変更ができます。
- 投稿数、フォロー・フォロワー数、これまでの投稿写真が表示されます。
- フォロー・フォロワー数をクリックすると、その一覧が見れます。

